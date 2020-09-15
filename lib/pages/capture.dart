import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'imagePreview.dart';

class Capture extends StatefulWidget {
  static String id = 'capture';
  @override
  _CaptureState createState() => _CaptureState();
}

class _CaptureState extends State {
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
    // barrierDismissible: false,
    builder: (context) => Padding(
      padding: EdgeInsets.only(
        top: ScreenUtil().setHeight(208),
      ),
      child: AlertDialog(
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
                  fontSize: ScreenUtil().setWidth(16),
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
                fontSize: ScreenUtil().setWidth(14),
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
              fontSize: ScreenUtil().setWidth(14.0),
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
      return const Text(
        'Loading',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
          fontWeight: FontWeight.w900,
        ),
      );
    }
    return Transform.scale(
          scale: 1.0,
          child: AspectRatio(
          aspectRatio: 3/4,
          child: OverflowBox(
            alignment: Alignment.center,
              child: FittedBox(
              fit: BoxFit.fitWidth,
                child: Container(
                width: ScreenUtil().setWidth(360),
                height: ScreenUtil().setWidth(360) / controller.value.aspectRatio,
                child: Stack(
                  children: <Widget>[
                    CameraPreview(controller)
                  ],
                  ),
              ),
            ),
          ),
        ),
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
              child: Icon(getCameraLensIcon(lensDirection), color: Hexcolor('#ffffff'),),
              shape: CircleBorder(),
              padding: EdgeInsets.all(ScreenUtil().setWidth(15),
        ),
    ),),
      )
    );
  }
  IconData getCameraLensIcon(CameraLensDirection direction) {
    switch (direction) {
      case CameraLensDirection.back:
        return Icons.camera_rear;
      case CameraLensDirection.front:
        return Icons.camera_front;
      case CameraLensDirection.external:
        return Icons.camera;
      default:
        return Icons.device_unknown;
    }
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
        Navigator.push(context, MaterialPageRoute(builder: (context) =>PreviewImageScreen(imagePath: path,)));
      });

    } catch (e) {
      showCameraException(e);
    }
  }

  // void onCapturePressed(context) async {
  //   // Take the Picture in a try / catch block. If anything goes wrong,
  //   // catch the error.
  //   try {
  //     // Attempt to take a picture and log where it's been saved
  //     final path = join(
  //       // In this example, store the picture in the temp directory. Find
  //       // the temp directory using the `path_provider` plugin.
  //       (await getTemporaryDirectory()).path,
  //       '${DateTime.now()}.png',
  //     );
  //     print(path);
  //     await controller.takePicture(path);

  //     // If the picture was taken, display it on a new screen
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) => PreviewImageScreen(imagePath: path),
  //       ),
  //     );
  //   } catch (e) {
  //     // If an error occurs, log the error to the console.
  //     print(e);
  //   }
  // }
  void showCameraException(CameraException e) {
    String errorText = 'Error: ${e.code}\nError Message: ${e.description}';
    print(errorText);

    print('Error: ${e.code}\n${e.description}');
  }
}




