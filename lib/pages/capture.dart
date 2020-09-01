import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class Capture extends StatefulWidget {

  List<CameraDescription> cameras;
  Capture(this.cameras);

  @override
  _CaptureState createState() {
    return new _CaptureState();
  }
}

class _CaptureState extends State<Capture> {

  CameraController controller;

  @override
  void initState() {
    super.initState();
    controller = new CameraController(widget.cameras[0], ResolutionPreset.medium);
    controller.initialize().then((_) {
      if(!mounted) {
        return;
      } setState(() {}); 
    });
  }
  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if(!controller.value.isInitialized){
      return new Container();
    }
     return new AspectRatio(aspectRatio: controller.value.aspectRatio,
    child: new CameraPreview(controller),
    );
  }
}
