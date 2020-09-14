import 'package:StartUp/pages/capture.dart';
import 'package:StartUp/pages/finishWorkout.dart';
import 'package:StartUp/pages/home.dart';
import 'package:StartUp/pages/imagePreview.dart';
import 'package:StartUp/pages/login.dart';
import 'package:StartUp/pages/onBoarding3.dart';
import 'package:StartUp/pages/profile.dart';
import 'package:StartUp/pages/testPosture.dart';
import 'package:StartUp/pages/workoutVideo.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

Future<Null> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  
  runApp(StartUp());
}

    class StartUp extends StatelessWidget {
      @override
      Widget build(BuildContext context) {
        //var cred=FacebookAuthProvider.credential("accessToken");
        //print(cred);
        //print(cred.accessToken);
        //print(cred.asMap());
        return MaterialApp(
          title: 'STANCE',
          initialRoute: '/obt',
          routes: {
          '/': (context) => Home(),
          '/profile': (context) => Profile(),
          '/obt': (context) => OnBoardingThree(),
          '/wv': (context) => WorkoutVideo(),
          '/tp': (context) => TestPosture(),
          '/capture': (context) => Capture(),
          '/login': (context) => Login(),
          '/fw': (context) => FinishWorkout(),
          '/preview': (context) => PreviewImageScreen(),
    },
  );
      }
    }
  
  
  
  





