import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:math';
// import 'profile.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      width: 360,
      height: 760,
    );
    return Scaffold(
      backgroundColor: Hexcolor('#ffffff'),
      //760*360
      body: Column(
        children: <Widget>[
          Container(
            color: Hexcolor('f3f7#f3'),
            height: ScreenUtil().setHeight(26),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[ 
              Container(
                margin: EdgeInsets.only(
                  left: ScreenUtil().setWidth(40.0),
                  top: ScreenUtil().setHeight(26.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                 children: <Widget>[
                   Container(
                     child: Text(
                       'Good morning,',                        //Main title
                       style: TextStyle(
                         fontFamily: 'neutrifpro',
                         fontSize: ScreenUtil().setWidth(28),
                         height: 1.42, 
                       ),
                     ),
                   ),
                   Container(
                     child: Text(
                       'Ramdev.',
                       style: TextStyle(
                         fontFamily: 'neutrifpro',
                         fontSize: ScreenUtil().setWidth(28),
                         height: 1.42,
                       ),
                     ),
                   ),
                 ], 
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/profile');
                },
                 child: Container(
                  decoration: BoxDecoration(                        //profile image container
                    borderRadius: BorderRadius.circular(12.0),
                    color: Hexcolor('f3f7#f3'),
                  ),
                  margin: EdgeInsets.only(
                    right: ScreenUtil().setWidth(40),
                  ),
                  width: ScreenUtil().setWidth(32.0),
                  height: ScreenUtil().setHeight(32.0),
                ),
              )
            ],
          ),
          SizedBox(
            height: ScreenUtil().setHeight(27.5),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(
                  left: ScreenUtil().setWidth(40.0),
                ),
                child: Column(                                     //posture
                crossAxisAlignment: CrossAxisAlignment.start,
                 children: <Widget>[
                    Text('Posture',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: ScreenUtil().setWidth(16.0),
                      height: 1.75,
                    )),
                    Container(
                      width: ScreenUtil().setWidth(62.0),
                      height: ScreenUtil().setHeight(4.0),
                      decoration: BoxDecoration(
                      color: Hexcolor('#e9f6fe'),
                      )
                    ),
                 ], 
                ),
              ), 
              Container(
                margin: EdgeInsets.only(
                  right: ScreenUtil().setWidth(40),
                ),
                child: ButtonTheme(
                  height: ScreenUtil().setHeight(24),
                   child: FlatButton(
                     focusColor: Colors.transparent,
                     highlightColor: Colors.transparent,
                     splashColor: Hexcolor('#fe3786').withOpacity(0.1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(ScreenUtil().setWidth(12.3)),
                            side: BorderSide(color: Hexcolor('#fe3786')),
                          ),
                          color: Hexcolor('#ffffff'),
                        onPressed: () {
                            Scaffold
                                .of(context)
                                .showSnackBar(SnackBar(content: Text('Processing Data')));
                        },
                        child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: '14 March  ',
                                    style: TextStyle(
                                      fontFamily: 'roboto',
                                      color: Hexcolor('#fe3786'),
                                      fontSize: 10.0,
                                    ),
                                  ),
                                  WidgetSpan(
                                      child: Transform.rotate(
                                    angle: -90 * pi / 180,
                                    child: Icon(
                                      Icons.arrow_back_ios,
                                      color: Hexcolor('#fe3786'),
                                      size: 10.0,
                                    ),
                                  )),
                                ],
                              ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: ScreenUtil().setHeight(17.0),),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                  width: ScreenUtil().setWidth(104.0),           //1st big container starts
                  height: ScreenUtil().setHeight(128.0),
                  decoration: BoxDecoration(
                    color: Hexcolor('#ffeeee'),
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                  margin: EdgeInsets.only(
                    left: ScreenUtil().setWidth(14.0),
                  ),
                  child: Column(                                       //column inside big container starts
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          width: ScreenUtil().setWidth(24.0),
                          height: ScreenUtil().setHeight(24.0),
                          margin: EdgeInsets.only(
                            top: ScreenUtil().setHeight(15.5),
                          ),
                          decoration: BoxDecoration(
                            color: Hexcolor('#ffffff'),
                            borderRadius: BorderRadius.circular(8.0),
                          )),
                      Container(
                        margin: EdgeInsets.only(
                          top: ScreenUtil().setHeight(8.0),           //FHP
                        ),
                        child: Text('FHP',
                            style: TextStyle(
                              fontFamily: 'roboto',
                              fontWeight: FontWeight.bold,
                              fontSize: ScreenUtil().setWidth(12.0),
                              color: Hexcolor('#171717'),
                              letterSpacing: 0.6,
                            )),
                      ),
                      Container(
                          margin: EdgeInsets.only(               //Score 1
                            top: ScreenUtil().setHeight(6.0),
                          ),
                          child: Text(
                            '75',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              fontSize: ScreenUtil().setWidth(24),
                              color: Hexcolor('#171717'),
                            ),
                          )),
                      Container(
                        margin: EdgeInsets.only(
                          top: ScreenUtil().setHeight(2.0),
                        ),
                        child: Text('SEVERE',                   //Remark 1
                            style: TextStyle(
                              fontFamily: 'roboto',
                              letterSpacing: 0.6,
                              color: Hexcolor('#ff4747'),
                              fontSize: ScreenUtil().setWidth(9.0),
                            )),
                      ),
                    ],
                  )),
              Container(                                             //Container 2 starts
                  width: ScreenUtil().setWidth(104.0),
                  height: ScreenUtil().setHeight(128.0),  
                  decoration: BoxDecoration(
                    color: Hexcolor('#e9f9f1'),
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                  child: Column(                                      //Column in Container 2
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          width: ScreenUtil().setWidth(24.0),
                          height: ScreenUtil().setHeight(24.0),
                          margin: EdgeInsets.only(
                            top: ScreenUtil().setHeight(15.5),
                          ),
                          decoration: BoxDecoration(
                            color: Hexcolor('#ffffff'),
                            borderRadius: BorderRadius.circular(8.0),
                          )),
                      Container(
                        margin: EdgeInsets.only(               //Scoliosis
                          top: ScreenUtil().setHeight(6.0),
                        ),
                        child: Text('Scoliosis',
                            style: TextStyle(
                              fontFamily: 'roboto',
                              fontWeight: FontWeight.bold,
                              fontSize: ScreenUtil().setWidth(12.0),
                              color: Hexcolor('#171717'),
                            )),
                      ),
                      Container(
                          margin: EdgeInsets.only(
                            top: ScreenUtil().setHeight(8.0),     //Score 2
                          ),
                          child: Text(
                            '28',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              fontSize: ScreenUtil().setWidth(24),
                              color: Hexcolor('#171717'),
                            ),
                          )),
                      Container(
                        margin: EdgeInsets.only(
                          top: ScreenUtil().setHeight(2.0),    //Remark 2
                        ),
                        child: Text('NORMAL',
                            style: TextStyle(
                              fontFamily: 'roboto',
                              letterSpacing: 0.6,
                              color: Hexcolor('#00b279'),
                              fontSize: ScreenUtil().setWidth(9.0),
                            )),
                      ),
                    ],
                  )),
              Container(                                         //Container 3
                  width: ScreenUtil().setWidth(104.0),
                  height: ScreenUtil().setHeight(128.0),
                  decoration: BoxDecoration(
                    color: Hexcolor('#fff4e9'),
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                  margin: EdgeInsets.only(
                    right: ScreenUtil().setWidth(14.0),
                  ),
                  child: Column(                                      //Column in Container 3
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          width: ScreenUtil().setWidth(24.0),
                          height: ScreenUtil().setHeight(24.0),
                          margin: EdgeInsets.only(
                            top: ScreenUtil().setHeight(15.5),
                          ),
                          decoration: BoxDecoration(
                            color: Hexcolor('#ffffff'),
                            borderRadius: BorderRadius.circular(8.0),
                          )),
                      Container(
                        margin: EdgeInsets.only(
                          top: ScreenUtil().setHeight(8.0),    //Slouch
                        ),
                        child: Text('Slouch',
                            style: TextStyle(
                              fontFamily: 'roboto',
                              fontWeight: FontWeight.bold,
                              fontSize: ScreenUtil().setWidth(12.0),
                              color: Hexcolor('#171717'),
                            )),
                      ),
                      Container(
                          margin: EdgeInsets.only(
                            top: ScreenUtil().setHeight(6.0),    //Score 3
                          ),
                          child: Text(
                            '56',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              fontSize: ScreenUtil().setWidth(24),
                              color: Hexcolor('#171717'),
                            ),
                          )),
                      Container(
                        margin: EdgeInsets.only(                   //Remark 3
                          top: ScreenUtil().setHeight(2.0),
                        ),
                        child: Text('CAUTION',
                            style: TextStyle(
                              fontFamily: 'roboto',
                              letterSpacing: 0.6,
                              color: Hexcolor('#ff7f56'),
                              fontSize: ScreenUtil().setWidth(9.0),
                            )),
                      ),
                    ],
                  )),
            ],
          ),
          Row(                                               //New Row
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(
                  left: ScreenUtil().setWidth(40.0),
                  top: ScreenUtil().setHeight(40.0),
                ),
                child: Column(                           //Column for Weekly Activities
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Text('Your weekly',
                          style: TextStyle(
                            fontSize: ScreenUtil().setWidth(18.0),
                            fontFamily: 'Montserrat',
                            height: 1.44,
                            color: Hexcolor('#171717'),
                          )),
                    ),
                    Container(
                      child: Text('Activities',
                          style: TextStyle(
                            fontSize: ScreenUtil().setWidth(18.0),
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            height: 1.44,
                            color: Hexcolor('#171717'),
                          )),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: ScreenUtil().setHeight(13.8),
                      ),
                      child: Row(                      //Row implanted for sessions and time
                       children: <Widget>[
                         Container(
                           child: Text('3/5 sessions',
                          style: TextStyle(
                            fontSize: ScreenUtil().setWidth(12.0),
                            fontFamily: 'roboto',
                            color: Hexcolor('#171717').withOpacity(0.5),
                          )),
                         ),
                         Container(
                           margin: EdgeInsets.only(
                             left: ScreenUtil().setWidth(5.5),
                             right: ScreenUtil().setWidth(5.5),
                           ),
                           child: Text('.',
                          style: TextStyle(
                            fontSize: ScreenUtil().setWidth(12.0),
                            fontFamily: 'roboto',
                            color: Hexcolor('#171717').withOpacity(0.5),
                          )),
                         ),
                         Container(
                           child: Text('45 min',
                          style: TextStyle(
                            fontSize: ScreenUtil().setWidth(12.0),
                            fontFamily: 'roboto',
                            color: Hexcolor('#171717').withOpacity(0.5),
                          )),
                         )
                       ], 
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: ScreenUtil().setWidth(112.0),      //Round Graph
                height: ScreenUtil().setHeight(112.0),
                margin: EdgeInsets.only(
                  top: ScreenUtil().setHeight(25.0),
                  right: ScreenUtil().setWidth(42.0),
                ),
                decoration: BoxDecoration(
                 shape: BoxShape.circle,
                 border: Border.all(
                   color: Hexcolor('#e9f6fe'),
                   width: 9,
                 ),
                ),
                child: Center(
                  child: RichText(
                    text: TextSpan(
                      text: '60',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        fontSize: ScreenUtil().setWidth(24),
                        color: Hexcolor('#171717'),
                      ),
                      children: <TextSpan> [
                        TextSpan(
                          text: '%',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                            color: Hexcolor('#171717'),
                          ),
                        ),
                      ]
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: ScreenUtil().setHeight(18.5)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[                           //calender
              Container(
                margin: EdgeInsets.only(
                  left: ScreenUtil().setWidth(20.0),
                ),
                child: Column(                                   //Sunday
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: Text(
                        'Sun',
                        style: TextStyle(
                         fontSize: ScreenUtil().setWidth(10.0),
                         fontFamily: 'roboto',
                         color: Hexcolor('#171717'), 
                        )
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: ScreenUtil().setHeight(4.0),
                      ),
                      child: Text(
                        '9',
                        style: TextStyle(
                         fontSize: ScreenUtil().setWidth(10.0),
                         fontFamily: 'roboto',
                         color: Hexcolor('#171717'), 
                        )
                      ),
                    )
                  ],
                ),
              ),
              Container(
                child: Column(                                   //Monday
                  children: <Widget>[
                    Container(
                      child: Text(
                        'Mon',
                        style: TextStyle(
                         fontSize: ScreenUtil().setWidth(10.0),
                         fontFamily: 'roboto',
                         color: Hexcolor('#171717'), 
                        )
                      ),
                    ),
                    Container( 
                      margin: EdgeInsets.only(
                        top: ScreenUtil().setHeight(4.0),
                      ),
                      child: Text(
                        '10',
                        style: TextStyle(
                         fontSize: ScreenUtil().setWidth(10.0),
                         fontFamily: 'roboto',
                         color: Hexcolor('#171717'), 
                        )
                      ),
                    )
                  ],
                ),
              ),
              Container(
                child: Column(                                   //Tuesday
                  children: <Widget>[
                    Container(
                      child: Text(
                        'Tue',
                        style: TextStyle(
                         fontSize: ScreenUtil().setWidth(10.0),
                         fontFamily: 'roboto',
                         color: Hexcolor('#171717').withOpacity(0.3), 
                        )
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: ScreenUtil().setHeight(4.0),
                      ),
                      child: Text(
                        '11',
                        style: TextStyle(
                         fontSize: ScreenUtil().setWidth(10.0),
                         fontFamily: 'roboto',
                         color: Hexcolor('#171717').withOpacity(0.3), 
                        )
                      ),
                    )
                  ],
                ),
              ),
              Container(
                child: Column(                                   //Wednesday
                  children: <Widget>[
                    Container(
                      child: Text(
                        'Wed',
                        style: TextStyle(
                         fontSize: ScreenUtil().setWidth(10.0),
                         fontFamily: 'roboto',
                         color: Hexcolor('#171717'), 
                        )
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: ScreenUtil().setHeight(4.0),
                      ),
                      child: Text(
                        '12',
                        style: TextStyle(
                         fontSize: ScreenUtil().setWidth(10.0),
                         fontFamily: 'roboto',
                         color: Hexcolor('#171717'), 
                        )
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: ScreenUtil().setWidth(32.0),
                height: ScreenUtil().setHeight(56.0),
                padding: EdgeInsets.only(
                  top: ScreenUtil().setHeight(14.0),
                ),
                decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(8.0),
                 color: Hexcolor('#e9f6fe'), 
                ),
                child: Column(                                   //Thursday
                  children: <Widget>[
                    Container(
                      child: Text(
                        'Thu',
                        style: TextStyle(
                         fontSize: ScreenUtil().setWidth(10.0),
                         fontFamily: 'roboto',
                         color: Hexcolor('#171717'), 
                        )
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: ScreenUtil().setHeight(4.0),
                      ),
                      child: Text(
                        '13',
                        style: TextStyle(
                         fontSize: ScreenUtil().setWidth(10.0),
                         fontFamily: 'roboto',
                         color: Hexcolor('#171717'), 
                        )
                      ),
                    )
                  ],
                ),
              ),
              Container(
                child: Column(                                   //Friday
                  children: <Widget>[
                    Container(
                      child: Text(
                        'Fri',
                        style: TextStyle(
                         fontSize: ScreenUtil().setWidth(10.0),
                         fontFamily: 'roboto',
                         color: Hexcolor('#171717'), 
                        )
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: ScreenUtil().setHeight(4.0),
                      ),
                      child: Text(
                        '14',
                        style: TextStyle(
                         fontSize: ScreenUtil().setWidth(10.0),
                         fontFamily: 'roboto',
                         color: Hexcolor('#171717'), 
                        )
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  right: ScreenUtil().setWidth(20.0),
                ),
                child: Column(                                   //Saturday
                  children: <Widget>[
                    Container(
                      child: Text(
                        'Sat',
                        style: TextStyle(
                         fontSize: ScreenUtil().setWidth(10.0),
                         fontFamily: 'roboto',
                         color: Hexcolor('#171717'), 
                        )
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: ScreenUtil().setHeight(4.0),
                      ),
                      child: Text(
                        '15',
                        style: TextStyle(
                         fontSize: ScreenUtil().setWidth(10.0),
                         fontFamily: 'roboto',
                         color: Hexcolor('#171717'), 
                        )
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: ScreenUtil().setHeight(16.0)),
          Row(
            children: <Widget>[
              Container(
                width: ScreenUtil().setWidth(328.0),
                height: ScreenUtil().setHeight(169.0),
                margin: EdgeInsets.only(
                  left: ScreenUtil().setWidth(16.0),
                ),
                padding: EdgeInsets.only(
                  left: ScreenUtil().setWidth(24.0),
                  bottom: ScreenUtil().setHeight(21.2),
                ),
                decoration: BoxDecoration(
                  color: Hexcolor('#ffdaf7'),
                  borderRadius: BorderRadius.circular(24.0),
                ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        "Today's workout",
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          fontSize: ScreenUtil().setHeight(16.0),
                          color: Hexcolor('#171717'),
                        )
                      ),
                      Text(
                        '10-15 min',
                        style: TextStyle(
                          fontFamily: 'roboto',
                          fontSize: ScreenUtil().setHeight(12.0),
                          color: Hexcolor('#171717'),
                        )
                      ),
                    ],
                  ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
