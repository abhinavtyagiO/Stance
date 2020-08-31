// import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingThree extends StatefulWidget {
  @override
  _OnBoardingThreeState createState() => _OnBoardingThreeState();
}

class _OnBoardingThreeState extends State<OnBoardingThree> {
  bool isPressed= false;
  

  @override
  Widget build(BuildContext context) {

    ScreenUtil.init(
      context,
      width: 360,
      height: 760,
    );
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          height: ScreenUtil().setHeight(27.0),
          color: Hexcolor('#000000'),
        ),
        Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                left: ScreenUtil().setWidth(21.8),
                top: ScreenUtil().setHeight(21.2),
              ),
              child: Icon(
                Icons.arrow_back_ios,
                color: Hexcolor('#000000'),
                size: ScreenUtil().setHeight(20.0),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 24.4,
        ),
        Row(
          children: <Widget>[
            Container(
                margin: EdgeInsets.only(
                  left: ScreenUtil().setWidth(17.5),
                ),
                width: ScreenUtil().setWidth(4.0),
                height: ScreenUtil().setHeight(65.0),
                decoration: BoxDecoration(color: Hexcolor('#e9f6fe'))),
            Container(
              margin: EdgeInsets.only(
                left: ScreenUtil().setWidth(21.5),
                right: ScreenUtil().setWidth(45.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Text('Bad posture related pain',
                        style: TextStyle(
                          fontSize: ScreenUtil().setHeight(20.0),
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Hexcolor('#000000'),
                          letterSpacing: 0.0,
                        )),
                  ),
                  Container(
                    width: ScreenUtil().setWidth(271.0),
                    margin: EdgeInsets.only(
                      top: ScreenUtil().setHeight(7.0),
                    ),
                    child: Text(
                      'Do you feel repetitive stiffness/ pain in your back, neck or shoulder?',
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
        SizedBox(
          height: ScreenUtil().setHeight(28.0),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              isPressed= !isPressed;
            });
          },
             child: Container(
            margin: EdgeInsets.only(
              left: ScreenUtil().setWidth(16.0),
              right: ScreenUtil().setWidth(16.0),
            ),
            width: ScreenUtil().setWidth(328.0),
            height: ScreenUtil().setHeight(48.0),
            padding: EdgeInsets.only(
              left: ScreenUtil().setWidth(24.0),
              top: ScreenUtil().setHeight(14.0),
            ),
            child: Text(
              "No, I don't.",
              style: TextStyle(
              fontFamily: 'roboto',
              fontSize: ScreenUtil().setHeight(14.0),
              color: isPressed ? Hexcolor('#fe3786') : Hexcolor('#000000').withOpacity(0.5),
              ),
            ),
            decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(12.0),
             border: Border.all(
               color: isPressed ? Hexcolor('#fe3786') : Hexcolor('#cccbdb'),
             ),
            )
          ),
        ),
        SizedBox(height: 16.0,),
         GestureDetector(
          onTap: () {
            setState(() {
              isPressed= true;
              // pressedSecond = true;
              // if(pressedFirst == true) {pressedFirst = false;}
              // if(pressedThird == true) {pressedThird = false;}
            });
            // checkPressed(pressedFirst, pressedSecond, pressedThird);
          },
                  child: Container(
            margin: EdgeInsets.only(
              left: ScreenUtil().setWidth(16.0),
              right: ScreenUtil().setWidth(16.0),
            ),
            width: ScreenUtil().setWidth(328.0),
            height: ScreenUtil().setHeight(48.0),
            padding: EdgeInsets.only(
              left: ScreenUtil().setWidth(24.0),
              top: ScreenUtil().setHeight(14.0),
            ),
            child: Text(
              "Yeah, sometimes I do.",
              style: TextStyle(
              fontFamily: 'roboto',
              fontSize: ScreenUtil().setHeight(14.0),
              color:isPressed ? Hexcolor('#fe3786') : Hexcolor('#000000').withOpacity(0.5),
              ),
            ),
            decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(12.0),
             border: Border.all(
               color: isPressed ? Hexcolor('#fe3786') : Hexcolor('#cccbdb'),
             ),
            )
          ),
        ),
        SizedBox(height: 16.0,),
        GestureDetector(
          onTap: () {
            setState(() {
              isPressed= true;
              // pressedThird = true;
              // if(pressedFirst == true) {pressedFirst = false;}
              // if(pressedSecond == true) {pressedSecond = false;}
            });
            // checkPressed(pressedFirst, pressedSecond, pressedThird);
          },
                  child: Container(
            margin: EdgeInsets.only(
              left: ScreenUtil().setWidth(16.0),
              right: ScreenUtil().setWidth(16.0),
            ),
            width: ScreenUtil().setWidth(328.0),
            height: ScreenUtil().setHeight(48.0),
            padding: EdgeInsets.only(
              left: ScreenUtil().setWidth(24.0),
              top: ScreenUtil().setHeight(14.0),
            ),
            child: Text(
              "Yes, quite often.",
              style: TextStyle(
              fontFamily: 'roboto',
              fontSize: ScreenUtil().setHeight(14.0),
              color: isPressed ? Hexcolor('#fe3786') : Hexcolor('#000000').withOpacity(0.5),
              ),
            ),
            decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(12.0),
             border: Border.all(
               color: isPressed ? Hexcolor('#fe3786') : Hexcolor('#cccbdb'),
             ),
            )
          ),
        ),
        SizedBox(height: 16.0,),
      ],
    ));
  }
}
