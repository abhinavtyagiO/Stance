import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Friends extends StatefulWidget {

  @override
  _FriendsState createState() => _FriendsState();
}

class _FriendsState extends State<Friends> {
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
            child: Text('Leaderboard',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: ScreenUtil().setWidth(16.0),
                  height: 1.44,
                  color: Hexcolor('#000000'),
                )),
          ),
          Container(
            width: ScreenUtil().setWidth(103.5),
            height: ScreenUtil().setHeight(4.0),
            color: Hexcolor('#e9f6fe'),
          ),
        ],
      ),
    ),
    Padding(
      padding: EdgeInsets.only(
        top: ScreenUtil().setHeight(14),
        left: ScreenUtil().setWidth(16),
        right: ScreenUtil().setWidth(16),
      ),
      child: Expanded(
          child: Container(
          decoration: BoxDecoration(
            color: Hexcolor('#f3f3f7'),
            borderRadius: BorderRadius.circular(ScreenUtil().setWidth(24),),
          ),
          child: Padding(
            padding: EdgeInsets.only(
              top: ScreenUtil().setHeight(24),
              bottom: ScreenUtil().setHeight(8),
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: ScreenUtil().setWidth(24.5),
                    right: ScreenUtil().setWidth(24),
                    bottom: ScreenUtil().setHeight(16),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              right: ScreenUtil().setWidth(16.5),
                            ),
                            child: Text(
                        '1',
                        style: TextStyle(
                            fontFamily: 'roboto',
                            fontSize: ScreenUtil().setWidth(12),
                            letterSpacing: 0,
                            color: Hexcolor('#000000'),
                        ),
                      ),
                          ),
                      Container(
                        width: ScreenUtil().setWidth(24),
                        height: ScreenUtil().setHeight(24),
                        decoration: BoxDecoration(
                          color: Hexcolor('#ffffff'),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: ScreenUtil().setWidth(15.2),
                        ),
                        child: Text(
                        'Mohd. Arbab',
                        style: TextStyle(
                          fontFamily: 'roboto',
                          fontSize: ScreenUtil().setWidth(12),
                          letterSpacing: 0,
                          color: Hexcolor('#000000'),
                        ),
                      ),
                      ),
                        ],
                      ),
                      Text(
                        '450',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontFamily: 'roboto',
                          fontSize: ScreenUtil().setWidth(12),
                          letterSpacing: 0,
                          color: Hexcolor('#000000'),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: ScreenUtil().setWidth(24.5),
                    right: ScreenUtil().setWidth(24),
                    bottom: ScreenUtil().setHeight(16),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              right: ScreenUtil().setWidth(16.5),
                            ),
                            child: Text(
                        '2',
                        style: TextStyle(
                            fontFamily: 'roboto',
                            fontSize: ScreenUtil().setWidth(12),
                            letterSpacing: 0,
                            color: Hexcolor('#000000'),
                        ),
                      ),
                          ),
                      Container(
                        width: ScreenUtil().setWidth(24),
                        height: ScreenUtil().setHeight(24),
                        decoration: BoxDecoration(
                          color: Hexcolor('#ffffff'),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: ScreenUtil().setWidth(15.2),
                        ),
                        child: Text(
                        'Ramdev Saharan',
                        style: TextStyle(
                          fontFamily: 'roboto',
                          fontSize: ScreenUtil().setWidth(12),
                          letterSpacing: 0,
                          color: Hexcolor('#000000'),
                        ),
                      ),
                      ),
                        ],
                      ),
                      Text(
                        '400',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontFamily: 'roboto',
                          fontSize: ScreenUtil().setWidth(12),
                          letterSpacing: 0,
                          color: Hexcolor('#000000'),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: ScreenUtil().setWidth(24.5),
                    right: ScreenUtil().setWidth(24),
                    bottom: ScreenUtil().setHeight(16),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              right: ScreenUtil().setWidth(16.5),
                            ),
                            child: Text(
                        '3',
                        style: TextStyle(
                            fontFamily: 'roboto',
                            fontSize: ScreenUtil().setWidth(12),
                            letterSpacing: 0,
                            color: Hexcolor('#000000'),
                        ),
                      ),
                          ),
                      Container(
                        width: ScreenUtil().setWidth(24),
                        height: ScreenUtil().setHeight(24),
                        decoration: BoxDecoration(
                          color: Hexcolor('#ffffff'),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: ScreenUtil().setWidth(15.2),
                        ),
                        child: Text(
                        'Ansh Singhai',
                        style: TextStyle(
                          fontFamily: 'roboto',
                          fontSize: ScreenUtil().setWidth(12),
                          letterSpacing: 0,
                          color: Hexcolor('#000000'),
                        ),
                      ),
                      ),
                        ],
                      ),
                      Text(
                        '350',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontFamily: 'roboto',
                          fontSize: ScreenUtil().setWidth(12),
                          letterSpacing: 0,
                          color: Hexcolor('#000000'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
    SizedBox(height: ScreenUtil().setHeight(16),),
    //Share
    Padding(
      padding: EdgeInsets.only(
        left: ScreenUtil().setWidth(16),
        right: ScreenUtil().setWidth(16),
      ),
      child: Container(
        height: ScreenUtil().setHeight(160),
        decoration: BoxDecoration(
          color: Hexcolor('#95e6ff'),
          borderRadius: BorderRadius.circular(ScreenUtil().setWidth(24),),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: ScreenUtil().setHeight(26),
                left: ScreenUtil().setWidth(24.5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Share with friends',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w800,
                      fontSize: ScreenUtil().setWidth(14),
                      letterSpacing: 0,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: ScreenUtil().setHeight(7),
                    ),
                    child: Container(
                      width: ScreenUtil().setWidth(162),
                      child: Text(
                        'Get fit and pain free with your friends, share your unique link and compete.',
                        style: TextStyle(
                          fontFamily: 'roboto',
                          fontSize: ScreenUtil().setWidth(12),
                          height: 1.4,
                          letterSpacing: 0, 
                          color: Hexcolor('#000000').withOpacity(0.7),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Image.asset('assets/images/friends.png'),
              height: ScreenUtil().setHeight(130),
              ),
          ],
        ),
      ),
    ),
      ],
    );
  }
}
