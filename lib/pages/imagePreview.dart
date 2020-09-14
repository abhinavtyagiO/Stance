import 'package:flutter/material.dart';
// import 'package:path/path.dart';
import 'dart:io';
// import 'dart:typed_data';
// import 'package:path/path.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tflite/tflite.dart';



class PreviewImageScreen extends StatefulWidget {
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

  int getSlouchScore(recognitions){
    return 73;
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
                  //flash icon
                  Container(
                    margin: EdgeInsets.only(
                      left: ScreenUtil().setWidth(129),
                    ),
                    child: RawMaterialButton(
                      materialTapTargetSize: MaterialTapTargetSize.padded,
                      onPressed: () {
                        // Navigator.pop(context);
                      },
                      // elevation: 2.0,
                      fillColor: Hexcolor('#000000'),
                      child: Icon(
                        Icons.flash_off,
                        size: ScreenUtil().setWidth(15),
                        color: Hexcolor('#ffffff'),
                      ),
                      padding: EdgeInsets.all(15.0),
                      shape: CircleBorder(),
                    ),
                  ),
                  //timer icon
                  RawMaterialButton(
                    onPressed: () {
                      // Navigator.pop(context);
                    },
                    // elevation: 2.0,
                    fillColor: Hexcolor('#000000'),
                    child: Icon(
                      Icons.timer_off,
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
