import 'package:flutter/material.dart';
// import 'package:path/path.dart';
import 'dart:io';
// import 'dart:typed_data';
// import 'package:path/path.dart';
import 'package:hexcolor/hexcolor.dart';
// import 'package:hexcolor/hexcolor.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';


class PreviewImageScreen extends StatefulWidget {
  final String imagePath;

  PreviewImageScreen({this.imagePath});


  @override
  _PreviewImageScreenState createState() => _PreviewImageScreenState();
}

class _PreviewImageScreenState extends State<PreviewImageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Hexcolor('#000000'),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
                flex: 2,
                child: Image.file(File(widget.imagePath), fit: BoxFit.cover)),
            SizedBox(height: 10.0),
            // Flexible(
            //   flex: 1,
            //   child: Container(
            //     padding: EdgeInsets.all(60.0),
                
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  }
