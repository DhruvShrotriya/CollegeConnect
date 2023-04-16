import 'package:college_connect/g_sheet/feedback_sheet_api.dart';
import 'package:college_connect/pages/faculty_details.dart';
import 'package:college_connect/pages/modules/feedback_front.dart';
import 'package:college_connect/pages/splash_screen.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FeedbackSheetApi.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        //  home: SplashScreen()
        home: FacultyDetails());
    //home: FeedbackFront());
  }
}
