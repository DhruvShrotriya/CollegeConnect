import 'package:college_connect/widgets/round_button.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailControler = TextEditingController();
  final passwordControler = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailControler.dispose();
    passwordControler.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(children: [
            Image.asset(
              "assets/images/LoginImg.png",
              fit: BoxFit.fill,
            ),
            SizedBox(
              height: 65,
            ),
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: emailControler,
                      decoration: const InputDecoration(
                          hintText: 'Email',
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
                          hintText: 'Password',
                          prefixIcon: Icon(Icons.password_rounded)),
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
              height: 35,
            ),
            RoundButton(
              title: "Login",
              onTap: () {
                if (_formKey.currentState!.validate()) {}
              },
            )
          ]),
        ),
      ),
    );
  }
}
