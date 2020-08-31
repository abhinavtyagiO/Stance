import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();

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
                  height: ScreenUtil().setHeight(23.0),
                  decoration: BoxDecoration(color: Hexcolor('#e9f6fe'))),
              Container(
                margin: EdgeInsets.only(
                  left: ScreenUtil().setWidth(21.5),
                ),
                child: Text('Create new account',
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
          SizedBox(
            height: ScreenUtil().setHeight(28.0),
          ),
          Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(
                    left: ScreenUtil().setWidth(16.0),
                    right: ScreenUtil().setWidth(16.0),
                  ),
                  width: ScreenUtil().setWidth(328.0),
                  height: ScreenUtil().setHeight(48.0),
                  padding: EdgeInsets.only(
                    left: ScreenUtil().setWidth(24.0),
                    top: ScreenUtil().setHeight(3.0),
                    right: ScreenUtil().setWidth(24.0),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(
                      color: Hexcolor('#cccbdb'),
                    ),
                  ),
                  child: TextFormField(
                    textCapitalization: TextCapitalization.words,
                    keyboardType: TextInputType.text ,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please fill this field!';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'First Name',
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        fontFamily: 'roboto',
                        fontSize: ScreenUtil().setWidth(14.0),
                        letterSpacing: 0,
                        height: 1.4,
                        color: Hexcolor('#000000').withOpacity(0.5),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: ScreenUtil().setHeight(16.0),),
                Container(
                  margin: EdgeInsets.only(
                    left: ScreenUtil().setWidth(16.0),
                    right: ScreenUtil().setWidth(16.0),
                  ),
                  width: ScreenUtil().setWidth(328.0),
                  height: ScreenUtil().setHeight(48.0),
                  padding: EdgeInsets.only(
                    left: ScreenUtil().setWidth(24.0),
                    top: ScreenUtil().setHeight(3.0),
                    right: ScreenUtil().setWidth(24.0),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(
                      color: Hexcolor('#cccbdb'),
                    ),
                  ),
                  child: TextFormField(
                    textCapitalization: TextCapitalization.words,
                    keyboardType: TextInputType.text ,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please fill this field!';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Last Name',
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        fontFamily: 'roboto',
                        fontSize: ScreenUtil().setWidth(14.0),
                        letterSpacing: 0,
                        height: 1.4,
                        color: Hexcolor('#000000').withOpacity(0.5),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: ScreenUtil().setHeight(16.0),),
                Container(
                  margin: EdgeInsets.only(
                    left: ScreenUtil().setWidth(16.0),
                    right: ScreenUtil().setWidth(16.0),
                  ),
                  width: ScreenUtil().setWidth(328.0),
                  height: ScreenUtil().setHeight(48.0),
                  padding: EdgeInsets.only(
                    left: ScreenUtil().setWidth(24.0),
                    top: ScreenUtil().setHeight(3.0),
                    right: ScreenUtil().setWidth(24.0),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(
                      color: Hexcolor('#cccbdb'),
                    ),
                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress ,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter your Email!';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Email ID',
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        fontFamily: 'roboto',
                        fontSize: ScreenUtil().setWidth(14.0),
                        letterSpacing: 0,
                        height: 1.4,
                        color: Hexcolor('#000000').withOpacity(0.5),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: ScreenUtil().setHeight(16.0),),
                Container(
                  margin: EdgeInsets.only(
                    left: ScreenUtil().setWidth(16.0),
                    right: ScreenUtil().setWidth(16.0),
                  ),
                  width: ScreenUtil().setWidth(328.0),
                  height: ScreenUtil().setHeight(48.0),
                  padding: EdgeInsets.only(
                    left: ScreenUtil().setWidth(24.0),
                    top: ScreenUtil().setHeight(3.0),
                    right: ScreenUtil().setWidth(24.0),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(
                      color: Hexcolor('#cccbdb'),
                    ),
                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.text ,
                    obscureText: true,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please set your password!';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Password ( 8+ characters )',
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        fontFamily: 'roboto',
                        fontSize: ScreenUtil().setWidth(14.0),
                        letterSpacing: 0,
                        height: 1.4,
                        color: Hexcolor('#000000').withOpacity(0.5),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(16.0),
                ),
                ButtonTheme(
                  height: ScreenUtil().setHeight(40.0),
                    child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(ScreenUtil().setWidth(20.0)),
                    ),
                    padding: EdgeInsets.only(
                      left: ScreenUtil().setWidth(132.5),
                      right: ScreenUtil().setWidth(132.5),
                    ),
                    color: Hexcolor('#000000').withOpacity(0.5),
                    textColor: Hexcolor('#ffffff'),
                  onPressed: () {
                    // Validate returns true if the form is valid, otherwise false.
                    if (_formKey.currentState.validate()) {
                      // If the form is valid, display a snackbar. In the real world,
                      // you'd often call a server or save the information in a database.
                      Scaffold
                          .of(context)
                          .showSnackBar(SnackBar(content: Text('Processing Data')));
                    }
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
              ],
            ),
          ),
          SizedBox(height: ScreenUtil().setHeight(25.0),),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(
                  left: ScreenUtil().setWidth(16.0),
                ),
                width: ScreenUtil().setWidth(148.0),
                height: ScreenUtil().setHeight(1.0),
                color: Hexcolor('#cccbdb'),
              ),
              Text(
                'OR',
                style: TextStyle(
                  fontFamily: 'roboto',
                  fontSize: ScreenUtil().setWidth(12.0),
                  height: 1.4,
                  color: Hexcolor("#cccbdb"),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  right: ScreenUtil().setWidth(16.0),
                ),
                width: ScreenUtil().setWidth(148.0),
                height: ScreenUtil().setHeight(1.0),
                color: Hexcolor('#cccbdb'),
              ),
            ],
          ),
          SizedBox(height: ScreenUtil().setHeight(25.0),),
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
                        left: ScreenUtil().setWidth(73.5),
                        right: ScreenUtil().setWidth(73.5),
                      ),
                      color: Hexcolor('#1d8bdf'),
                      textColor: Hexcolor('#ffffff'),
                    onPressed: () {
                        Scaffold
                            .of(context)
                            .showSnackBar(SnackBar(content: Text('Processing Data')));
                    },
                    child: Text('Sign up with FACEBOOK',
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
          SizedBox(height: ScreenUtil().setHeight(23.0),),
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
                        left: ScreenUtil().setWidth(84),
                        right: ScreenUtil().setWidth(84),
                      ),
                      color: Hexcolor('#ffffff'),
                    onPressed: () {
                        Scaffold
                            .of(context)
                            .showSnackBar(SnackBar(content: Text('Processing Data')));
                    },
                    child: Text('Sign up with GOOGLE',
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
          SizedBox(height: ScreenUtil().setHeight(23.0),),
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
                        left: ScreenUtil().setWidth(91),
                        right: ScreenUtil().setWidth(91),
                      ),
                      color: Hexcolor('#000000'),
                      textColor: Hexcolor('#ffffff'),
                    onPressed: () {
                        Scaffold
                            .of(context)
                            .showSnackBar(SnackBar(content: Text('Processing Data')));
                    },
                    child: Text('Sign up with APPLE',
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
