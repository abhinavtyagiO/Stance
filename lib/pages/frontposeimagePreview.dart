import 'dart:io';
import 'package:StartUp/pages/sideposeCapture.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tflite/tflite.dart';
import 'package:fluttertoast/fluttertoast.dart';




class FrontposePreviewImageScreen extends StatefulWidget {
  static String id = 'imagePreview';
  final String imagePath;

  FrontposePreviewImageScreen({this.imagePath});
  @override
  _FrontposePreviewImageScreenState createState() => _FrontposePreviewImageScreenState();
}

class _FrontposePreviewImageScreenState extends State<FrontposePreviewImageScreen> {
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
    imageCache.clear();
    loadModel();
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
                      onPressed: ()async {
                        //pass image to tensorflow model
                        var recognitions = await Tflite.runPoseNetOnImage(
                          path: widget.imagePath,
                          numResults: 2,
                        );
                        print(recognitions);
                        if(recognitions.length!=0){
            
                        
                          Navigator.pushNamed(context, SideCapture.id,arguments:recognitions[0]);
                          
                        }
                        else{

                          Fluttertoast.showToast(
                                  msg: "Image not usable. Try Again.",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1
                              );
                        
                          Navigator.of(context).pop();
                        }
                        
                        
                        
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
