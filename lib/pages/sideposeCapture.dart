import 'dart:math';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'sideposeimagePreview.dart';
import 'package:dotted_line/dotted_line.dart';


class SideCapture extends StatefulWidget {
  static String id = 'sidecapture';
  @override
  _SideCaptureState createState() => _SideCaptureState();
}

class _SideCaptureState extends State<SideCapture> {

  CameraController controller;
  List cameras;
  int selectedCameraIdx;
  String imagePath;

  @override
  void initState() {
    super.initState();
    

    availableCameras().then((availableCameras) {
      cameras = availableCameras;
      if(cameras.length > 0) {
        setState(() {
          selectedCameraIdx = 0;
        });

        //alert
        showAlert(context);

        initCameraController(cameras[selectedCameraIdx]).then((void v) {});
      } else {
        print("No Camera Available");
      }
    }).catchError((err) {
      print("Error: $err.code\nError Message: $err.message");
    });
  }
  
  Future initCameraController(CameraDescription cameraDescription) async {
  if (controller != null) {
    
    await controller.dispose();
    
    
  }

  // 3
  controller = CameraController(cameraDescription, ResolutionPreset.high);

  // If the controller is updated then update the UI.
  // 4
  controller.addListener(() {
    // 5
    if (mounted) {
      setState(() {});
    }

    if (controller.value.hasError) {
      print('Camera error ${controller.value.errorDescription}');
    }
  });

  // 6
  try {
    await controller.initialize();
  } on CameraException catch (e) {
    showCameraException(e);
  }

  if (mounted) {
    setState(() {});
  }
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
            crossAxisAlignment: CrossAxisAlignment.start,
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
              Expanded(
                child: cameraPreviewWidget(),
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
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  cameraTogglesRowWidget(),
                  captureControlRowWidget(context),
                  Spacer()
                ],
              ),
              SizedBox(height: ScreenUtil().setHeight(65)),
            ],
          ),
        ),
      ),
    );
  }

  //show ALERT
  void showAlert(BuildContext context) {
    showDialog(context: context,
    barrierDismissible: false,
    builder: (context) => Padding(
      padding: EdgeInsets.only(
        top: ScreenUtil().setHeight(136),
      ),
          child: AlertDialog(
            actionsOverflowDirection: VerticalDirection.up,
            scrollable: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(ScreenUtil().setWidth(20)),
        ),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('How to pose for picture?',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                  fontSize: ScreenUtil().setSp(16),
                  color: Hexcolor('#000000'),
                  letterSpacing: 0,
                ),
                ),
                SizedBox(height: ScreenUtil().setHeight(13),),
            Text(
              'Don\'t try to stand extra erect, be relaxed and in your natural posture. Show side profile and align your eyes and knees to the respective marked lines.',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontFamily: 'roboto',
                fontSize: ScreenUtil().setSp(14),
                height: 1.4,
                letterSpacing: 0,
                color: Hexcolor('#000000').withOpacity(0.7),
              ),
            ),
            SizedBox(height: ScreenUtil().setHeight(21),),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: ScreenUtil().setWidth(148),
                  child: Center(
                    child: Image.asset('assets/images/stance.png'),
                  ),
                ),
              ],
            ),
            Center(
              child: FlatButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(ScreenUtil().setWidth(20.0)),
              ),
              color: Hexcolor('#ffffff'),
              textColor: Hexcolor('#fe3786'),
                      onPressed: () {
                Navigator.of(context).pop();
                      },
                      child: Text('CONTINUE',
                      style: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
              fontSize: ScreenUtil().setSp(14.0),
              letterSpacing: 0,
                      ),
                      ),
                  ),
            ),
          ],
        ),
      ),
    ),
    );
  }

  /// Display Camera preview.
  Widget cameraPreviewWidget() {
    if (controller == null || !controller.value.isInitialized) {
      return Text(
        'Loading',
        style: TextStyle(
          color: Colors.white,
          fontSize: ScreenUtil().setSp(20.0),
          fontWeight: FontWeight.w900,
        ),
      );
    }
    return Stack(
      children: [
         Positioned.fill(
          child: AspectRatio(
            aspectRatio: 3 / 4,
            child: FittedBox(
            fit: BoxFit.fitWidth,
              child: Container(
              width: ScreenUtil.screenWidth,
              height: ScreenUtil.screenWidth / controller.value.aspectRatio,
              child: CameraPreview(controller),
      ),
        ),
            ),
         ),
         Positioned.fill(
           child: Padding(
             padding: EdgeInsets.only(
               top: ScreenUtil().setHeight(38),
               bottom: ScreenUtil().setHeight(143.5),
             ),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Padding(
                       padding: EdgeInsets.only(
                         left: ScreenUtil().setWidth(23.5),
                         bottom: ScreenUtil().setHeight(5.5),
                       ),
                       child: Text(
                          'Eyes',
                          style: TextStyle(
                            fontFamily: 'roboto',
                            fontSize: ScreenUtil().setSp(10),
                            color: Hexcolor('#ffffff'),
                            letterSpacing: 0,
                          ),
                        ),
                     ),
                      DottedLine(
                        dashColor: Hexcolor('#ffffff'),
                      ),
                   ],
                 ),
                 Padding(
                   padding: EdgeInsets.only(
                     left: ScreenUtil().setWidth(24),
                     bottom: ScreenUtil().setHeight(120),
                   ),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Padding(
                             padding: EdgeInsets.only(
                               bottom: ScreenUtil().setHeight(16),
                             ),
                             child: Container(
                               height: ScreenUtil().setHeight(20),
                               child: Image.asset('assets/images/arrow.png'),
                               ),
                           ),
                           Text(
                             'Face',
                             style: TextStyle(
                               fontFamily: 'Montserrat',
                               fontSize: ScreenUtil().setSp(16),
                               color: Hexcolor('#ffffff'),
                               fontWeight: FontWeight.bold,
                             ),
                           ),
                           Text(
                             'this side',
                             style: TextStyle(
                               fontFamily: 'Montserrat',
                               fontSize: ScreenUtil().setSp(16),
                               color: Hexcolor('#ffffff'),
                                fontWeight: FontWeight.bold,
                             ),
                           ),
                         ],
                       ),
                      //  Image.asset('assets/images/arrow.png'),
                     ],
                   ),
                 ),
                 Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Padding(
                       padding: EdgeInsets.only(
                         left: ScreenUtil().setWidth(23.5),
                         bottom: ScreenUtil().setHeight(5.5),
                       ),
                       child: Text(
                          'Knees',
                          style: TextStyle(
                            fontFamily: 'roboto',
                            fontSize: ScreenUtil().setSp(10),
                            color: Hexcolor('#ffffff'),
                            letterSpacing: 0,
                          ),
                        ),
                     ),
                      DottedLine(
                        dashColor: Hexcolor('#ffffff'),
                      ),
                   ],
                 ),
               ],
             ),
           ),
         ),
      ],
          
    );
  }
  /// Display the control bar with buttons to take pictures
  Widget captureControlRowWidget(context) {
    return Expanded(
      child: Align(
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
               FloatingActionButton(
                 child: Icon(Icons.camera, color: Hexcolor('#000000'),),
                  backgroundColor: Hexcolor('#ffffff'),
                  onPressed: () {
                    onCapturePressed(context);
                  }
                  ),
          ],
        ),
      ),
    );
  }
  /// Display a row of toggle to select the camera (or a message if no camera is available).
  Widget cameraTogglesRowWidget() {
    if (cameras == null || cameras.isEmpty) {
      return Spacer();
    }

    CameraDescription selectedCamera = cameras[selectedCameraIdx];
    CameraLensDirection lensDirection = selectedCamera.lensDirection;

    return Expanded(
      child: Container(
        margin: EdgeInsets.only(
          left: ScreenUtil().setWidth(30),
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: RawMaterialButton(
              onPressed: onSwitchCamera,
              child: Icon(getCameraLensIcon(), color: Hexcolor('#ffffff'),),
              shape: CircleBorder(),
              padding: EdgeInsets.all(ScreenUtil().setWidth(15),
        ),
    ),),
      )
    );
  }
  IconData getCameraLensIcon() {
    return Icons.loop;
  }
  void onSwitchCamera() {
    selectedCameraIdx =
    selectedCameraIdx < cameras.length - 1 ? selectedCameraIdx + 1 : 0;
    CameraDescription selectedCamera = cameras[selectedCameraIdx];
    initCameraController(selectedCamera);
  }

  onCapturePressed(context) async {
    try {
      final p = await getTemporaryDirectory();
      final name = DateTime.now();
      final path = "${p.path}/$name.png";

      await controller.takePicture(path).then((value) {
        print('here');
        print(path);
        Navigator.push(context, MaterialPageRoute(builder: (context) =>SideposePreviewImageScreen(imagePath: path,)));
      });

    } catch (e) {
      showCameraException(e);
    }
  }

  void showCameraException(CameraException e) {
    String errorText = 'Error: ${e.code}\nError Message: ${e.description}';
    print(errorText);

    print('Error: ${e.code}\n${e.description}');
  }







}