import 'package:StartUp/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

final _prefs = SharedPreferences.getInstance();

class Report extends StatefulWidget {
  static String id = 'report';

  @override
  _ReportState createState() => _ReportState();
}

class _ReportState extends State<Report> {

  getColor(swayback_){
    return (int.parse(swayback_).abs()<normal)?Hexcolor('#00b279'):((int.parse(swayback_).abs()<caution)?Hexcolor('#ff7f56'):Hexcolor('#ff4747'));
  }

  var imageFrontPath;
  var imageSidePath;

  String slouch="...";
  String kyphosis="...";  

  String swayback="...";
  String knees="...";  

  int normal=30;
  int caution=70;

  initPaths() async{
    final p = await getExternalStorageDirectory();
      print(p.path);
      final folderPath=p.path+'/Stance';
      final folder=new Directory(folderPath);
      if(await folder.exists()==false){
        await folder.create();
      }
      setState(() {
         imageFrontPath = "${folder.path}/front.png";
      imageSidePath = "${folder.path}/side.png";
      });
     
  }
  @override
  void initState() {
    initPaths();
      _prefs.then((prefs){
                              slouch=prefs.getInt('slouch').toString();
                              kyphosis=prefs.getInt('kyphosis').toString();
                              swayback=prefs.getInt('swayback').toString();
                              knees=prefs.getInt('knees').toString();
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
      backgroundColor: Hexcolor('#ffffff'),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Padding(
              padding: EdgeInsets.only(
                left: ScreenUtil().setWidth(14.5),
                top: ScreenUtil().setHeight(35),
                bottom: ScreenUtil().setHeight(32),
              ),
              child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
               Container(
                  width: ScreenUtil().setWidth(4.0),
                  height: ScreenUtil().setHeight(23.0),
                  decoration: BoxDecoration(color: Hexcolor('#e9f6fe')),
                  ),
                  Container(
                margin: EdgeInsets.only(
                  left: ScreenUtil().setWidth(21.5),
                  right: ScreenUtil().setWidth(45.0),
                ),
                child: Container(
                  child: Text('Posture report',
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(20.0),
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w800,
                        color: Hexcolor('#000000'),
                        letterSpacing: 0,
                      )),
                ),
              ),
          ],
        ),
            ),
            Padding(
      padding: EdgeInsets.only(
        left: ScreenUtil().setWidth(16),
        right: ScreenUtil().setWidth(16),
        bottom: ScreenUtil().setHeight(40),
        ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
              width: ScreenUtil().setWidth(160),
              height: ScreenUtil().setHeight(216.0),
              child: (imageFrontPath!=null)? Image.file(File(imageFrontPath), fit: BoxFit.fitWidth) :Container(),
              decoration: BoxDecoration(
                color: Hexcolor('#f3f3f7'),
                borderRadius: BorderRadius.circular(
                    ScreenUtil().setWidth(16.0)),
              )),
          Container(
              width: ScreenUtil().setWidth(160),
              height: ScreenUtil().setHeight(216.0),
              child: (imageSidePath!=null)? Image.file(File(imageSidePath), fit: BoxFit.fitWidth):Container(),
              decoration: BoxDecoration(
                color: Hexcolor('#f3f3f7'),
                borderRadius: BorderRadius.circular(
                    ScreenUtil().setWidth(16.0)),
              )),
        ],
      ),
    ),
    Padding(
      padding: EdgeInsets.only(
        left: ScreenUtil().setWidth(40),
        right: ScreenUtil().setWidth(40),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
              height: ScreenUtil().setHeight(24.0),
              width: ScreenUtil().setWidth(24.0),
              decoration: BoxDecoration(
                color: Hexcolor('#f3f3f7'),
                borderRadius: BorderRadius.circular(
                    ScreenUtil().setWidth(8.0)),
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
                          fontSize: ScreenUtil().setSp(12.0),
                        ),
                      ),
                      Text(
                        slouch+'/100',
                        style: TextStyle(
                          color:
                              Hexcolor('#000000').withOpacity(0.5),
                          fontFamily: 'roboto',
                          letterSpacing: 0.6,
                          fontSize: ScreenUtil().setSp(9.0),
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
            width: ScreenUtil().setWidth(64),
              height: ScreenUtil().setHeight(24),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(ScreenUtil().setWidth(12.3)),
                color: Hexcolor('#fff4e9'),
              ),
              child: Center(
                child: Text(
                    (int.parse(slouch)<normal)?'Normal':((int.parse(slouch)<caution)?'Caution':'Severe'),
                    style: TextStyle(
                      color: getColor(slouch),
                      fontFamily: 'roboto',
                      fontSize: ScreenUtil().setSp(10.0),
                      letterSpacing: 0.0,
                    ),
                  ),
              ),
          ),
        ],
      ),
    ),
    SizedBox(height: ScreenUtil().setHeight(16.5),),
    Padding(
      padding: EdgeInsets.only(
        left: ScreenUtil().setWidth(40),
        right: ScreenUtil().setWidth(40),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
              height: ScreenUtil().setHeight(24.0),
              width: ScreenUtil().setWidth(24.0),
              decoration: BoxDecoration(
                color: Hexcolor('#f3f3f7'),
                borderRadius: BorderRadius.circular(
                    ScreenUtil().setWidth(8.0)),
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
                        'Kyphosis',
                        style: TextStyle(
                          color: Hexcolor('#000000'),
                          fontFamily: 'roboto',
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.6,
                          fontSize: ScreenUtil().setSp(12.0),
                        ),
                      ),
                      Text(
                        kyphosis+'/100',
                        style: TextStyle(
                          color:
                              Hexcolor('#000000').withOpacity(0.5),
                          fontFamily: 'roboto',
                          letterSpacing: 0.6,
                          fontSize: ScreenUtil().setSp(9.0),
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
            width: ScreenUtil().setWidth(64),
            height: ScreenUtil().setHeight(24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(ScreenUtil().setHeight(12.3)),
              color: Hexcolor('#ffeeee'),
            ),
            child: Center(
              child: Text(
                  (int.parse(kyphosis)<normal)?'Normal':((int.parse(kyphosis)<caution)?'Caution':'Severe'),
                  style: TextStyle(
                    color: getColor(swayback),
                    fontFamily: 'roboto',
                    fontSize: ScreenUtil().setSp(10.0),
                    letterSpacing: 0.0,
                  ),
                ),
            ),
          )
        ],
      ),
    ),
    SizedBox(height: ScreenUtil().setHeight(16.5),),
    //scoliosis
    Padding(
      padding: EdgeInsets.only(
        left: ScreenUtil().setWidth(40),
        right: ScreenUtil().setWidth(40),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
              height: ScreenUtil().setHeight(24.0),
              width: ScreenUtil().setWidth(24.0),
              decoration: BoxDecoration(
                color: Hexcolor('#f3f3f7'),
                borderRadius: BorderRadius.circular(
                    ScreenUtil().setWidth(8.0)),
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
                        'Swayback',
                        style: TextStyle(
                          color: Hexcolor('#000000'),
                          fontFamily: 'roboto',
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.6,
                          fontSize: ScreenUtil().setSp(12.0),
                        ),
                      ),
                      Text(
                        swayback+'/100',
                        style: TextStyle(
                          color:
                              Hexcolor('#000000').withOpacity(0.5),
                          fontFamily: 'roboto',
                          letterSpacing: 0.6,
                          fontSize: ScreenUtil().setSp(9.0),
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
            width: ScreenUtil().setWidth(64),
              height: ScreenUtil().setHeight(24),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(ScreenUtil().setWidth(12.3)),
                color: Hexcolor('#e9f9f1'),
              ),
              child: Center(
                child: Text(
                    (int.parse(swayback)<normal)?'Normal':((int.parse(swayback)<caution)?'Caution':'Severe'),
                    style: TextStyle(
                      color: getColor(swayback),
                      fontFamily: 'roboto',
                      fontSize: ScreenUtil().setSp(10.0),
                      letterSpacing: 0.0,
                    ),
                  ),
              ),
          )
        ],
      ),
    ),
    SizedBox(height: ScreenUtil().setHeight(16.5),),
    Padding(
      padding: EdgeInsets.only(
        left: ScreenUtil().setWidth(40),
        right: ScreenUtil().setWidth(40),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
              height: ScreenUtil().setHeight(24.0),
              width: ScreenUtil().setWidth(24.0),
              decoration: BoxDecoration(
                color: Hexcolor('#f3f3f7'),
                borderRadius: BorderRadius.circular(
                    ScreenUtil().setWidth(8.0)),
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
                        (int.parse(knees)>0)?'Bow Legs':'Knock knees',
                        style: TextStyle(
                          color: Hexcolor('#000000'),
                          fontFamily: 'roboto',
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.6,
                          fontSize: ScreenUtil().setSp(12.0),
                        ),
                      ),
                      Text(
                        '20/100',
                        style: TextStyle(
                          color:
                              Hexcolor('#000000').withOpacity(0.5),
                          fontFamily: 'roboto',
                          letterSpacing: 0.6,
                          fontSize: ScreenUtil().setSp(9.0),
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
            width: ScreenUtil().setWidth(64),
              height: ScreenUtil().setHeight(24),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(ScreenUtil().setWidth(12.3)),
                color: Hexcolor('#e9f9f1'),
              ),
              child: Center(
                child: Text(
                    (int.parse(knees).abs()<normal)?'Normal':((int.parse(knees).abs()<caution)?'Caution':'Severe'),
                    style: TextStyle(
                      color: getColor(knees),
                      fontFamily: 'roboto',
                      fontSize: ScreenUtil().setSp(10.0),
                      letterSpacing: 0.0,
                                ),
                              ),
                          ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: ScreenUtil().setHeight(40),
              ),
              child: ButtonTheme(
                      height: ScreenUtil().setHeight(40.0),
                      minWidth: ScreenUtil().setWidth(328),
                        child: FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(ScreenUtil().setWidth(20.0)),
                        ),
                        color: Hexcolor('#fe3786'),
                        textColor: Hexcolor('#ffffff'),
                      onPressed: () {
                       Navigator.pushNamed(context, Home.id);
                      },
                      child: Text('CONTINUE',
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
          ],
        ),
      ),
    );
  }
}