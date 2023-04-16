import 'package:college_connect/pages/auth/sign_up.dart';
import 'package:college_connect/pages/post/posr_screen.dart';
import 'package:college_connect/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../widgets/round_button.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool loading = false;
  final _formKey = GlobalKey<FormState>();
  final emailControler = TextEditingController();
  final passwordControler = TextEditingController();
  final _auth = FirebaseAuth.instance;

  get error => null;

  void login() {
    setState(() {
      loading = true;
    });
    _auth
        .signInWithEmailAndPassword(
            email: emailControler.text.toString(),
            password: passwordControler.text.toString())
        .then((value) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => PostScreen()));
      Utils().tostMessage(value.user!.email.toString());
      setState(() {
        loading = false;
      });
    }).onError((error, stackTrace) {
      Utils().tostMessage(error.toString());
      debugPrint(error.toString());
      setState(() {
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("Login"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(children: [
              Image.asset(
                "assets/images/Login_img.png",
                fit: BoxFit.fill,
              ),
              SizedBox(
                height: 55,
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: emailControler,
                        decoration: const InputDecoration(
                            hintText: 'Enter your email',
                            labelText: 'Email',
                            prefixIcon: Icon(Icons.email_rounded)),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Email can't be emty";
                          }

                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      TextFormField(
                        obscureText: true,
                        controller: passwordControler,
                        decoration: const InputDecoration(
                            hintText: 'Enter your pass word ',
                            labelText: 'Password',
                            prefixIcon: Icon(Icons.lock)),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Password can't be emty";
                          } else if (value.length < 6) {
                            return "Password should have atleast 6 characters ";
                          }

                          return null;
                        },
                      ),
                    ],
                  )),
              SizedBox(
                height: 40,
              ),
              RoundButton(
                title: "Login",
                loading: loading,
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    login();
                  }
                },
              ),
              SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  Text("Don't have account"),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpScreen()));
                    },
                    child: Text("Signup"),
                  )
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
