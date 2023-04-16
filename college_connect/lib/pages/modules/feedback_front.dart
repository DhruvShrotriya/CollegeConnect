import 'package:college_connect/g_sheet/feedback_back.dart';
import 'package:college_connect/g_sheet/feedback_sheet_api.dart';
import 'package:college_connect/widgets/round_button.dart';
import 'package:flutter/material.dart';

class FeedbackFront extends StatefulWidget {
  const FeedbackFront({super.key});

  @override
  State<FeedbackFront> createState() => _FeedbackFrontState();
}

class _FeedbackFrontState extends State<FeedbackFront> {
  final nameController = TextEditingController();
  final feedbackController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Feedback"),
      ),
      body: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset("assets/images/feedback_img.png", fit: BoxFit.fill),
                SizedBox(
                  height: 25,
                ),
                Form(
                    child: Column(
                  children: [
                    TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                          labelText: "Name",
                          hintText: "Enter your name",
                          prefixIcon: Icon(Icons.person_2_rounded)),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: feedbackController,
                      decoration: InputDecoration(
                          labelText: "Feedback",
                          hintText: "Enter your Feedback",
                          prefixIcon: Icon(Icons.feedback_rounded)),
                      maxLines: 6,
                    )
                  ],
                )),
                SizedBox(
                  height: 30,
                ),
                RoundButton(
                  title: "Submit feedback",
                  onTap: () async {
                    final sr = await FeedbackSheetApi.getRowCount() + 1;
                    final finalfeed = {
                      FeedbackFeild.SR: sr,
                      FeedbackFeild.name: nameController.text.toString(),
                      FeedbackFeild.date: DateTime.now().toString(),
                      FeedbackFeild.feedback: nameController.text.toString()
                    };

                    await FeedbackSheetApi.insert([finalfeed]);
                  },
                )
              ],
            ),
          )),
    );
  }
}
