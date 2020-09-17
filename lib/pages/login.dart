import 'dart:convert';

import 'package:StartUp/pages/testPosture.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'config.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final _prefs = SharedPreferences.getInstance();

postlogin(UserCredential user)async{
        var url = Config.backendUrl+'/api/users/login';
        Map<String,String> headers= new Map<String,String>();
        headers['Content-Type']="application/json";
        var bodyData={
          'firstName': user.additionalUserInfo.profile['given_name'].toString(),
          'lastName': user.additionalUserInfo.profile['family_name'].toString(),
          'email':user.additionalUserInfo.profile['email'].toString(),
          'imageUrl':user.additionalUserInfo.profile['picture'].toString()
        };
          print(user);
        print(bodyData);
        var body = jsonEncode(bodyData);
        var response = await http.post(url,headers: headers, body: body);
        _prefs.then((prefs) {
          prefs.setString('firstName', user.additionalUserInfo.profile['given_name']).toString();
          prefs.setString('lastName', user.additionalUserInfo.profile['family_name']).toString();
          prefs.setString('email',user.additionalUserInfo.profile['email']).toString();
          prefs.setString('imageUrl',user.additionalUserInfo.profile['picture']).toString();
          prefs.setString('x-auth-token', response.headers['x-auth-token']);
          //Navigate to Test Posture
          // Navigator.pushNamed(context, TestPosture.id);
        });

          
        // print({"headers",response.headers});
        // print("========="+prefs.getString("firstName"));
}

Future<void> _handleSignIn() async {
  print("logging in with google");
  try {
    var googleUser= await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        final GoogleAuthCredential googleAuthCredential =
            GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        UserCredential user = await _auth.signInWithCredential(googleAuthCredential);
        postlogin(user);
        

  } catch (error) {
    print({"error",error});
  }
}
GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: [
    'email',
  ],
);

signInWithFacebook(context) async{
  print("signInWithFacebook");
  String your_client_id = "1807080746112722";
String your_redirect_url =
    "https://startup-22e64.firebaseapp.com/__/auth/handler";
    
    
  String result = await Navigator.push(
  context,
  MaterialPageRoute(
      builder: (context) => CustomWebView(
            selectedUrl:
                'https://www.facebook.com/dialog/oauth?client_id=$your_client_id&redirect_uri=$your_redirect_url&response_type=token&scope=email,public_profile,',
          ),
      maintainState: true),
);
  if (result != null) {
  try {
    final facebookAuthCred =
        FacebookAuthProvider.credential(result);
    UserCredential user =
        await _auth.signInWithCredential(facebookAuthCred);
        print(user.additionalUserInfo.profile['first_name'].toString());
        postlogin(user);
        Navigator.pushNamed(context, TestPosture.id);
  } catch (e) {print({"error",e});}
}
}



class CustomWebView extends StatefulWidget {
  final String selectedUrl;

  CustomWebView({this.selectedUrl});

  @override
  _CustomWebViewState createState() => _CustomWebViewState();
}

class _CustomWebViewState extends State<CustomWebView> {
  final flutterWebviewPlugin = new FlutterWebviewPlugin();

  @override
  void initState() {
    super.initState();

    flutterWebviewPlugin.onUrlChanged.listen((String url) {
      if (url.contains("#access_token")) {
        succeed(url);
      }

      if (url.contains(
          "https://www.facebook.com/connect/login_success.html?error=access_denied&error_code=200&error_description=Permissions+error&error_reason=user_denied")) {
        denied();
      }
    });
  }

  denied() {
    Navigator.pop(context);
  }

  succeed(String url) {
    var params = url.split("access_token=");

    var endparam = params[1].split("&");

    Navigator.pop(context, endparam[0]);
  }

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
        url: widget.selectedUrl,
        appBar: new AppBar(
          backgroundColor: Color.fromRGBO(66, 103, 178, 1),
          title: new Text("Facebook login"),
        ));
  }
}

class Login extends StatefulWidget {
  static String id = 'login';
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  @override
  void initState() {
    _prefs.then((prefs) => 
      print(prefs.getString("firstName"))
    ).catchError((e)=>print(e));
    super.initState();
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
                      fontSize: ScreenUtil().setSp(20.0),
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
          Center(
            child: ButtonTheme(
                    height: ScreenUtil().setHeight(40.0),
                    minWidth: ScreenUtil().setWidth(328),
                      child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(ScreenUtil().setWidth(20.0)),
                        side: BorderSide(color: Hexcolor('#000000')),
                      ),

                      color: Hexcolor('#ffffff'),
                    onPressed: () {
                      _handleSignIn().whenComplete(() {
                        Navigator.pushNamed(context, TestPosture.id);
                      });
                      
                    },
                    child: Text('Login with GOOGLE',
                    style: TextStyle(
                      color: Hexcolor('#000000'),
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      fontSize: ScreenUtil().setSp(14.0),
                      letterSpacing: 0,
                    ),
                    ),
                ),
                  ),
          ),
          SizedBox(height: ScreenUtil().setHeight(23),),
          //fb login
          Center(
            child: ButtonTheme(
                    height: ScreenUtil().setHeight(40.0),
                    minWidth: ScreenUtil().setWidth(328),
                      child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(ScreenUtil().setWidth(20.0)),
                      ),
                      color: Hexcolor('#1d8bdf'),
                      textColor: Hexcolor('#ffffff'),
                    onPressed: () {
                        signInWithFacebook(context);
                    },
                    child: Text('Login with FACEBOOK',
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
                  fontSize: ScreenUtil().setSp(12),
                  height: 1.4,
                  letterSpacing: 0,
                  color: Hexcolor('#4c4c4c'),
                ),
                children: <TextSpan> [
                  TextSpan(
                    text: ' Privacy Policy ',
                    style: TextStyle(
                  fontFamily: 'roboto',
                  fontSize: ScreenUtil().setSp(12),
                  height: 1.4,
                  letterSpacing: 0,
                  color: Hexcolor('#fe3786'),
                  ),
                  ),
                  TextSpan(
                text: 'and',
                style: TextStyle(
                  fontFamily: 'roboto',
                  fontSize: ScreenUtil().setSp(12),
                  height: 1.4,
                  letterSpacing: 0,
                  color: Hexcolor('#4c4c4c'),
                ),
                  ),
                  TextSpan(
                    text: ' Terms and conditions.',
                    style: TextStyle(
                  fontFamily: 'roboto',
                  fontSize: ScreenUtil().setSp(12),
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