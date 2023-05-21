import 'package:flutter/material.dart';

import '../firebase_services/splash_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    SpalashServices splashService = SpalashServices();

    super.initState();
    splashService.islogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        title: Text(""),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Image.asset(
          "assets/images/trans_ss_img.png",
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
