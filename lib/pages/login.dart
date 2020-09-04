
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

 final FirebaseAuth _auth = FirebaseAuth.instance;
// final GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);


void signInWithGoogle() async {
 try {
      UserCredential userCredential;

      
        final GoogleSignInAccount googleUser = await GoogleSignIn(scopes: ['email']).signIn();
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        final GoogleAuthCredential googleAuthCredential =
            GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        userCredential = await _auth.signInWithCredential(googleAuthCredential);
      

      final user = userCredential.user;
      print({"loggedIn:",user});
    } catch (e) {
      print("Loggin failed");
      print(e);
    }
}

String your_client_id = "1807080746112722";
String your_redirect_url =
    "https://startup-22e64.firebaseapp.com/__/auth/handler";

loginWithFacebook( context) async{
    await _auth.signOut();
  String result = await Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => CustomWebView(
            selectedUrl:
               'https://www.facebook.com/dialog/oauth?client_id=$your_client_id&redirect_uri=$your_redirect_url&response_type=token&scope=email,public_profile,',),
      maintainState: true),
);
print({"result:",result});
  if (result != null) {
    try {
      final AuthCredential credential = FacebookAuthProvider.credential(result);
        //credential.token=result;
        print({"credential:",credential});
        final User user = (await _auth.signInWithCredential(credential)).user;
        
        print({"LoggedIn:",user});
    } catch (e) {
      print("error logging in Fb:");
      print(e);
    }
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
    flutterWebviewPlugin.cleanCookies();
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
    print("==============================denied-------------------------------");
    flutterWebviewPlugin.dispose();
    Navigator.pop(context);
  }

  succeed(String url) {
    print("==============================succeded-------------------------------");
    var params = url.split("access_token=");

    var endparam = params[1].split("&");
    flutterWebviewPlugin.dispose();
    Navigator.pop(context, endparam[0]);
  }

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
        url: widget.selectedUrl,
        clearCache: true,
        clearCookies: true,
        appBar: new AppBar(
          backgroundColor: Color.fromRGBO(66, 103, 178, 1),
          title: new Text("Facebook login"),
        ));
  }
}

// GoogleSignIn _googleSignIn = GoogleSignIn(
//   scopes: [
//     'email',
//     'https://www.googleapis.com/auth/contacts.readonly',
//   ],
// );

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
                    onPressed: ()async {
                        signInWithGoogle();
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
                      loginWithFacebook(context);
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