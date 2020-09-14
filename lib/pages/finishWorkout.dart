// import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FinishWorkout extends StatefulWidget {
  @override
  _FinishWorkoutState createState() => _FinishWorkoutState();
}

class _FinishWorkoutState extends State<FinishWorkout> {
  bool isFirstPressed = false;
  bool isSecondPressed = false;
  bool isThirdPressed = false;

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
                    child: Text('Next workout difficulty',
                        style: TextStyle(
                          fontSize: ScreenUtil().setHeight(20.0),
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
                      'Do you want a more challenging workout session?',
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
              'No, similiar difficulty',
              style: TextStyle(
              fontFamily: 'roboto',
              fontSize: ScreenUtil().setHeight(14.0),
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
              'Yeah, bring it on.',
              style: TextStyle(
              fontFamily: 'roboto',
              fontSize: ScreenUtil().setHeight(14.0),
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
              'Too hard, go easy on me.',
              style: TextStyle(
              fontFamily: 'roboto',
              fontSize: ScreenUtil().setHeight(14.0),
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
        SizedBox(height: ScreenUtil().setHeight(340),),
            ButtonTheme(
                    height: ScreenUtil().setHeight(40.0),
                      child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(ScreenUtil().setWidth(24.0)),
                      ),
                      padding: EdgeInsets.only(
                        left: ScreenUtil().setWidth(101.5),
                        right: ScreenUtil().setWidth(101.5),
                      ),
                      color: isFirstPressed || isSecondPressed || isThirdPressed ? Hexcolor('#fe3786') : Hexcolor('#000000').withOpacity(0.5),
                      textColor: Hexcolor('#ffffff'),
                    onPressed: () {
                        Scaffold
                            .of(context)
                            .showSnackBar(SnackBar(content: Text('Processing Data')));
                    },
                    child: Text('FINISH WORKOUT',
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
    );
  }
}
