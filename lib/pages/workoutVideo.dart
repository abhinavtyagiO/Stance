import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

class WorkoutVideo extends StatefulWidget {
  static String id = 'workoutVideo';
  @override
  _WorkoutVideoState createState() => _WorkoutVideoState();
}

class _WorkoutVideoState extends State<WorkoutVideo> {

  VideoPlayerController controller;
  VoidCallback listener;

  @override
  void initState() {
    super.initState();
    listener = () {
      setState(() {
        
      });
    };
  } 


  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      width: 360,
      height: 824,
    );
    return Scaffold(
      backgroundColor: Hexcolor('#ffffff'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: ScreenUtil().setHeight(29.0),
            color: Hexcolor('#000000'),
          ),
          AspectRatio(
            aspectRatio: 360 / 408,
              child: Container(
              width: ScreenUtil().setWidth(360.0),
              height: ScreenUtil().setHeight(408.0),
              color: Hexcolor('#000000').withOpacity(0.1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(
                          left: ScreenUtil().setWidth(16.6),
                          top: ScreenUtil().setHeight(16.6),
                        ),
                        child: Icon(
                          Icons.clear,
                          color: Hexcolor('#ffffff'),
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(
                            left: ScreenUtil().setWidth(16.0),
                            bottom: ScreenUtil().setHeight(11.0),
                          ),
                          child: Text('03:20',
                              style: TextStyle(
                                color: Hexcolor('#ffffff'),
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                fontSize: ScreenUtil().setSp(20.0),
                                letterSpacing: 0.0,
                              ))),
                    ],
                  ),
                  Container(
                      margin: EdgeInsets.only(
                        top: ScreenUtil().setHeight(16.6),
                        right: ScreenUtil().setWidth(16.0),
                      ),
                      child: Icon(
                        Icons.camera_alt,
                        color: Hexcolor('#ffffff'),
                      )),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              left: ScreenUtil().setWidth(40.0),
              top: ScreenUtil().setHeight(5.0),
            ),
            child: Text(
              'STRETCHING',
             style: TextStyle(
               color: Hexcolor('#171717').withOpacity(0.6),
               height: 1.44,
               letterSpacing: 0.0,
               fontFamily: 'roboto',
             ) 
            )
          ),
          SizedBox(height: ScreenUtil().setHeight(5),),
          Container(
            margin: EdgeInsets.only(
              bottom: ScreenUtil().setHeight(4.0),
              left: ScreenUtil().setWidth(16.0),
            ),
            width: ScreenUtil().setWidth(328.0),
            height: ScreenUtil().setHeight(48.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(ScreenUtil().setWidth(12.0)),
              color: Hexcolor('#f7f7fa'),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
             children: <Widget>[
               Container(
                 margin: EdgeInsets.only(
                   left: ScreenUtil().setWidth(23.3),
                 ),
                 child: Text(
                   '13',
                   style: TextStyle(
                     color: Hexcolor('#171717'),
                     fontFamily: 'roboto',
                     fontWeight: FontWeight.bold,
                     fontSize: ScreenUtil().setSp(14.0),
                     letterSpacing: 0.0,
                   ),
                 ),
               ),
               Container(
                 margin: EdgeInsets.only(
                   left: ScreenUtil().setWidth(16.7),
                 ),
                 child: Text(
                   'Overhead reach to side stretch',
                   style: TextStyle(
                     color: Hexcolor('#171717'),
                     fontFamily: 'roboto',
                     fontSize: ScreenUtil().setSp(14.0),
                     letterSpacing: 0.0,
                   ),
                 ),
               ),
             ], 
            )
          ),
          Container(
            margin: EdgeInsets.only(
              bottom: ScreenUtil().setHeight(4.0),
              left: ScreenUtil().setWidth(16.0),
            ),
            width: ScreenUtil().setWidth(328.0),
            height: ScreenUtil().setHeight(48.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(ScreenUtil().setWidth(12.0)),
              color: Hexcolor('#f7f7fa'),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
             children: <Widget>[
               Container(
                 margin: EdgeInsets.only(
                   left: ScreenUtil().setWidth(23.3),
                 ),
                 child: Text(
                   '30',
                   style: TextStyle(
                     color: Hexcolor('#171717'),
                     fontFamily: 'roboto',
                     fontWeight: FontWeight.bold,
                     fontSize: ScreenUtil().setSp(14.0),
                     letterSpacing: 0.0,
                   ),
                 ),
               ),
               Container(
                 margin: EdgeInsets.only(
                   left: ScreenUtil().setWidth(16.7),
                 ),
                 child: Text(
                   'Dynamic quadriceps stretch',
                   style: TextStyle(
                     color: Hexcolor('#171717'),
                     fontFamily: 'roboto',
                     fontSize: ScreenUtil().setSp(14.0),
                     letterSpacing: 0.0,
                   ),
                 ),
               ),
             ], 
            )
          ),
          Container(
            margin: EdgeInsets.only(
              bottom: ScreenUtil().setHeight(4.0),
              left: ScreenUtil().setWidth(16.0),
            ),
            width: ScreenUtil().setWidth(328.0),
            height: ScreenUtil().setHeight(48.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(ScreenUtil().setWidth(12.0)),
              color: Hexcolor('#f7f7fa'),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
             children: <Widget>[
               Container(
                 margin: EdgeInsets.only(
                   left: ScreenUtil().setWidth(23.3),
                 ),
                 child: Text(
                   '30',
                   style: TextStyle(
                     color: Hexcolor('#171717'),
                     fontFamily: 'roboto',
                     fontWeight: FontWeight.bold,
                     fontSize: ScreenUtil().setSp(14.0),
                     letterSpacing: 0.0,
                   ),
                 ),
               ),
               Container(
                 margin: EdgeInsets.only(
                   left: ScreenUtil().setWidth(16.7),
                 ),
                 child: Text(
                   'Dynamic quadriceps stretch',
                   style: TextStyle(
                     color: Hexcolor('#171717'),
                     fontFamily: 'roboto',
                     fontSize: ScreenUtil().setSp(14.0),
                     letterSpacing: 0.0,
                   ),
                 ),
               ),
             ], 
            )
          ),
          Container(
            margin: EdgeInsets.only(
              left: ScreenUtil().setWidth(40.0),
            ),
            child: Text(
              'STRENGTHENING',
             style: TextStyle(
               color: Hexcolor('#171717').withOpacity(0.6),
               height: 1.44,
               letterSpacing: 0.0,
               fontFamily: 'roboto',
             ) 
            )
          ),
          SizedBox(height: ScreenUtil().setHeight(5),),
          Container(
            margin: EdgeInsets.only(
              bottom: ScreenUtil().setHeight(4.0),
              left: ScreenUtil().setWidth(16.0),
            ),
            width: ScreenUtil().setWidth(328.0),
            height: ScreenUtil().setHeight(48.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(ScreenUtil().setWidth(12.0)),
              color: Hexcolor('#f7f7fa'),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
             children: <Widget>[
               Container(
                 margin: EdgeInsets.only(
                   left: ScreenUtil().setWidth(23.3),
                 ),
                 child: Text(
                   '13',
                   style: TextStyle(
                     color: Hexcolor('#171717'),
                     fontFamily: 'roboto',
                     fontWeight: FontWeight.bold,
                     fontSize: ScreenUtil().setSp(14.0),
                     letterSpacing: 0.0,
                   ),
                 ),
               ),
               Container(
                 margin: EdgeInsets.only(
                   left: ScreenUtil().setWidth(16.7),
                 ),
                 child: Text(
                   'Overhead reach to side stretch',
                   style: TextStyle(
                     color: Hexcolor('#171717'),
                     fontFamily: 'roboto',
                     fontSize: ScreenUtil().setSp(14.0),
                     letterSpacing: 0.0,
                   ),
                 ),
               ),
             ], 
            )
          ),
          Container(
            margin: EdgeInsets.only(
              bottom: ScreenUtil().setHeight(4.0),
              left: ScreenUtil().setWidth(16.0),
            ),
            width: ScreenUtil().setWidth(328.0),
            height: ScreenUtil().setHeight(48.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(ScreenUtil().setWidth(12.0)),
              color: Hexcolor('#f7f7fa'),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
             children: <Widget>[
               Container(
                 margin: EdgeInsets.only(
                   left: ScreenUtil().setWidth(23.3),
                 ),
                 child: Text(
                   '30',
                   style: TextStyle(
                     color: Hexcolor('#171717'),
                     fontFamily: 'roboto',
                     fontWeight: FontWeight.bold,
                     fontSize: ScreenUtil().setSp(14.0),
                     letterSpacing: 0.0,
                   ),
                 ),
               ),
               Container(
                 margin: EdgeInsets.only(
                   left: ScreenUtil().setWidth(16.7),
                 ),
                 child: Text(
                   'Dynamic quadriceps stretch',
                   style: TextStyle(
                     color: Hexcolor('#171717'),
                     fontFamily: 'roboto',
                     fontSize: ScreenUtil().setSp(14.0),
                     letterSpacing: 0.0,
                   ),
                 ),
               ),
             ], 
            )
          ),
          Container(
            margin: EdgeInsets.only(
              bottom: ScreenUtil().setHeight(4.0),
              left: ScreenUtil().setWidth(16.0),
            ),
            width: ScreenUtil().setWidth(328.0),
            height: ScreenUtil().setHeight(48.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(ScreenUtil().setWidth(12.0)),
              color: Hexcolor('#f7f7fa'),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
             children: <Widget>[
               Container(
                 margin: EdgeInsets.only(
                   left: ScreenUtil().setWidth(23.3),
                 ),
                 child: Text(
                   '30',
                   style: TextStyle(
                     color: Hexcolor('#171717'),
                     fontFamily: 'roboto',
                     fontWeight: FontWeight.bold,
                     fontSize: ScreenUtil().setSp(14.0),
                     letterSpacing: 0.0,
                   ),
                 ),
               ),
               Container(
                 margin: EdgeInsets.only(
                   left: ScreenUtil().setWidth(16.7),
                 ),
                 child: Text(
                   'Dynamic quadriceps stretch',
                   style: TextStyle(
                     color: Hexcolor('#171717'),
                     fontFamily: 'roboto',
                     fontSize: ScreenUtil().setSp(14.0),
                     letterSpacing: 0.0,
                   ),
                 ),
               ),
             ], 
            )
          ),
        ],
      ),
    );
  }
}
