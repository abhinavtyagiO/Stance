// import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingThree extends StatefulWidget {
  static String id = 'obt';
  @override
  _OnBoardingThreeState createState() => _OnBoardingThreeState();
}

class _OnBoardingThreeState extends State<OnBoardingThree> {
  bool isFirstPressed = false;
  bool isSecondPressed = false;
  bool isThirdPressed = false;

  //checkbox variables
  bool isLowerBack = false;
  bool isMidBack = false;
  bool isUpperBack = false;
  bool isShoulder = false;
  bool isNeck = false;

  //1 = 1st option, 2 = 2nd option, 3 = 3rd option 
  void updateStyle(int serialNumber) {
    if(serialNumber == 1) {
      if(isFirstPressed == false) {
        isFirstPressed = true;
        isSecondPressed = false;
        isThirdPressed = false;}
    }
    else if(serialNumber == 2) {
      if(isSecondPressed == false) {
        isSecondPressed = true;
        isFirstPressed = false;
        isThirdPressed = false;}
    }
    else if(serialNumber == 3) {
      if(isThirdPressed == false) {
        isThirdPressed = true;
        isFirstPressed = false;
        isSecondPressed = false;}
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
      backgroundColor: Hexcolor('#ffffff'),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          height: ScreenUtil().setHeight(27.0),
          color: Hexcolor('#000000'),
        ),
        Row(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/capture');
              },
                child: Container(
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
                          fontSize: ScreenUtil().setSp(20.0),
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w800,
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
        SizedBox(
          height: ScreenUtil().setHeight(28.0),
        ),
        //1st option
        GestureDetector(
          onTap: () {
            setState(() {
              updateStyle(1);
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
              fontSize: ScreenUtil().setSp(14.0),
              color: isFirstPressed ? Hexcolor('#fe3786') : Hexcolor('#000000').withOpacity(0.5), 
              ),
            ),
            decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(12.0),
             border: Border.all(
               color: isFirstPressed ? Hexcolor('#fe3786') : Hexcolor('#cccbdb'),
             ),
            )
          ),
        ),
        SizedBox(height: 16.0,),
        //2nd option
         GestureDetector(
          onTap: () {
            setState(() {
              updateStyle(2);
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
              "Yeah, sometimes I do.",
              style: TextStyle(
              fontFamily: 'roboto',
              fontSize: ScreenUtil().setSp(14.0),
              color: isSecondPressed ? Hexcolor('#fe3786') : Hexcolor('#000000').withOpacity(0.5),
              ),
            ),
            decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(12.0),
             border: Border.all(
               color: isSecondPressed ? Hexcolor('#fe3786') : Hexcolor('#cccbdb'),
             ),
            )
          ),
        ),
        SizedBox(height: 16.0,),
        // 3rd option
        GestureDetector(
          onTap: () {
            setState(() {
              updateStyle(3);
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
              "Yes, quite often.",
              style: TextStyle(
              fontFamily: 'roboto',
              fontSize: ScreenUtil().setSp(14.0),
              color: isThirdPressed ? Hexcolor('#fe3786') : Hexcolor('#000000').withOpacity(0.5),
              ),
            ),
            decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(12.0),
             border: Border.all(
               color: isThirdPressed ? Hexcolor('#fe3786') : Hexcolor('#cccbdb'),
             ),
            )
          ),
        ),
        SizedBox(height: ScreenUtil().setHeight(16),),
        isThirdPressed || isSecondPressed ? Container(
          width: ScreenUtil().setWidth(328),
          height: ScreenUtil().setHeight(305),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(ScreenUtil().setWidth(12)),
            color: Hexcolor('#f7f7fa'),
          ),
          child: Padding(
            padding: EdgeInsets.only(
              // left: ScreenUtil().setWidth(25),
              top: ScreenUtil().setHeight(20)
            ),
            child: Column(
              children: [
                Container(
                  width: ScreenUtil().setWidth(271),
                  child: Text(
                    'Can you identify the body parts where you feel pain?',
                    style: TextStyle(
                      fontFamily: 'roboto',
                      fontSize: ScreenUtil().setSp(14),
                      color: Hexcolor('#000000').withOpacity(0.7),
                      height: 1.44,
                      letterSpacing: 0,
                    ),
                  ),
                ),
                Expanded(
                  child: ListView(
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    children: [
                      ListTile(
                        leading: Checkbox( 
                          activeColor: Hexcolor('#fe3786'),
                        value: isLowerBack, 
                        onChanged: (newValue) {
                          setState(() {
                            isLowerBack = newValue;
                          });
                        },),
                        title: Text(
                          'Lower Back',
                          style: TextStyle(
                            fontFamily: 'roboto',
                            fontSize: ScreenUtil().setSp(14),
                            color: Hexcolor('#4c4c4c'),
                            letterSpacing: 0,
                          ),
                          ),
                      ),
                      ListTile(
                        leading: Checkbox(
                          activeColor: Hexcolor('#fe3786'),
                          value: isMidBack,
                           onChanged: (newValue) {
                             setState(() {
                               isMidBack = newValue;
                             });
                           },),
                        title: Text(
                          'Mid Back',
                          style: TextStyle(
                            fontFamily: 'roboto',
                            fontSize: ScreenUtil().setSp(14),
                            color: Hexcolor('#4c4c4c'),
                            letterSpacing: 0,
                          ),
                          ),
                      ),
                      ListTile(
                        leading: Checkbox(value: isUpperBack,
                         onChanged: (newValue) {
                           setState(() {
                             isUpperBack = newValue;
                           });
                         }, 
                         activeColor: Hexcolor('#fe3786'),),
                        title: Text(
                          'Upper Back',
                          style: TextStyle(
                            fontFamily: 'roboto',
                            fontSize: ScreenUtil().setSp(14),
                            color: Hexcolor('#4c4c4c'),
                            letterSpacing: 0,
                          ),
                          ),
                      ),
                      ListTile(
                        leading: Checkbox(
                          activeColor: Hexcolor('#fe3786'),
                          value: isShoulder, onChanged: (newValue) {
                            setState(() {
                              isShoulder = newValue;
                            });
                          },),
                        title: Text(
                          'Shoulder',
                          style: TextStyle(
                            fontFamily: 'roboto',
                            fontSize: ScreenUtil().setSp(14),
                            color: Hexcolor('#4c4c4c'),
                            letterSpacing: 0,
                          ),
                          ),
                      ),
                      ListTile(
                        leading: Checkbox(
                          activeColor: Hexcolor('#fe3786'),
                          value: isNeck, onChanged: (newValue) {
                            setState(() {
                              isNeck = newValue;
                            });
                          },),
                        title: Text(
                          'Neck',
                          style: TextStyle(
                            fontFamily: 'roboto',
                            fontSize: ScreenUtil().setSp(14),
                            color: Hexcolor('#4c4c4c'),
                            letterSpacing: 0,
                          ),
                          ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ) : Container(),
         SizedBox(height: isFirstPressed ? ScreenUtil().setHeight(323) : ScreenUtil().setHeight(25) ,),
        isFirstPressed || isSecondPressed || isThirdPressed ? ButtonTheme(
                    height: ScreenUtil().setHeight(40.0),
                    minWidth: ScreenUtil().setWidth(328),
                      child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(ScreenUtil().setWidth(20.0)),
                      ),
                      color: Hexcolor('#fe3786'),
                      textColor: Hexcolor('#ffffff'),
                    onPressed: () {
                            Navigator.pushNamed(context, '/wv');
                    },
                    child: Text('GET STARTED',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      fontSize: ScreenUtil().setSp(14.0),
                      letterSpacing: 0,
                    ),
                    ),
                ),
                ) : Container(),
      ],
    ));
  }
}
