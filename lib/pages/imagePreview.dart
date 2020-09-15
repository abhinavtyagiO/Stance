import 'package:flutter/material.dart';
import 'dart:io';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tflite/tflite.dart';

class ScoreSide{
  int slouch;
  int kyphotic;
  int lordotic;
}

class PreviewImageScreen extends StatefulWidget {
  static String id = 'imagePreview';
  final String imagePath;

  PreviewImageScreen({this.imagePath});


  @override
  _PreviewImageScreenState createState() => _PreviewImageScreenState();
}

class _PreviewImageScreenState extends State<PreviewImageScreen> {
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

  ScoreSide getScores(recognitions){
    //recognitions[0].keypoints;
    var shldr=[0,0],hip=[0,0],knee=[0,0],ear=[0,0];
    for(var v in recognitions[0]['keypoints'].values){
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
    ScoreSide scores;
    scores.slouch=slch_scr.toInt();
    scores.kyphotic=kypho_scr.toInt();
    scores.lordotic=lordo_scr.toInt();
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
                  'FRONT POSE',
                  style: TextStyle(
                    fontFamily: 'roboto',
                    color: Hexcolor('#ffffff'),
                    fontSize: ScreenUtil().setWidth(14),
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
                        Icons.refresh,
                        color: Hexcolor('#ffffff'),
                      ),
                      padding: EdgeInsets.all(15.0),
                      shape: CircleBorder(),
                    ),
                  ),
                  Center(
                    child: FloatingActionButton(
                      onPressed: ()async {
                        //pass image to tensorflow model
                        var recognitions = await Tflite.runPoseNetOnImage(
                          path: widget.imagePath,
                          numResults: 2,
                        );
                        print(recognitions);
                        ScoreSide scoresSide=getScores(recognitions);
                        
                      },
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
