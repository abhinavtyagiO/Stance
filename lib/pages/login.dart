import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';

Future<void> _handleSignIn() async {
  print("logging in with google");
  try {
    var res= await _googleSignIn.signIn();
    print(res);
  } catch (error) {
    print(error);
  }
}
GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: [
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
          //title
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
          //image
          Padding(
            padding: EdgeInsets.only(
              left: ScreenUtil().setWidth(22.6),
              right: ScreenUtil().setWidth(22.6),
              top: ScreenUtil().setHeight(115.7),
              bottom: ScreenUtil().setHeight(75.4),
            ),
            child: Center(
              child: Image.asset('assets/images/signin.png'),
            ),
          ),
          //google login
          Container(
            margin: EdgeInsets.only(
              left: ScreenUtil().setWidth(16.0),
            ),
            child: ButtonTheme(
                    height: ScreenUtil().setHeight(40.0),
                      child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(ScreenUtil().setWidth(20.0)),
                        side: BorderSide(color: Hexcolor('#000000')),
                      ),
                      padding: EdgeInsets.only(
                        left: ScreenUtil().setWidth(91),
                        right: ScreenUtil().setWidth(91),
                      ),
                      color: Hexcolor('#ffffff'),
                    onPressed: () {
                      _handleSignIn();
                        // Scaffold
                        //     .of(context)
                        //     .showSnackBar(SnackBar(content: Text('Processing Data')));
                    },
                    child: Text('Login with GOOGLE',
                    style: TextStyle(
                      color: Hexcolor('#000000'),
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      fontSize: ScreenUtil().setWidth(14.0),
                      letterSpacing: 0,
                    ),
                    ),
                ),
                  ),
          ),
          SizedBox(height: ScreenUtil().setHeight(23),),
          //fb login
          Container(
            margin: EdgeInsets.only(
              left: ScreenUtil().setWidth(16.0),
            ),
            child: ButtonTheme(
                    height: ScreenUtil().setHeight(40.0),
                      child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(ScreenUtil().setWidth(20.0)),
                      ),
                      padding: EdgeInsets.only(
                        left: ScreenUtil().setWidth(80.5),
                        right: ScreenUtil().setWidth(80.5),
                      ),
                      color: Hexcolor('#1d8bdf'),
                      textColor: Hexcolor('#ffffff'),
                    onPressed: () {
                        Scaffold
                            .of(context)
                            .showSnackBar(SnackBar(content: Text('Processing Data')));
                    },
                    child: Text('Login with FACEBOOK',
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
          SizedBox(height: ScreenUtil().setHeight(15),),
          //terms and conditions
          Container(
            margin: EdgeInsets.only(
              left: ScreenUtil().setWidth(40),
              right: ScreenUtil().setWidth(40),
            ),
            child: RichText(
              text: TextSpan(
                text: "By continuing, you agree to stance's",
                style: TextStyle(
                  fontFamily: 'roboto',
                  fontSize: ScreenUtil().setWidth(12),
                  height: 1.4,
                  letterSpacing: 0,
                  color: Hexcolor('#4c4c4c'),
                ),
                children: <TextSpan> [
                  TextSpan(
                    text: ' Privacy Policy ',
                    style: TextStyle(
                  fontFamily: 'roboto',
                  fontSize: ScreenUtil().setWidth(12),
                  height: 1.4,
                  letterSpacing: 0,
                  color: Hexcolor('#fe3786'),
                  ),
                  ),
                  TextSpan(
                text: 'and',
                style: TextStyle(
                  fontFamily: 'roboto',
                  fontSize: ScreenUtil().setWidth(12),
                  height: 1.4,
                  letterSpacing: 0,
                  color: Hexcolor('#4c4c4c'),
                ),
                  ),
                  TextSpan(
                    text: ' Terms and conditions.',
                    style: TextStyle(
                  fontFamily: 'roboto',
                  fontSize: ScreenUtil().setWidth(12),
                  height: 1.4,
                  letterSpacing: 0,
                  color: Hexcolor('#fe3786'),
                  ),
                  ),
                ]
              ),
            ),
            ),
        ],
      ),
    );
  }
}