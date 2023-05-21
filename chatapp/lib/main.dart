import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'login.dart';

// Future<void> main() async {
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // await Firebase.initializeApp(
  //     options: FirebaseOptions(
  //   apiKey: "AIzaSyBX_3QverlfJ8mGp10kq_ZWiODJVGPPEOk",
  //   appId: "1:510739377137:web:adeba8a8d9ed9ad984f250",
  //   messagingSenderId: "510739377137",
  //   projectId: "chata-b3914",
  // ));
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'chat',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}
