import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TestPosture extends StatefulWidget {
  @override
  _TestPostureState createState() => _TestPostureState();
}

class _TestPostureState extends State<TestPosture> {
  @override
  Widget build(BuildContext context) {

    ScreenUtil.init(
      context,
      width: 360,
      height: 760,
    );

    return Scaffold(
      backgroundColor: Hexcolor('#ffffff'),
      body: Column(
        children: <Widget>[
          Container(
          height: ScreenUtil().setHeight(27.0),
          color: Hexcolor('#000000'),
        ),
        SizedBox(height: ScreenUtil().setHeight(35.0)),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
             Container(
                margin: EdgeInsets.only(
                  left: ScreenUtil().setWidth(17.5),
                ),
                width: ScreenUtil().setWidth(4.0),
                height: ScreenUtil().setHeight(88.0),
                decoration: BoxDecoration(color: Hexcolor('#e9f6fe')),
                ),
                Container(
              margin: EdgeInsets.only(
                left: ScreenUtil().setWidth(21.5),
                right: ScreenUtil().setWidth(45.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Text('Test your posture',
                        style: TextStyle(
                          fontSize: ScreenUtil().setHeight(20.0),
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Hexcolor('#000000'),
                          letterSpacing: 0,
                        )),
                  ),
                  Container(
                    width: ScreenUtil().setWidth(271.0),
                    margin: EdgeInsets.only(
                      top: ScreenUtil().setHeight(7.0),
                    ),
                    child: Text(
                      "Scan your body to know what's wrong and get workout recommendations to correct your posture.",
                      style: TextStyle(
                        fontFamily: 'roboto',
                        fontSize: ScreenUtil().setHeight(14.0),
                        color: Hexcolor('#000000').withOpacity(0.7),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ), 
        Container(
          margin: EdgeInsets.only(
            top: ScreenUtil().setHeight(61.0),
          ),
          child: Image(
              image: AssetImage('assets/images/person.jpg'),
              width: ScreenUtil().setWidth(243.1),
            ),
        ),
        SizedBox(height: ScreenUtil().setHeight(120.0),),
        Chip(
          backgroundColor: Hexcolor('#fe3786'),
          labelPadding: EdgeInsets.only(
            left: ScreenUtil().setWidth(100.0),
            right: ScreenUtil().setWidth(100.0),
            top: ScreenUtil().setHeight(5.0),
            bottom: ScreenUtil().setHeight(5.0),
          ),
          label: Text(
            'TAKE A PHOTO',
            style: TextStyle(
              fontFamily: 'roboto',
              fontWeight: FontWeight.bold,
              fontSize: ScreenUtil().setHeight(14.0),
              color: Hexcolor('#ffffff'),
              letterSpacing: 0.0,
            ),
          ),
        ),
        ],
      ),
    );
  }
}