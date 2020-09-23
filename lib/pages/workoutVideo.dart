import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:StartUp/pages/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';


class WorkoutVideo extends StatefulWidget {
  static String id = 'workoutVideo';
  @override
  _WorkoutVideoState createState() => _WorkoutVideoState();
}
final _prefs = SharedPreferences.getInstance();

class _WorkoutVideoState extends State<WorkoutVideo> {
  var scores=[];

  YoutubePlayerController controller;
  TextEditingController idController;
  TextEditingController seekToController;

  PlayerState playerState;
  YoutubeMetaData videoMetaData;
  double volume = 100;
  bool muted = false;
  bool isPlayerReady = false;

  final List<String> listz = [
    'W9nZ6u15yis',
  ];

  final List<String> listk = [
    //k1, k2-pre, k2, k3.....
    'xNIVcf0uXDI',
    '15PscOkG_cM',
    'hceOGYHxUXs',
    'xeupG7ErZUM',
    'W--jDiGrFIg',
    'xoxtDxCQmCM',
    'vnK2BOfQFEE',
    'F5fb-OFNamQ',
  ];
  final List<String> listf = [
    'sHUg1XbQZXo',
    'MFzTJSVImac',
    'bP9yPhZYLTU',
    'VhgVT5mcejs',
    'wo4iZS0z9Q8',
    'VdRUBZOeC0Q',
  ];

  List<String> getList() {
    
    if(scores.length == 0) {
      return listz;
    } else {
      if(scores.last['scores']['textNeck'] > 30) {
      return listf;
    } else if (scores.last['scores']['textNeck'] < 30) {
      return getList();
    }
    }
  }

  @override
  void initState() {

    _prefs.then((prefs){
      var url = Config.backendUrl+'/api/users/scores';
      var token = prefs.getString('x-auth-token');  
      Map<String,String> headers= new Map<String,String>();
      headers['x-auth-token']=token;
      return http.get(url,headers: headers);
    }).then((response){
      setState(() {
        scores=JsonDecoder().convert(response.body);
        print(scores);
      });
    }).catchError((e)=>print(e));


    super.initState();

    controller = YoutubePlayerController(
      initialVideoId: getList().first,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
      )..addListener(listener);
      idController = TextEditingController();
      seekToController = TextEditingController();
      videoMetaData =  const YoutubeMetaData();
      playerState = PlayerState.unknown;


  } 

  void listener() {
    if (isPlayerReady && mounted && !controller.value.isFullScreen) {
      setState(() {
        playerState = controller.value.playerState;
        videoMetaData = controller.metadata;
      });
    }
  }
  @override
  void deactivate() {
    //pauses video while navigating to next page
    controller.pause();
    super.deactivate();
  }
  @override
  void dispose() {
    controller.dispose();
    idController.dispose();
    seekToController.dispose();
    super.dispose();

  }
  

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    ScreenUtil.init(
      context,
      width: 360,
      height: 760,
    );
    return Scaffold(
      backgroundColor: Hexcolor('#ffffff'),
      body: SafeArea(
        child: YoutubePlayerBuilder(

          player: YoutubePlayer(
            controller: controller,
            showVideoProgressIndicator: true,
            onReady: () {
              isPlayerReady = true;
            },
            onEnded: (metaData) {
              controller.load(getList()[(getList().indexOf(metaData.videoId) + 1) % getList().length]);
              // if()
              print('Next Video started!');
            },
            topActions: [
              Spacer(),
              IconButton(
                icon: Icon(
                  controller.value.isPlaying
                  ? Icons.pause
                  : Icons.play_arrow,
                  color: Hexcolor('#ffffff'),
                ),
                onPressed: isPlayerReady 
                ? () {
                  
                  controller.value.isPlaying
                  ? controller.pause()
                  : controller.play();
                  setState(() {
                    
                  });
                } : () {
                  print('Play pressed');
                }
                ,
                
              ),
            ],
            bottomActions: [
              Padding(
                padding: EdgeInsets.only(
                  left: ScreenUtil().setHeight(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RemainingDuration(controller: controller,),
                    Text(
                      'Name of video',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        fontSize: ScreenUtil().setSp(10),
                        letterSpacing: 0,
                        color: Hexcolor('#ffffff'),
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              IconButton(
                icon: Icon(
                  Icons.skip_next,
                  color: Hexcolor('#ffffff'),
                ), 
                onPressed: isPlayerReady 
                ? () {
                  controller.load(getList()[(getList().indexOf(controller.metadata.videoId) + 1) % getList().length]); 
                  
                } : null,
                ),
            ],
            ), 
          builder: (context, player) {
           return Container();
          },
          ),
      ),
    );
  }
}


