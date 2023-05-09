import 'package:college_connect/pyp_1.dart';
import 'package:college_connect/pyp_2.dart';
import 'package:college_connect/pyp_3.dart';
import 'package:college_connect/pyp_4.dart';
import 'package:college_connect/widgets/round_button.dart';
import 'package:flutter/material.dart';

class PYP extends StatefulWidget {
  const PYP({super.key});

  @override
  State<PYP> createState() => _PYPState();
}

class _PYPState extends State<PYP> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Previous Year Paper"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
            child: Column(
          children: [
            Image.asset(
              "assets/images/pyp_img.png",
              fit: BoxFit.fill,
            ),
            SizedBox(
              height: 42,
            ),
            RoundButton(
                title: "First year paper",
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => PYP_1())));
                }),
            SizedBox(
              height: 35,
            ),
            RoundButton(
                title: "Second year paper",
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => PYP_2())));
                }),
            SizedBox(
              height: 35,
            ),
            RoundButton(
                title: "Third year paper",
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => PYP_3())));
                }),
            SizedBox(
              height: 35,
            ),
            RoundButton(
                title: "Fourth year paper",
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => PYP_4())));
                })
          ],
        )),
      ),
    );
  }
}
