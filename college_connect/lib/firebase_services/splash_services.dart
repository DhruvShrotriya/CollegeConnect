import 'package:college_connect/pages/auth/login_screen.dart';
import 'package:college_connect/pages/auth/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:async';

class SpalashServices {
  void islogin(BuildContext context) {
    Timer(
        Duration(seconds: 2),
        () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LoginScreen(),
            )));
  }
}
