import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'home.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      width: 400,
      height: 880,
    );

    return Scaffold(
        backgroundColor: Hexcolor('#111111'),
        body: Column(
          children: <Widget>[
            Container(
              height: ScreenUtil().setHeight(29.0),
              color: Hexcolor('#282828'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                    child: Container(
                    margin: EdgeInsets.only(
                      left: ScreenUtil().setWidth(21.8),
                      top: ScreenUtil().setHeight(18.0),
                    ),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Hexcolor('#ffffff'),
                      size: 20.0,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: ScreenUtil().setHeight(18.0),
                    right: ScreenUtil().setWidth(18.5),
                  ),
                  child: Icon(
                    Icons.settings,
                    color: Hexcolor('#ffffff'),
                    size: 23.0,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 18.4,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Positioned(
                      child: Container(
                        margin: EdgeInsets.only(
                          left: ScreenUtil().setWidth(45.0),
                          right: ScreenUtil().setWidth(25.0),
                          bottom: ScreenUtil().setHeight(28.0),
                        ),
                        width: ScreenUtil().setWidth(72.0),
                        height: ScreenUtil().setHeight(72.0),
                        decoration: BoxDecoration(
                          color: Hexcolor('#ffffff'),
                          borderRadius: BorderRadius.circular(
                              ScreenUtil().setWidth(24.0)),
                        ),
                      ),
                    ),
                    Positioned(
                      top: ScreenUtil().setHeight(50.4),
                      left: ScreenUtil().setWidth(93.4),
                      child: Container(
                        width: ScreenUtil().setWidth(28.8),
                        height: ScreenUtil().setHeight(28.8),
                        padding: EdgeInsets.only(
                          top: ScreenUtil().setHeight(4.0),
                          left: ScreenUtil().setWidth(8.0),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                ScreenUtil().setWidth(12.0)),
                            border: Border.all(
                              color: Hexcolor('#111111'),
                              width: ScreenUtil().setWidth(3.0),
                            ),
                            color: Hexcolor('#fe3786')),
                        child: Text('6',
                            style: TextStyle(
                              color: Hexcolor('#ffffff'),
                              fontFamily: 'roboto',
                              fontWeight: FontWeight.bold,
                              fontSize: ScreenUtil().setWidth(12.0),
                              letterSpacing: 0,
                            )),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Text(
                        'Ramdev Saharan',
                        style: TextStyle(
                          color: Hexcolor('#ffffff'),
                          fontFamily: 'Montserrat',
                          fontSize: ScreenUtil().setWidth(18.0),
                          height: 2.0,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(5.0),
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          child: Text(
                            'Next Lvl-7',
                            style: TextStyle(
                              color: Hexcolor('#fe3786'),
                              fontFamily: 'roboto',
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.67,
                              fontSize: ScreenUtil().setWidth(10.0),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            left: ScreenUtil().setWidth(71.0),
                          ),
                          child: Text('410/450',
                              style: TextStyle(
                                color: Hexcolor('#ffffff').withOpacity(0.4),
                                fontSize: ScreenUtil().setWidth(10.0),
                                fontFamily: 'roboto',
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.67,
                              )),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Container(
              width: ScreenUtil().setWidth(400.0),
              height: ScreenUtil().setHeight(692.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  ScreenUtil().setHeight(24.0),
                ),
                color: Hexcolor('#ffffff'),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(
                          left: ScreenUtil().setWidth(45.0),
                          top: ScreenUtil().setHeight(18.8),
                        ),
                        child: Text('Workout Stats',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: ScreenUtil().setHeight(16.0),
                              height: 1.44,
                              color: Hexcolor('#000000'),
                            )),
                      ),
                      Container(
                        width: ScreenUtil().setWidth(115.0),
                        height: ScreenUtil().setHeight(4.0),
                        margin: EdgeInsets.only(
                          left: ScreenUtil().setWidth(45.0),
                        ),
                        color: Hexcolor('#e9f6fe'),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 13.9,
                  ),
                  Container(
                    width: ScreenUtil().setWidth(360.0),
                    height: ScreenUtil().setHeight(152.0),
                    margin: EdgeInsets.only(left: ScreenUtil().setWidth(20.0)),
                    decoration: BoxDecoration(
                      color: Hexcolor('#e9f6fe'),
                      borderRadius:
                          BorderRadius.circular(ScreenUtil().setHeight(24.0)),
                    ),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(
                                top: ScreenUtil().setHeight(39.0),
                              ),
                              child: Column(
                                children: <Widget>[
                                  Text('MINUTES',
                                      style: TextStyle(
                                        fontFamily: 'roboto',
                                        fontWeight: FontWeight.bold,
                                        fontSize: ScreenUtil().setHeight(9.0),
                                        letterSpacing: 0.6,
                                      )),
                                  Text('75',
                                      style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.bold,
                                        fontSize: ScreenUtil().setHeight(24.0),
                                        letterSpacing: 0,
                                      )),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                top: ScreenUtil().setHeight(39.0),
                              ),
                              child: Column(
                                children: <Widget>[
                                  Text('SESSIONS',
                                      style: TextStyle(
                                        fontFamily: 'roboto',
                                        fontWeight: FontWeight.bold,
                                        fontSize: ScreenUtil().setHeight(9.0),
                                        letterSpacing: 0.6,
                                      )),
                                  Text('04',
                                      style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.bold,
                                        fontSize: ScreenUtil().setHeight(24.0),
                                        letterSpacing: 0,
                                      )),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: ScreenUtil().setHeight(12.0),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Chip(
                                labelPadding: EdgeInsets.only(
                                  left: ScreenUtil().setWidth(27.0),
                                  right: ScreenUtil().setWidth(27.0),
                                ),
                                backgroundColor: Hexcolor('#ffffff'),
                                label: Text('Weekly',
                                    style: TextStyle(
                                      fontFamily: 'roboto',
                                      fontSize: ScreenUtil().setHeight(10.0),
                                      letterSpacing: 0,
                                    ))),
                            Chip(
                                labelPadding: EdgeInsets.only(
                                  left: ScreenUtil().setWidth(27.0),
                                  right: ScreenUtil().setWidth(27.0),
                                ),
                                backgroundColor: Hexcolor('#ffffff'),
                                label: Text('Monthly',
                                    style: TextStyle(
                                      fontFamily: 'roboto',
                                      fontSize: ScreenUtil().setHeight(10.0),
                                      letterSpacing: 0,
                                    ))),
                            Chip(
                                labelPadding: EdgeInsets.only(
                                  left: ScreenUtil().setWidth(27.0),
                                  right: ScreenUtil().setWidth(27.0),
                                ),
                                backgroundColor: Hexcolor('#ffffff'),
                                label: Text('Annually',
                                    style: TextStyle(
                                      fontFamily: 'roboto',
                                      fontSize: ScreenUtil().setHeight(10.0),
                                      letterSpacing: 0,
                                    ))),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(15.8),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(
                              left: ScreenUtil().setWidth(45.0),
                            ),
                            child: Text('Posture',
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: ScreenUtil().setHeight(16.0),
                                  height: 1.44,
                                  color: Hexcolor('#000000'),
                                )),
                          ),
                          Container(
                            width: ScreenUtil().setWidth(62.0),
                            height: ScreenUtil().setHeight(4.0),
                            margin: EdgeInsets.only(
                              left: ScreenUtil().setWidth(45.0),
                            ),
                            color: Hexcolor('#e9f6fe'),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          right: ScreenUtil().setWidth(40.0),
                        ),
                        child: ButtonTheme(
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
                              Scaffold.of(context).showSnackBar(
                                  SnackBar(content: Text('Processing Data')));
                            },
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  WidgetSpan(
                                    child: Icon(
                                      Icons.camera_alt,
                                      color: Hexcolor('#fe3786'),
                                      size: ScreenUtil().setHeight(15.0),
                                    ),
                                  ),
                                  TextSpan(
                                    text: '  Add',
                                    style: TextStyle(
                                      fontFamily: 'roboto',
                                      color: Hexcolor('#fe3786'),
                                      fontSize: ScreenUtil().setHeight(10.0),
                                      letterSpacing: 0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(7.0),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                          width: ScreenUtil().setWidth(165.0),
                          height: ScreenUtil().setHeight(216.0),
                          decoration: BoxDecoration(
                            color: Hexcolor('#f3f3f7'),
                            borderRadius: BorderRadius.circular(
                                ScreenUtil().setHeight(16.0)),
                          )),
                      Container(
                          width: ScreenUtil().setWidth(165.0),
                          height: ScreenUtil().setHeight(216.0),
                          decoration: BoxDecoration(
                            color: Hexcolor('#f3f3f7'),
                            borderRadius: BorderRadius.circular(
                                ScreenUtil().setHeight(16.0)),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(18.0),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        margin:
                            EdgeInsets.only(right: ScreenUtil().setWidth(45.0)),
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Hexcolor('#171717'),
                          size: ScreenUtil().setHeight(15.0),
                        ),
                      ),
                      Text('14 March',
                          style: TextStyle(
                            fontFamily: 'roboto',
                            fontWeight: FontWeight.bold,
                            fontSize: ScreenUtil().setHeight(12.0),
                            color: Hexcolor('#000000'),
                          )),
                      Container(
                        margin:
                            EdgeInsets.only(left: ScreenUtil().setWidth(45.0)),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: Hexcolor('#171717'),
                          size: ScreenUtil().setHeight(15.0),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.only(
                            left: ScreenUtil().setWidth(20.0),
                          ),
                          height: ScreenUtil().setHeight(24.0),
                          width: ScreenUtil().setWidth(24.0),
                          decoration: BoxDecoration(
                            color: Hexcolor('#f3f3f7'),
                            borderRadius: BorderRadius.circular(
                                ScreenUtil().setHeight(8.0)),
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
                                      fontSize: ScreenUtil().setHeight(12.0),
                                    ),
                                  ),
                                  Text(
                                    '80/100',
                                    style: TextStyle(
                                      color:
                                          Hexcolor('#000000').withOpacity(0.5),
                                      fontFamily: 'roboto',
                                      letterSpacing: 0.6,
                                      fontSize: ScreenUtil().setHeight(9.0),
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
                        margin: EdgeInsets.only(
                          right: ScreenUtil().setWidth(20.0),
                        ),
                        child: Chip(
                          backgroundColor: Hexcolor('#ffeeee'),
                          label: Text(
                            'Severe',
                            style: TextStyle(
                              color: Hexcolor('#ff4747'),
                              fontFamily: 'roboto',
                              fontSize: ScreenUtil().setHeight(10.0),
                              letterSpacing: 0.0,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.only(
                            left: ScreenUtil().setWidth(20.0),
                          ),
                          height: ScreenUtil().setHeight(24.0),
                          width: ScreenUtil().setWidth(24.0),
                          decoration: BoxDecoration(
                            color: Hexcolor('#f3f3f7'),
                            borderRadius: BorderRadius.circular(
                                ScreenUtil().setHeight(8.0)),
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
                                      fontSize: ScreenUtil().setHeight(12.0),
                                    ),
                                  ),
                                  Text(
                                    '20/100',
                                    style: TextStyle(
                                      color:
                                          Hexcolor('#000000').withOpacity(0.5),
                                      fontFamily: 'roboto',
                                      letterSpacing: 0.6,
                                      fontSize: ScreenUtil().setHeight(9.0),
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
                        margin: EdgeInsets.only(
                          right: ScreenUtil().setWidth(20.0),
                        ),
                        child: Chip(
                          backgroundColor: Hexcolor('#e9f9f1'),
                          label: Text(
                            'Normal',
                            style: TextStyle(
                              color: Hexcolor('#00b279'),
                              fontFamily: 'roboto',
                              fontSize: ScreenUtil().setHeight(10.0),
                              letterSpacing: 0.0,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.only(
                            left: ScreenUtil().setWidth(20.0),
                          ),
                          height: ScreenUtil().setHeight(24.0),
                          width: ScreenUtil().setWidth(24.0),
                          decoration: BoxDecoration(
                            color: Hexcolor('#f3f3f7'),
                            borderRadius: BorderRadius.circular(
                                ScreenUtil().setHeight(8.0)),
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
                                      fontSize: ScreenUtil().setHeight(12.0),
                                    ),
                                  ),
                                  Text(
                                    '50/100',
                                    style: TextStyle(
                                      color:
                                          Hexcolor('#000000').withOpacity(0.5),
                                      fontFamily: 'roboto',
                                      letterSpacing: 0.6,
                                      fontSize: ScreenUtil().setHeight(9.0),
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
                        margin: EdgeInsets.only(
                          right: ScreenUtil().setWidth(20.0),
                        ),
                        child: Chip(
                          backgroundColor: Hexcolor('#fff4e9'),
                          label: Text(
                            'Caution',
                            style: TextStyle(
                              color: Hexcolor('#ff7f56'),
                              fontFamily: 'roboto',
                              fontSize: ScreenUtil().setHeight(10.0),
                              letterSpacing: 0.0,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
