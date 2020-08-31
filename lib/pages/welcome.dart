import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: ScreenUtil().setHeight(27.0),
            color: Hexcolor('#000000'),
          ),
          SizedBox(height: ScreenUtil().setHeight(35),),
          Row(
            children: <Widget>[
              Container(
                  margin: EdgeInsets.only(
                    left: ScreenUtil().setWidth(17.5),
                  ),
                  width: ScreenUtil().setWidth(4.0),
                  height: ScreenUtil().setHeight(81.0),
                  decoration: BoxDecoration(color: Hexcolor('#e9f6fe'),),
                  ),
                  Container(
                    width: ScreenUtil().setWidth(278),
                margin: EdgeInsets.only(
                  left: ScreenUtil().setWidth(21.5),
                ),
                child: Text('Let our AI analyse and guide you to a better posture',
                    style: TextStyle(
                      fontSize: ScreenUtil().setHeight(20.0),
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      color: Hexcolor('#000000'),
                      letterSpacing: 0.0,
                      height: 1.4,
                    )),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
              left: ScreenUtil().setWidth(22.6),
              right: ScreenUtil().setWidth(22.6),
              top: ScreenUtil().setHeight(125.7),
              bottom: ScreenUtil().setHeight(132.4),
            ),
            child: Center(
              child: Image.asset('assets/images/signin.png'),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              left: ScreenUtil().setWidth(18.0),
            ),
            child: ButtonTheme(
                    height: ScreenUtil().setHeight(40.0),
                      child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(ScreenUtil().setWidth(20.0)),
                      ),
                      padding: EdgeInsets.only(
                        left: ScreenUtil().setWidth(132.5),
                        right: ScreenUtil().setWidth(132.5),
                      ),
                      color: Hexcolor('#fe3786'),
                      textColor: Hexcolor('#ffffff'),
                    onPressed: () {
                        Scaffold
                            .of(context)
                            .showSnackBar(SnackBar(content: Text('Processing Data')));
                    },
                    child: Text('SIGN-UP',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      fontSize: ScreenUtil().setWidth(14.0),
                      letterSpacing: 0,
                    ),
                    ),
                ),
              ),
          ),
          SizedBox(height: ScreenUtil().setHeight(17),),
          Center(
            child: RichText(
              text: TextSpan(
                  text: "Already have an account? ",
                  style: TextStyle(
                    fontFamily: 'roboto',
                    fontSize: ScreenUtil().setWidth(14),
                    height: 1.4,
                    letterSpacing: 0,
                    color: Hexcolor('#4c4c4c'),
                  ),
                  children: <TextSpan> [
                    TextSpan(
                      text: 'Login',
                      style: TextStyle(
                    fontFamily: 'roboto',
                    fontWeight: FontWeight.bold,
                    fontSize: ScreenUtil().setWidth(14),
                    height: 1.4,
                    letterSpacing: 0,
                    color: Hexcolor('#fe3786'),
                    ),
                    ),
                  ],
            ),
            ),
          )
        ],
      ),
    );
  }
}