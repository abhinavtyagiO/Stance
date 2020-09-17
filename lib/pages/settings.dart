import 'package:StartUp/pages/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

final _prefs = SharedPreferences.getInstance();

class Settings extends StatefulWidget {
  static String id = 'settings';
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  bool switchValue = true;


  void logOut(context) async {
    var prefs = await _prefs;
    prefs.clear();
    //
    Navigator.pushNamed(context, Login.id);
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
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: ScreenUtil().setWidth(9),
                top: ScreenUtil().setHeight(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                     child: Icon(
                      Icons.keyboard_arrow_left,
                      color: Hexcolor('#000000'),
                      size: ScreenUtil().setWidth(30),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: ScreenUtil().setWidth(20),
                    ),
                    child: Text(
                      'Settings',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: ScreenUtil().setSp(18),
                        letterSpacing: 0,
                        color: Hexcolor('#000000'),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: ScreenUtil().setHeight(17),),
            Expanded(
              child: ListView(
                physics: NeverScrollableScrollPhysics(),
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.only(
                      left: ScreenUtil().setWidth(16),
                      right: ScreenUtil().setWidth(6.4),
                    ),
                    title: Text(
                      'Notifications',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                        fontSize: ScreenUtil().setSp(14),
                        letterSpacing: 0,
                        color: Hexcolor('#000000'),
                      ),
                    ),
                    trailing: Transform.scale(
                      scale: 0.6,
                      child: CupertinoSwitch(
                        activeColor: Hexcolor('#fe3786'),
                        value: switchValue, 
                        onChanged: (value) {
                          setState(() {
                            switchValue = value;
                          });
                        },
                        ),
                    ),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.only(
                      left: ScreenUtil().setWidth(16),
                    ),
                    title: Text(
                      'Support',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                        fontSize: ScreenUtil().setSp(14),
                        letterSpacing: 0,
                        color: Hexcolor('#000000'),
                      ),
                    ),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.only(
                      left: ScreenUtil().setWidth(16),
                    ),
                    title: Text(
                      'Terms & Conditions',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                        fontSize: ScreenUtil().setSp(14),
                        letterSpacing: 0,
                        color: Hexcolor('#000000'),
                      ),
                    ),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.only(
                      left: ScreenUtil().setWidth(16),
                    ),
                    title: Text(
                      'Privacy Policy',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                        fontSize: ScreenUtil().setSp(14),
                        letterSpacing: 0,
                        color: Hexcolor('#000000'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: ScreenUtil().setHeight(32),
              ),
              child: ButtonTheme(
                      height: ScreenUtil().setHeight(40.0),
                        child: FlatButton(
                          splashColor: Hexcolor('#fe3786').withOpacity(0.1),
                          highlightColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(ScreenUtil().setWidth(20.0)),
                          side: BorderSide(color: Hexcolor('#fe3786')),
                        ),
                        padding: EdgeInsets.only(
                          left: ScreenUtil().setWidth(130),
                          right: ScreenUtil().setWidth(130),
                        ),
                        color: Hexcolor('#ffffff'),
                      onPressed: () {
                        //Implement Log out
                        logOut(context);
                      },
                      child: Text('LOG OUT',
                      style: TextStyle(
                        color: Hexcolor('#fe3786'),
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        fontSize: ScreenUtil().setSp(14.0),
                        letterSpacing: 0,
                      ),
                      ),
                  ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}