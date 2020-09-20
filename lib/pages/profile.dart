import 'package:StartUp/pages/settings.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'components/progress.dart';
import 'components/friends.dart';

class Profile extends StatefulWidget {
  static String id = 'profile';
  @override
  _ProfileState createState() => _ProfileState();
}
final _prefs = SharedPreferences.getInstance();

class _ProfileState extends State<Profile> {

  String name = "";

   bool isFriendsPressed = true;
   bool isProgressPressed = false;

   //update tab
   void updateTab(int serialNumber) {
     if(serialNumber == 1) {
       if(isFriendsPressed == false) {
         isFriendsPressed = true;
         isProgressPressed = false;
       } 
     } if (serialNumber == 2) {
       if(isProgressPressed == false) {
         isFriendsPressed = false;
         isProgressPressed = true;
       }
     }
   }
   @override
  void initState() {
    print('debug');
    _prefs.then((prefs) {
      setState(() {
        name = prefs.getString('firstName')+ ' ' +prefs.getString('lastName');
      });
    });


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
        backgroundColor: Hexcolor('#111111'),
        body: SafeArea(
            child: Column(
            children: <Widget>[
              //top bar
              Padding(
                padding: EdgeInsets.only(
                  left: ScreenUtil().setWidth(9),
                  right: ScreenUtil().setWidth(14),
                  top: ScreenUtil().setHeight(10),
                  bottom: ScreenUtil().setHeight(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                        child: Icon(
                          Icons.keyboard_arrow_left,
                          color: Hexcolor('#ffffff'),
                          size: ScreenUtil().setWidth(30.0),
                        ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(new PageRouteBuilder(
                            opaque: true,
                            transitionDuration: const Duration(milliseconds: 180),
                            pageBuilder: (BuildContext context, _, __) {
                              return new Settings();
                            },
                            transitionsBuilder: (_, Animation<double> animation, __, Widget child) {

                              return new SlideTransition(
                              child: child,
                                position: new Tween<Offset>(
                                  begin: const Offset(1, 0),
                                  end: Offset.zero,
                                ).animate(animation),
                              );
                            }
                        ));
                      },
                      child: Icon(
                        Icons.settings,
                        color: Hexcolor('#ffffff'),
                        size: ScreenUtil().setWidth(20.0),
                      ),
                    )
                  ],
                ),
              ),
              //name and profile photo
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Positioned(
                        child: Hero(
                          tag: 'profilepic',
                            child: Container(
                            margin: EdgeInsets.only(
                              left: ScreenUtil().setWidth(40.0),
                              right: ScreenUtil().setWidth(22.5),
                              bottom: ScreenUtil().setHeight(40.0),
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
                      ),
                      Positioned(
                        top: ScreenUtil().setHeight(50.4),
                        left: ScreenUtil().setWidth(88.4),
                        child: Container(
                          width: ScreenUtil().setWidth(28.8),
                          height: ScreenUtil().setHeight(28.8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  ScreenUtil().setWidth(12.0)),
                              border: Border.all(
                                color: Hexcolor('#111111'),
                                width: ScreenUtil().setWidth(3.0),
                              ),
                              color: Hexcolor('#fe3786')),
                          child: Center(
                            child: Text('6',
                                style: TextStyle(
                                  color: Hexcolor('#ffffff'),
                                  fontFamily: 'roboto',
                                  fontWeight: FontWeight.bold,
                                  fontSize: ScreenUtil().setSp(12.0),
                                  letterSpacing: 0,
                                )),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Text(
                          name,
                          style: TextStyle(
                            color: Hexcolor('#ffffff'),
                            fontFamily: 'Montserrat',
                            fontSize: ScreenUtil().setSp(18.0),
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
                                  fontSize: ScreenUtil().setSp(10.0),
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
              Expanded(
                 child: Container(
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(ScreenUtil().setWidth(24),),
                     color: Hexcolor('#ffffff'),
                   ),      
                   child: ListView(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                          top: ScreenUtil().setHeight(17),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  updateTab(1);
                                });
                              },
                               child: Column(
                                 children: [
                                   Text(
                                     'Friends',
                                     style: TextStyle(
                                       fontFamily: 'Montserrat',
                                       fontWeight: FontWeight.bold,
                                       fontSize: ScreenUtil().setSp(16),
                                       letterSpacing: 0,
                                       color: isFriendsPressed ? Hexcolor('#000000') : Hexcolor('#000000').withOpacity(0.5),
                                     ),
                                   ),
                                   Padding(
                                      padding: EdgeInsets.only(
                                       top: ScreenUtil().setHeight(4),
                                     ),
                                     child: CircleAvatar(
                                       backgroundColor: isFriendsPressed ? Hexcolor('#fe3786') : Hexcolor('#ffffff'),
                                       radius: ScreenUtil().setWidth(3),
                                     ),
                                   ),
                                 ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  updateTab(2);
                                });
                              },
                              child: Column(
                                children: [
                                  Text(
                                    'Progress',
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      fontSize: ScreenUtil().setSp(16),
                                      letterSpacing: 0,
                                      color: isProgressPressed ? Hexcolor('#000000') : Hexcolor('#000000').withOpacity(0.5),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: ScreenUtil().setHeight(4),
                                    ),
                                    child: CircleAvatar(
                                      backgroundColor: isProgressPressed ? Hexcolor('#fe3786') : Hexcolor('#ffffff'),
                                      radius: ScreenUtil().setWidth(3),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                       isProgressPressed ? Progress() : Container(),

                       isFriendsPressed ? Friends() : Container(),
                      
                    ],
                ),
                 ),
              ),
            ],
          ),
        ));
  }
}



