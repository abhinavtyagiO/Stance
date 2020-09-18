import 'package:StartUp/pages/frontposeCapture.dart';
import 'package:StartUp/pages/finishWorkout.dart';
import 'package:StartUp/pages/home.dart';
import 'package:StartUp/pages/frontposeimagePreview.dart';
import 'package:StartUp/pages/login.dart';
import 'package:StartUp/pages/onBoarding3.dart';
import 'package:StartUp/pages/profile.dart';
import 'package:StartUp/pages/report.dart';
import 'package:StartUp/pages/settings.dart';
import 'package:StartUp/pages/sideposeCapture.dart';
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
          initialRoute: Login.id,
          routes: {
          Home.id: (context) => Home(),
          Profile.id: (context) => Profile(),
          OnBoardingThree.id: (context) => OnBoardingThree(),
          WorkoutVideo.id: (context) => WorkoutVideo(),
          TestPosture.id: (context) => TestPosture(),
          FrontCapture.id: (context) => FrontCapture(),
          Login.id: (context) => Login(),
          FinishWorkout.id: (context) => FinishWorkout(),
          FrontposePreviewImageScreen.id: (context) => FrontposePreviewImageScreen(),
          Settings.id: (context) => Settings(),
          SideCapture.id: (context,) => SideCapture(ModalRoute.of(context).settings.arguments),
          Report.id: (context) => Report(),
    },
  );
      }
    }
  
  
  // x-auth-token:eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjVmNWZhYzA0MmY4OGE1MDAxN2QwMzliOCIsImlhdCI6MTYwMDI3NzA1Nn0.x1_Qq-SnOeobrfWJ8fSzgP9Wvj_havUCIdH8L6JlRLo
  





