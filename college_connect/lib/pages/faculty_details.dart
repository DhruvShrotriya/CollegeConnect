import 'dart:convert';
import 'package:college_connect/pages/faculty_overview.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FacultyDetails extends StatefulWidget {
  const FacultyDetails({super.key});

  @override
  State<FacultyDetails> createState() => _FacultyDetailsState();
}

class _FacultyDetailsState extends State<FacultyDetails> {
  var res;
  var faculty_data;
  var api = Uri.parse(
      "https://script.google.com/macros/s/AKfycbx_1IK3140VpH_EP9KuFq-NpIt3qeopGOCtloDWPnUhL-X62fu_OifgLd44QGW5-sjV/exec");
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  fetchData() async {
    res = await http.get(api);
    setState(() {});
    faculty_data = jsonDecode(res.body);
    print(faculty_data.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Faculty Data"),
        elevation: 2.0,
      ),
      body: Center(
          child: res != null
              ? ListView.builder(
                  itemCount: faculty_data.length,
                  itemBuilder: (context, index) {
                    var fdata = faculty_data[index];
                    return ListTile(
                        leading: Hero(
                          tag: fdata['name'],
                          child: CircleAvatar(
                              radius: 25,
                              backgroundImage: NetworkImage(fdata[
                                      'profile_pic'] ??
                                  "data:image/jpeg;base64,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")),
                        ),
                        title: Text(
                          "${fdata["name"]}",
                          style: TextStyle(
                              fontSize: 21,
                              fontFamily: GoogleFonts.lato().fontFamily),
                        ),
                        subtitle: Text(
                          "${fdata["Department"]}",
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: GoogleFonts.lato().fontFamily),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FacultyOverview(
                                      fdata: fdata,
                                    )),
                          );
                        });
                  },
                )
              : CircularProgressIndicator()),
    );
  }
}
