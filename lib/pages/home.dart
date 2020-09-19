import 'dart:convert';

import 'package:StartUp/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'components/scoreContainer.dart';
import 'config.dart';
class Home extends StatefulWidget {
  static String id = 'home';
  @override
  _HomeState createState() => _HomeState();
}

final _prefs = SharedPreferences.getInstance();

class _HomeState extends State<Home> {

  String selectedDate = "Select";

  bool isPressed = false;

  String name = "";
  var scores=[];

  @override
  void initState() {
    print("debug");
      _prefs.then((prefs)=>{
        setState(() {
          name=prefs.getString('firstName')+'.';
          // +prefs.getString('lastName');

      })
    }).catchError((e)=>print(e));


    _prefs.then((prefs){
      var url = Config.backendUrl+'/api/users/scores';
      var token = prefs.getString('x-auth-token');  
      Map<String,String> headers= new Map<String,String>();
      headers['x-auth-token']=token;
      return http.get(url,headers: headers);
    }).then((response){
      print(response.body);
      setState(() {
        
        scores=JsonDecoder().convert(response.body);
      });
    }).catchError((e)=>print(e));
    
    
    
    super.initState();
  }
  

  void handlePress() {
   if(isPressed == false) {
     isPressed = true;
   } else {
     isPressed = false;
   }
  }

  getDropDownItems(){
    List<DropdownMenuItem<String>> array=new List<DropdownMenuItem<String>>();
      // array.add(DropdownMenuItem(child: Text("Select Date"), value: "Select Date",));
    
    for(var score in scores){
      print("dbg---");
      array.add(DropdownMenuItem(child: Text(score['date'].substring(0,7)), value: score['date'].substring(0, 7),));
    }
    return array;
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
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[ 
                Padding(
                  padding: EdgeInsets.only(
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
                           fontSize: ScreenUtil().setSp(28),
                           height: 1.42, 
                         ),
                       ),
                     ),
                     Container(
                       child: Text(
                         name,
                         style: TextStyle(
                           fontFamily: 'neutrifpro',
                           fontSize: ScreenUtil().setSp(28),
                           height: 1.42,
                         ),
                       ),
                     ),
                   ], 
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, Profile.id);
                  },
                   child: Hero(
                     tag: 'profilepic',
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
                   ),
                )
              ],
            ),
            SizedBox(
              height: ScreenUtil().setHeight(27.5),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: ScreenUtil().setWidth(40),
                right: ScreenUtil().setWidth(40),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(                                               //posture
                  crossAxisAlignment: CrossAxisAlignment.start,
                   children: <Widget>[
                      Text('Posture',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: ScreenUtil().setSp(16.0),
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
                  Container(
                    width: ScreenUtil().setWidth(80),
                    height: ScreenUtil().setHeight(24),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(ScreenUtil().setWidth(12.3),),
                      border: Border.all(color: Hexcolor('#fe3786'),),
                    ),
                    child: Center(
                      child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                          icon: Icon(
                            Icons.keyboard_arrow_down,
                            color: Hexcolor('#fe3786'),
                            size: ScreenUtil().setWidth(10),
                          ),
                          value: selectedDate,
                          style: TextStyle(
                            fontFamily: 'roboto',
                            color: Hexcolor('#fe3786'),
                            fontSize: ScreenUtil().setSp(10.0),
                          ),
                         items: 
                          getDropDownItems()
                         ,
                         onChanged: (value) {
                          setState(() {
                            selectedDate = value;
                          });
                         },
                         ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: ScreenUtil().setHeight(17.0),),
            //Horizontal Scroll
            Padding(
              padding: EdgeInsets.only(
                left: ScreenUtil().setWidth(16),
                right: ScreenUtil().setWidth(8),
              ),
              child: Container(
                height: ScreenUtil().setHeight(128),
                child: Expanded(
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      ScoreContainer(deformality: 'Text Neck', score: '75', bgColour: Hexcolor('#ffeeee'),textColour: Hexcolor('#ff4747'), remark: 'SEVERE',),
                      ScoreContainer(deformality: 'Kyphosis', score: '75', bgColour: Hexcolor('#ffeeee'),textColour: Hexcolor('#ff4747'), remark: 'SEVERE',),
                      ScoreContainer(deformality: 'Swayback', score: '75', bgColour: Hexcolor('#ffeeee'),textColour: Hexcolor('#ff4747'), remark: 'SEVERE',),
                      ScoreContainer(deformality: 'Slouch', score: '75', bgColour: Hexcolor('#ffeeee'),textColour: Hexcolor('#ff4747'), remark: 'SEVERE',),
                      ScoreContainer(deformality: 'Knock Knees', score: '75', bgColour: Hexcolor('#ffeeee'),textColour: Hexcolor('#ff4747'), remark: 'SEVERE',),    
                    ],
                  ),
                ),
              ),
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
                              fontSize: ScreenUtil().setSp(18.0),
                              fontFamily: 'Montserrat',
                              height: 1.44,
                              color: Hexcolor('#171717'),
                            )),
                      ),
                      Container(
                        child: Text('Activities',
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(18.0),
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
                              fontSize: ScreenUtil().setSp(12.0),
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
                              fontSize: ScreenUtil().setSp(12.0),
                              fontFamily: 'roboto',
                              color: Hexcolor('#171717').withOpacity(0.5),
                            )),
                           ),
                           Container(
                             child: Text('45 min',
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(12.0),
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
                          fontSize: ScreenUtil().setSp(24),
                          color: Hexcolor('#171717'),
                        ),
                        children: <TextSpan> [
                          TextSpan(
                            text: '%',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: ScreenUtil().setSp(12.0),
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
                           fontSize: ScreenUtil().setSp(10.0),
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
                           fontSize: ScreenUtil().setSp(10.0),
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
                           fontSize: ScreenUtil().setSp(10.0),
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
                           fontSize: ScreenUtil().setSp(10.0),
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
                           fontSize: ScreenUtil().setSp(10.0),
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
                           fontSize: ScreenUtil().setSp(10.0),
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
                           fontSize: ScreenUtil().setSp(10.0),
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
                           fontSize: ScreenUtil().setSp(10.0),
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
                           fontSize: ScreenUtil().setSp(10.0),
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
                           fontSize: ScreenUtil().setSp(10.0),
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
                           fontSize: ScreenUtil().setSp(10.0),
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
                           fontSize: ScreenUtil().setSp(10.0),
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
                           fontSize: ScreenUtil().setSp(10.0),
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
                           fontSize: ScreenUtil().setSp(10.0),
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
            Center(
              child: Container(
                width: ScreenUtil().setWidth(328.0),
                height: ScreenUtil().setHeight(169.0),
                decoration: BoxDecoration(
                  color: Hexcolor('#ffdaf7'),
                  borderRadius: BorderRadius.circular(24.0),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: ScreenUtil().setHeight(21),
                        left: ScreenUtil().setWidth(18),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              "Today's workout",
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                fontSize: ScreenUtil().setSp(16.0),
                                color: Hexcolor('#171717'),
                              )
                            ),
                            Text(
                          '10-15 min',
                          style: TextStyle(
                            fontFamily: 'roboto',
                            fontSize: ScreenUtil().setSp(12.0),
                            color: Hexcolor('#171717'),
                          )
                        ),
                        ],
                      ),
                    ),
                    Container(
                     width: ScreenUtil().setWidth(150),
                     child: Image.asset('assets/images/chick.png')),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


