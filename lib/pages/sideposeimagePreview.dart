import 'dart:convert';
import 'dart:io';
import 'package:StartUp/pages/report.dart';
import 'package:StartUp/pages/sideposeCapture.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tflite/tflite.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'config.dart'; 
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'dart:math';

final _prefs = SharedPreferences.getInstance();
const double radians2Degrees = 180 / pi;

class Scores{
  int textNeck;
  int kyphosis;
  int swayback;
  int knees;
}

class SideposePreviewImageScreen extends StatefulWidget {
  static String id = 'imagePreview';
  final String imagePath;
  var frontRecognition;
  

  SideposePreviewImageScreen({this.imagePath,this.frontRecognition});


  @override
  _SideposePreviewImageScreenState createState() => _SideposePreviewImageScreenState();
}

class _SideposePreviewImageScreenState extends State<SideposePreviewImageScreen> {

  


  Future loadModel() async {
    Tflite.close();
    try {
      String res;
          res = await Tflite.loadModel(
            model: "assets/posenet_mv1_075_float_from_checkpoints.tflite",
            //model: "assets/model.tflite"
            // useGpuDelegate: true,
          );
      
      print(res);
    }catch(e) {
      print({'Failed to load model.',e});
    }
  }

  @override initState(){
    super.initState();
    loadModel();
    imageCache.clear();
  }

