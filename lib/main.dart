import 'package:StartUp/pages/capture.dart';
import 'package:StartUp/pages/finishWorkout.dart';
import 'package:StartUp/pages/home.dart';
import 'package:StartUp/pages/imagePreview.dart';
import 'package:StartUp/pages/login.dart';
import 'package:StartUp/pages/onBoarding3.dart';
import 'package:StartUp/pages/profile.dart';
import 'package:StartUp/pages/settings.dart';
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
          initialRoute: OnBoardingThree.id,
          routes: {
          Home.id: (context) => Home(),
          Profile.id: (context) => Profile(),
          OnBoardingThree.id: (context) => OnBoardingThree(),
          WorkoutVideo.id: (context) => WorkoutVideo(),
          TestPosture.id: (context) => TestPosture(),
          Capture.id: (context) => Capture(),
          Login.id: (context) => Login(),
          FinishWorkout.id: (context) => FinishWorkout(),
          PreviewImageScreen.id: (context) => PreviewImageScreen(),
          Settings.id: (context) => Settings(),
    },
  );
      }
    }
  
  
  
  





