import 'dart:convert';
import 'dart:io';
import 'package:StartUp/pages/report.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tflite/tflite.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'config.dart'; 
import 'package:http/http.dart' as http;

final _prefs = SharedPreferences.getInstance();

class Scores{
  int slouch;
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
  }

  Scores getScores(recognitionSide, recognitionFront){
    //recognitions[0].keypoints;
    var shldr=[0.toDouble(),0.toDouble()],hip=[0.toDouble(),0.toDouble()],knee=[0.toDouble(),0.toDouble()],ear=[0.toDouble(),0.toDouble()];
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
    var hipt = ((knee[0]-shldr[0])/(knee[1]-shldr[1]))*(hip[1]-knee[1])+knee[0];
    var slch_scr = (-1)*(hipt-hip[0])/(knee[1]-shldr[1]);
    var eart = ((hip[0]-shldr[0])/(hip[1]-shldr[1]))*(ear[1]-shldr[1])+shldr[0];
    var kypho_scr = (-1)*(eart-ear[0])/(hip[1]-shldr[1]);
    var hipt_ = ((ear[0]-knee[0])/(ear[1]-knee[1]))*(hip[1]-ear[1])+ear[0];
    var lordo_scr = ((hipt_-hip[0])/(ear[1]-knee[1])).abs();
    Scores scores= new Scores();
    scores.slouch=slch_scr.toInt();
    scores.kyphosis=kypho_scr.toInt();
    scores.swayback=lordo_scr.toInt();
    scores.knees=1.toInt();
    return scores;
  }


  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      width: 360,
      height: 760,
    );

    return Scaffold(
      backgroundColor: Hexcolor('#000000'),
      body: Container(
        child: SafeArea(
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                children: <Widget>[ 
                  RawMaterialButton(
                    onPressed: () {
                      Navigator.pop(context);
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
                        Navigator.of(context).pop();
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
                              var scores= getScores(recognitions[0],widget.frontRecognition);
                              var prefs=await _prefs;
                              var url = Config.backendUrl+'/api/users/scores';
                              Map<String,String> headers= new Map<String,String>();
                              headers['Content-Type']="application/json";
                              headers['x-auth-token']=prefs.getString('x-auth-token');
                              var bodyData={
                                'slouch': scores.slouch,
                                'kyphosis': scores.kyphosis,
                                'swayback': scores.swayback,
                                'knees': scores.knees, 
                              };

                              prefs.setInt('slouch', scores.slouch);
                              prefs.setInt('kyphosis', scores.kyphosis);
                              prefs.setInt('swayback', scores.swayback);
                              prefs.setInt('knees', scores.knees);
                              print(bodyData);
                              var body = jsonEncode(bodyData);
                            var response= await http.post(url,headers: headers, body: body);
                            print(response.body);
                            var bodyc=JsonDecoder().convert(response.body);
                          if(bodyc['success']==true){
                              Navigator.pushNamed(context, Report.id);
                          }
                          else{
                            //todo nvigate to report
                              //TODO handle this
                            }
                            }else{
                              // Scaffold.of(context).showSnackBar(SnackBar(
                              // content: Text("Image not usable. Try Again."),
                              // ));
                              //todo show toast image not usable
                               Navigator.of(context).pop();
                            }
                          
                      }
                        
                      ,
                    child: Icon(Icons.check, color: Hexcolor('#ffffff'), size: ScreenUtil().setWidth(30),),
                    backgroundColor: Hexcolor('#fe3786'),
                    ),
                  ),
                ],
              ),
              SizedBox(height: ScreenUtil().setHeight(65)),
            ],
          ),
        ),
      ),
    );
  }

  }