  Scores getScores(recognitionSide, recognitionFront){
    //recognitions[0].keypoints;
    var shldr=[0.toDouble(),0.toDouble()],
        hip=[0.toDouble(),0.toDouble()],
        knee=[0.toDouble(),0.toDouble()],
        ear=[0.toDouble(),0.toDouble()];

    for(var v in recognitionSide['keypoints'].values){
      print(v);
      switch(v['part']){
        case 'leftShoulder':{
          shldr[0]=v['x'];
          shldr[1]=v['y'];
        }
        break;

        case 'rightShoulder':{
          shldr[0]=v['x'];
          shldr[1]=v['y'];
        }
        break;

        case 'leftHip':{
          hip[0]=v['x'];
          hip[1]=v['y'];
        }
        break;
        
        case 'rightHip':{
          hip[0]=v['x'];
          hip[1]=v['y'];
        }
        break;

        case 'leftKnee':{
          knee[0]=v['x'];
          knee[1]=v['y'];
        }
        break;
        
        case 'rightKnee':{
          knee[0]=v['x'];
          knee[1]=v['y'];
        }
        break;

        case 'leftEar':{
          ear[0]=v['x'];
          ear[1]=v['y'];
        }
        break;
        
        case 'rightEar':{
          ear[0]=v['x'];
          ear[1]=v['y'];
        }
        break;
      }
    }
        var left_hip = [0.toDouble(),0.toDouble()],
        right_hip=[0.toDouble(),0.toDouble()],
        left_knee=[0.toDouble(),0.toDouble()],
        right_knee=[0.toDouble(),0.toDouble()],
        left_foot=[0.toDouble(),0.toDouble()],
        right_foot=[0.toDouble(),0.toDouble()];

    for(var f in recognitionFront['keypoints'].values) {
      print(f);
      switch(f['part']) {
        case 'rightHip': {
          right_hip[0] = f['x'];
          right_hip[1] = f['y'];
        } 
        break;

        case 'rightKnee' : {
          right_knee[0] = f['x'];
          right_knee[1] = f['y'];
        }
        break;

        case 'rightFoot': {
          right_foot[0] = f['x'];
          right_foot[1] = f['y'];
        }
        break;

        case 'leftHip': {
          left_hip[0] = f['x'];
          left_hip[1] = f['y'];
        }
        break;

        case 'leftKnee': {
          left_knee[0] = f['x'];
          left_knee[1] = f['y'];
        } 
        break;

        case 'leftFoot': {
          left_foot[0] = f['x'];
          left_foot[1] = f['y'];
        }
        break;
      }
    }

    //Scores side
    double length(List<dynamic> arr1, List<dynamic> arr2) {
      return (sqrt(pow(arr1[0]-arr2[0], 2) +pow(arr1[1]-arr2[1], 2)));
    }

    var ang = acos((((ear[0]-shldr[0])*(shldr[0]-hip[0]))+((ear[1]-shldr[1])*(shldr[1]-hip[1])))/((length(ear,shldr))*(length(shldr, hip))));
    double degrees(double radians) => radians * radians2Degrees;                
    var ang_ = degrees(ang)*100/90;
    // var hipt = ((knee[0]-shldr[0])/(knee[1]-shldr[1]))*(hip[1]-knee[1])+knee[0];
    // var slch_scr = (-1)*(hipt-hip[0])/(knee[1]-shldr[1]);
    var eart = ((hip[0]-shldr[0])/(hip[1]-shldr[1]))*(ear[1]-shldr[1])+shldr[0];
    var kypho_scr = (-1)*(eart-ear[0])/(hip[1]-shldr[1]);
    var hipt_ = ((ear[0]-knee[0])/(ear[1]-knee[1]))*(hip[1]-ear[1])+ear[0];
    var lordo_scr = ((hipt_-hip[0])/(ear[1]-knee[1])).abs();

    print({ang_, eart, kypho_scr, hipt_, lordo_scr});

    //scores front
    var l_knee_t = ((left_foot[0]-left_hip[0])/(left_foot[1]-left_hip[1]))*(left_knee[1]-left_foot[1])+left_foot[0];
    var left_leg_scr = (-1)*((l_knee_t-left_knee[0])/(left_foot[1]-left_hip[1]))*250;

    var r_knee_t = ((right_foot[0]-right_hip[0])/(right_foot[1]-right_hip[1]))*(right_knee[1]-right_foot[1])+right_foot[0];
    var right_leg_scr = ((r_knee_t-right_knee[0])/(right_foot[1]-right_hip[1]))*250;

    var knock_knees_score = (left_leg_scr + right_leg_scr) / 2;

    
    Scores scores= new Scores();
    scores.textNeck=ang_.toInt();
    scores.kyphosis=kypho_scr.toInt();
    scores.swayback=lordo_scr.toInt();
    scores.knees=knock_knees_score.toInt();
    return scores;
  }
  bool showSpinner = false;


  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      width: 360,
      height: 760,
    );

    return Scaffold(
      backgroundColor: Hexcolor('#000000'),
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
              child: Container(
          child: SafeArea(
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  children: <Widget>[ 
                    RawMaterialButton(
                      onPressed: () {
                        Navigator.pushNamed(context, SideCapture.id);
                      },
                      fillColor: Hexcolor('#000000'),
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: ScreenUtil().setWidth(15),
                        color: Hexcolor('#ffffff'),
                      ),
                      padding: EdgeInsets.all(15.0),
                      shape: CircleBorder(),
                    ),
                    ],
                ),
                SizedBox(height: ScreenUtil().setHeight(5),),
                Transform.scale(
                  scale: 1.0,
                    child: AspectRatio(
                    aspectRatio: 0.68,
                       child: Container(
                          width: ScreenUtil().setWidth(360),
                  height: ScreenUtil().setWidth(760),
                        child: Image.file(File(widget.imagePath), fit: BoxFit.fitWidth)),
                  ),
                ),
                SizedBox(height: ScreenUtil().setHeight(10)),
                Center(
                  child: Text(
                    'SIDE POSE',
                    style: TextStyle(
                      fontFamily: 'roboto',
                      color: Hexcolor('#ffffff'),
                      fontSize: ScreenUtil().setSp(14),
                      letterSpacing: 0,
                    ),
                  ),
                ),
                SizedBox(height: ScreenUtil().setHeight(30)),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        left: ScreenUtil().setWidth(30),
                        right: ScreenUtil().setWidth(50),
                      ),
                      child: RawMaterialButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(SideCapture.id);
                        },
                          child: Icon(
                          Icons.replay,
                          color: Hexcolor('#ffffff'),
                        ),
                        padding: EdgeInsets.all(15.0),
                        shape: CircleBorder(),
                      ),
                    ),
                    Center(
                      child: FloatingActionButton(
                        onPressed: () async {

                          //pass image to tensorflow model
                            var recognitions=await Tflite.runPoseNetOnImage(path: widget.imagePath,
                            numResults: 2,
                              );
                              if(recognitions.length!=0){
                                setState(() {
                                  showSpinner = true;
                                });
                                var scores= getScores(recognitions[0],widget.frontRecognition);
                                var prefs=await _prefs;
                                var url = Config.backendUrl+'/api/users/scores';
                                Map<String,String> headers= new Map<String,String>();
                                headers['Content-Type']="application/json";
                                headers['x-auth-token']=prefs.getString('x-auth-token');
                                var bodyData={
                                  'textNeck': scores.textNeck,
                                  'kyphosis': scores.kyphosis,
                                  'swayback': scores.swayback,
                                  'knees': scores.knees, 
                                };
                                print(prefs.getString('x-auth-token'));

                                prefs.setInt('textNeck', scores.textNeck);
                                prefs.setInt('kyphosis', scores.kyphosis);
                                prefs.setInt('swayback', scores.swayback);
                                prefs.setInt('knees', scores.knees);
                                print(bodyData);
                                var body = jsonEncode(bodyData);
                              var response= await http.post(url,headers: headers, body: body);
                              print(response.body);
                              var bodyc=JsonDecoder().convert(response.body);
                            if(bodyc['success']==true){
                              print('success');
                              setState(() {
                                  showSpinner = false;
                                });
                                Navigator.pushNamedAndRemoveUntil(context, Report.id, (Route<dynamic> route) => false);
                                
                            }
                            else{
                              print('e');
                              //todo nvigate to report
                                //TODO handle this
                              }
                              }else{
                                // Scaffold.of(context).showSnackBar(SnackBar(
                                // content: Text("Image not usable. Try Again."),
                                // ));
                                //todo show toast image not usable
                                Fluttertoast.showToast(
                                    msg: "Image not usable. Try Again.",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1
                                );
                                 Navigator.of(context).pushNamed(SideCapture.id);
                              }
                            
                        }
                          
                        ,
                      child: Icon(Icons.check, color: Hexcolor('#ffffff'), size: ScreenUtil().setWidth(30),),
                      backgroundColor: Hexcolor('#fe3786'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  }