import 'package:StartUp/pages/frontposeCapture.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TestPosture extends StatefulWidget {
  static String id = 'testPosture';
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
      body: SafeArea(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: [
                SizedBox(height: ScreenUtil().setHeight(35.0)),
          Padding(
            padding: EdgeInsets.only(
              left: ScreenUtil().setWidth(17.5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                 Container(
                    width: ScreenUtil().setWidth(4.0),
                    height: ScreenUtil().setHeight(88.0),
                    decoration: BoxDecoration(color: Hexcolor('#e9f6fe')),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: ScreenUtil().setWidth(21.5),
                        right: ScreenUtil().setWidth(42),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            child: Text('Test your posture',
                                style: TextStyle(
                                  fontSize: ScreenUtil().setSp(20.0),
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w800,
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
                                fontSize: ScreenUtil().setSp(14.0),
                                color: Hexcolor('#000000').withOpacity(0.7),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
              ],
            ),
          ), 
          Padding(
            padding: EdgeInsets.only(
              top: ScreenUtil().setHeight(61),
            ),
            child: Image(
                image: AssetImage('assets/images/person.jpg'),
                width: ScreenUtil().setWidth(243.1),
              ),
          ),
              ],
            ),
          
          // SizedBox(height: ScreenUtil().setHeight(120.0),),
          Padding(
            padding: EdgeInsets.only(
              bottom: ScreenUtil().setHeight(32),
            ),
            child: ButtonTheme(
                        height: ScreenUtil().setHeight(40.0),
                        minWidth: ScreenUtil().setWidth(328),
                          child: FlatButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(ScreenUtil().setWidth(20.0)),
                          ),
                          color: Hexcolor('#fe3786'),
                          textColor: Hexcolor('#ffffff'),
                        onPressed: () {
                         Navigator.pushNamed(context, FrontCapture.id);
                        },
                        child: Text('TAKE A PHOTO',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          fontSize: ScreenUtil().setSp(14.0),
                          letterSpacing: 0,
                        ),
                        ),
                    ),
                      ),
          ),
          ],
        ),
      ),
    );
  }
}