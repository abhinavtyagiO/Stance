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



Future<Null> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(StartUp());
}

    class StartUp extends StatelessWidget {
      @override
      Widget build(BuildContext context) {
        return MaterialApp(
          title: 'STANCE',
          initialRoute: '/tp',
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
  
  
  
  





