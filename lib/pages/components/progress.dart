import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Progress extends StatefulWidget {

  @override
  _ProgressState createState() => _ProgressState();
}

class _ProgressState extends State<Progress> {

  bool isWeeklyPressed = false;
  bool isMonthlyPressed = false;
  bool isAnnuallyPressed = false;

  //function to change style
  void updateStyle(int serialNumber) {
    if(serialNumber == 1) {
      if(isWeeklyPressed == false) {
        isWeeklyPressed = true;
        isMonthlyPressed = false;
        isAnnuallyPressed = false;
      }
    }
    if(serialNumber == 2) {
      if(isMonthlyPressed == false) {
        isWeeklyPressed = false;
        isMonthlyPressed = true;
        isAnnuallyPressed = false;
      }
    }
    if(serialNumber == 3) {
      if(isAnnuallyPressed == false) {
        isWeeklyPressed = false;
        isMonthlyPressed = false;
        isAnnuallyPressed = true;
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
      padding: EdgeInsets.only(
        left: ScreenUtil().setWidth(40),
        top: ScreenUtil().setHeight(18.8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Text('Workout Stats',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: ScreenUtil().setWidth(16.0),
                  height: 1.44,
                  color: Hexcolor('#000000'),
                )),
          ),
          Container(
            width: ScreenUtil().setWidth(115.0),
            height: ScreenUtil().setHeight(4.0),
            color: Hexcolor('#e9f6fe'),
          ),
        ],
      ),
    ),
    SizedBox(
      height: ScreenUtil().setHeight(13.9),
    ),
    Padding(
      padding: EdgeInsets.only(
        left: ScreenUtil().setWidth(16),
        right: ScreenUtil().setWidth(16),
      ),
      child: Container(
        height: ScreenUtil().setHeight(152.0),
        decoration: BoxDecoration(
          color: Hexcolor('#e9f6fe'),
          borderRadius:
              BorderRadius.circular(ScreenUtil().setWidth(24.0)),
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                top: ScreenUtil().setHeight(39),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    child: Column(
                      children: <Widget>[
                        Text('MINUTES',
                            style: TextStyle(
                              fontFamily: 'roboto',
                              fontWeight: FontWeight.bold,
                              fontSize: ScreenUtil().setWidth(9.0),
                              letterSpacing: 0.6,
                            )),
                        Text('75',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w800,
                              fontSize: ScreenUtil().setWidth(24.0),
                              letterSpacing: 0,
                            )),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: <Widget>[
                        Text('SESSIONS',
                            style: TextStyle(
                              fontFamily: 'roboto',
                              fontWeight: FontWeight.bold,
                              fontSize: ScreenUtil().setWidth(9.0),
                              letterSpacing: 0.6,
                            )),
                        Text('04',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w800,
                              fontSize: ScreenUtil().setWidth(24.0),
                              letterSpacing: 0,
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: ScreenUtil().setWidth(24),
                right: ScreenUtil().setWidth(24),
                top: ScreenUtil().setHeight(16),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                ButtonTheme(
                height: ScreenUtil().setHeight(24),
                minWidth: ScreenUtil().setWidth(88),
                child: FlatButton(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,  
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        ScreenUtil().setWidth(12.3)),
                    side: BorderSide(color: isWeeklyPressed ? Hexcolor('#000000') : Hexcolor('#ffffff')),
                  ),
                  color: Hexcolor('#ffffff'),
                  onPressed: () {
                    setState(() {
                      updateStyle(1);
                    });
                    
                  },
                  child: Text(
                    'Weekly',
                    style: TextStyle(
                      fontFamily: 'roboto',
                      fontSize: ScreenUtil().setWidth(10),
                      letterSpacing: 0,
                      color: Hexcolor('#000000'),
                    ),
                  ),
                ),
              ),
                  ButtonTheme(
                height: ScreenUtil().setHeight(24),
                minWidth: ScreenUtil().setWidth(88),
                child: FlatButton(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        ScreenUtil().setWidth(12.3)),
                    side: BorderSide(color: isMonthlyPressed ? Hexcolor('#000000') : Hexcolor('#ffffff')),
                  ),
                  color: Hexcolor('#ffffff'),
                  onPressed: () {
                    setState(() {
                      updateStyle(2);
                    });
                    
                  },
                  child: Text(
                    'Monthly',
                    style: TextStyle(
                      fontFamily: 'roboto',
                      fontSize: ScreenUtil().setWidth(10),
                      letterSpacing: 0,
                      color: Hexcolor('#000000'),
                    ),
                  ),
                ),
              ),
                  ButtonTheme(
                height: ScreenUtil().setHeight(24),
                minWidth: ScreenUtil().setWidth(88),
                child: FlatButton(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        ScreenUtil().setWidth(12.3)),
                    side: BorderSide(color: isAnnuallyPressed ? Hexcolor('#000000') : Hexcolor('#ffffff')),
                  ),
                  color: Hexcolor('#ffffff'),
                  onPressed: () {
                    setState(() {
                      updateStyle(3);
                    });
                    
                  },
                  child: Text(
                    'Annually',
                    style: TextStyle(
                      fontFamily: 'roboto',
                      fontSize: ScreenUtil().setWidth(10),
                      letterSpacing: 0,
                      color: Hexcolor('#000000'),
                    ),
                  ),
                ),
              ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
    SizedBox(
      height: ScreenUtil().setHeight(11.8),
    ),
    //posture
    Padding(
      padding: EdgeInsets.only(
        left: ScreenUtil().setWidth(40),
        right: ScreenUtil().setWidth(40),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Posture',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: ScreenUtil().setWidth(16.0),
                    height: 1.44,
                    color: Hexcolor('#000000'),
                  )),
              Container(
                width: ScreenUtil().setWidth(62.0),
                height: ScreenUtil().setHeight(4.0),
                color: Hexcolor('#e9f6fe'),
              ),
            ],
          ),
          ButtonTheme(
            height: ScreenUtil().setHeight(24),
            minWidth: ScreenUtil().setWidth(72),
            child: FlatButton(
              focusColor: Colors.transparent,
              highlightColor: Colors.transparent,
              splashColor: Hexcolor('#fe3786').withOpacity(0.1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    ScreenUtil().setWidth(12.3)),
                side: BorderSide(color: Hexcolor('#fe3786')),
              ),
              color: Hexcolor('#ffffff'),
              onPressed: () {
              },
              child: RichText(
                text: TextSpan(
                  children: [
                    WidgetSpan(
                      child: Icon(
                        Icons.camera_alt,
                        color: Hexcolor('#fe3786'),
                        size: ScreenUtil().setWidth(15.0),
                      ),
                    ),
                    TextSpan(
                      text: '  Test',
                      style: TextStyle(
                        fontFamily: 'roboto',
                        color: Hexcolor('#fe3786'),
                        fontSize: ScreenUtil().setWidth(10.0),
                        letterSpacing: 0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ),
    SizedBox(
      height: ScreenUtil().setHeight(5.0),
    ),
    //photos
    Padding(
      padding: EdgeInsets.only(
        left: ScreenUtil().setWidth(16),
        right: ScreenUtil().setWidth(16),
        ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
              width: ScreenUtil().setWidth(160),
              height: ScreenUtil().setHeight(216.0),
              decoration: BoxDecoration(
                color: Hexcolor('#f3f3f7'),
                borderRadius: BorderRadius.circular(
                    ScreenUtil().setWidth(16.0)),
              )),
          Container(
              width: ScreenUtil().setWidth(160),
              height: ScreenUtil().setHeight(216.0),
              decoration: BoxDecoration(
                color: Hexcolor('#f3f3f7'),
                borderRadius: BorderRadius.circular(
                    ScreenUtil().setWidth(16.0)),
              )),
        ],
      ),
    ),
    SizedBox(
      height: ScreenUtil().setHeight(18.0),
    ),
    //DATE toggle
    Padding(
      padding: EdgeInsets.only(
        left: ScreenUtil().setWidth(44.6),
        right: ScreenUtil().setWidth(44.6),
        bottom: ScreenUtil().setHeight(25),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(
            Icons.keyboard_arrow_left,
            color: Hexcolor('#171717'),
            size: ScreenUtil().setWidth(22.0),
          ),
          Text('14 March',
              style: TextStyle(
                fontFamily: 'roboto',
                fontWeight: FontWeight.bold,
                fontSize: ScreenUtil().setHeight(12.0),
                color: Hexcolor('#000000'),
              )),
          Icon(
            Icons.keyboard_arrow_right,
            color: Hexcolor('#171717'),
            size: ScreenUtil().setWidth(22.0),
          ),
        ],
      ),
    ),
    //FHP
    Padding(
      padding: EdgeInsets.only(
        left: ScreenUtil().setWidth(40),
        right: ScreenUtil().setWidth(40),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
              height: ScreenUtil().setHeight(24.0),
              width: ScreenUtil().setWidth(24.0),
              decoration: BoxDecoration(
                color: Hexcolor('#f3f3f7'),
                borderRadius: BorderRadius.circular(
                    ScreenUtil().setWidth(8.0)),
              )),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: ScreenUtil().setWidth(160.0),
                  child: Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'FHP',
                        style: TextStyle(
                          color: Hexcolor('#000000'),
                          fontFamily: 'roboto',
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.6,
                          fontSize: ScreenUtil().setWidth(12.0),
                        ),
                      ),
                      Text(
                        '80/100',
                        style: TextStyle(
                          color:
                              Hexcolor('#000000').withOpacity(0.5),
                          fontFamily: 'roboto',
                          letterSpacing: 0.6,
                          fontSize: ScreenUtil().setWidth(9.0),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: ScreenUtil().setHeight(5.0),
                  ),
                  width: ScreenUtil().setWidth(160.0),
                  height: ScreenUtil().setHeight(4.0),
                  decoration: BoxDecoration(
                    color: Hexcolor('#f3f3f7'),
                  ),
                )
              ],
            ),
          ),
          Container(
            width: ScreenUtil().setWidth(64),
            height: ScreenUtil().setHeight(24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(ScreenUtil().setHeight(12.3)),
              color: Hexcolor('#ffeeee'),
            ),
            child: Center(
              child: Text(
                  'Severe',
                  style: TextStyle(
                    color: Hexcolor('#ff4747'),
                    fontFamily: 'roboto',
                    fontSize: ScreenUtil().setWidth(10.0),
                    letterSpacing: 0.0,
                  ),
                ),
            ),
          )
        ],
      ),
    ),
    SizedBox(height: ScreenUtil().setHeight(16.5),),
    //scoliosis
    Padding(
      padding: EdgeInsets.only(
        left: ScreenUtil().setWidth(40),
        right: ScreenUtil().setWidth(40),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
              height: ScreenUtil().setHeight(24.0),
              width: ScreenUtil().setWidth(24.0),
              decoration: BoxDecoration(
                color: Hexcolor('#f3f3f7'),
                borderRadius: BorderRadius.circular(
                    ScreenUtil().setWidth(8.0)),
              )),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: ScreenUtil().setWidth(160.0),
                  child: Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Scoliosis',
                        style: TextStyle(
                          color: Hexcolor('#000000'),
                          fontFamily: 'roboto',
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.6,
                          fontSize: ScreenUtil().setWidth(12.0),
                        ),
                      ),
                      Text(
                        '20/100',
                        style: TextStyle(
                          color:
                              Hexcolor('#000000').withOpacity(0.5),
                          fontFamily: 'roboto',
                          letterSpacing: 0.6,
                          fontSize: ScreenUtil().setWidth(9.0),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: ScreenUtil().setHeight(5.0),
                  ),
                  width: ScreenUtil().setWidth(160.0),
                  height: ScreenUtil().setHeight(4.0),
                  decoration: BoxDecoration(
                    color: Hexcolor('#f3f3f7'),
                  ),
                )
              ],
            ),
          ),
          Container(
            width: ScreenUtil().setWidth(64),
              height: ScreenUtil().setHeight(24),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(ScreenUtil().setWidth(12.3)),
                color: Hexcolor('#e9f9f1'),
              ),
              child: Center(
                child: Text(
                    'Normal',
                    style: TextStyle(
                      color: Hexcolor('#00b279'),
                      fontFamily: 'roboto',
                      fontSize: ScreenUtil().setWidth(10.0),
                      letterSpacing: 0.0,
                    ),
                  ),
              ),
          )
        ],
      ),
    ),
    SizedBox(height: ScreenUtil().setHeight(16.5),),
    //slouch
    Padding(
      padding: EdgeInsets.only(
        left: ScreenUtil().setWidth(40),
        right: ScreenUtil().setWidth(40),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
              height: ScreenUtil().setHeight(24.0),
              width: ScreenUtil().setWidth(24.0),
              decoration: BoxDecoration(
                color: Hexcolor('#f3f3f7'),
                borderRadius: BorderRadius.circular(
                    ScreenUtil().setWidth(8.0)),
              )),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: ScreenUtil().setWidth(160.0),
                  child: Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Slouch',
                        style: TextStyle(
                          color: Hexcolor('#000000'),
                          fontFamily: 'roboto',
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.6,
                          fontSize: ScreenUtil().setWidth(12.0),
                        ),
                      ),
                      Text(
                        '50/100',
                        style: TextStyle(
                          color:
                              Hexcolor('#000000').withOpacity(0.5),
                          fontFamily: 'roboto',
                          letterSpacing: 0.6,
                          fontSize: ScreenUtil().setWidth(9.0),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: ScreenUtil().setHeight(5.0),
                  ),
                  width: ScreenUtil().setWidth(160.0),
                  height: ScreenUtil().setHeight(4.0),
                  decoration: BoxDecoration(
                    color: Hexcolor('#f3f3f7'),
                  ),
                )
              ],
            ),
          ),
          Container(
            width: ScreenUtil().setWidth(64),
              height: ScreenUtil().setHeight(24),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(ScreenUtil().setWidth(12.3)),
                color: Hexcolor('#fff4e9'),
              ),
              child: Center(
                child: Text(
                    'Caution',
                    style: TextStyle(
                      color: Hexcolor('#ff7f56'),
                      fontFamily: 'roboto',
                      fontSize: ScreenUtil().setWidth(10.0),
                      letterSpacing: 0.0,
                    ),
                  ),
              ),
          ),
        ],
      ),
    ),
    SizedBox(height: ScreenUtil().setHeight(32)),
      ],
    );
  }
}