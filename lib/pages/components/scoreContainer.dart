import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScoreContainer extends StatelessWidget {
   ScoreContainer({this.deformality, this.score, this.remark, this.bgColour, this.textColour});

   final String deformality;
   final String score;
   final String remark;
   final Color bgColour;
   final Color textColour;



  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(
          right: ScreenUtil().setWidth(8),
        ),
        child: Container(
            width: ScreenUtil().setWidth(96.0), 
            height: ScreenUtil().setHeight(128),          
            decoration: BoxDecoration(
              color: bgColour,
              borderRadius: BorderRadius.circular(24.0),
            ),
            child: Column(                                       
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                    width: ScreenUtil().setWidth(24.0),
                    height: ScreenUtil().setHeight(24.0),
                    margin: EdgeInsets.only(
                      top: ScreenUtil().setHeight(15.5),
                    ),
                    decoration: BoxDecoration(
                      color: Hexcolor('#ffffff'),
                      borderRadius: BorderRadius.circular(8.0),
                    )),
                Container(
                  margin: EdgeInsets.only(
                    top: ScreenUtil().setHeight(8.0),          
                  ),
                  child: Text(deformality,
                      style: TextStyle(
                        fontFamily: 'roboto',
                        fontWeight: FontWeight.bold,
                        fontSize: ScreenUtil().setSp(12.0),
                        color: Hexcolor('#171717'),
                        letterSpacing: 0.6,
                      )),
                ),
                Container(
                    margin: EdgeInsets.only(              
                      top: ScreenUtil().setHeight(6.0),
                    ),
                    child: Text(
                      score,
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        fontSize: ScreenUtil().setSp(24),
                        color: Hexcolor('#171717'),
                      ),
                    )),
                    
                Container(
                  margin: EdgeInsets.only(
                    top: ScreenUtil().setHeight(2.0),
                  ),
                  child: Text(remark,                  
                      style: TextStyle(
                        fontFamily: 'roboto',
                        letterSpacing: 0.6,
                        color: textColour,
                        fontSize: ScreenUtil().setSp(9.0),
                      )),
                ),
              ],
            )),
      ),
    );
  }
}