import 'dart:convert';

import 'package:college_connect/pages/faculty_overview.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class PYP_1 extends StatefulWidget {
  const PYP_1({super.key});

  @override
  State<PYP_1> createState() => _PYP_1State();
}

class _PYP_1State extends State<PYP_1> {
  var res;
  var pyp_data;

  var api = Uri.parse(
      "https://script.google.com/macros/s/AKfycbz9nlrY84r_jXof_2rOJ4i9ELHAZ2t4jepS8LBJgEIXSAEANidMrTQHkHjaOEJfybblcg/exec");
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  bool isPermission = false;

  fetchData() async {
    res = await http.get(api);
    setState(() {});
    pyp_data = jsonDecode(res.body);
    print(pyp_data.toString());
  }

  Future<void> _launchURL(String url) async {
    // final Uri uri = Uri(scheme: "https", host: url);
    if (!await launchUrl(url as Uri, mode: LaunchMode.inAppWebView)) {
      throw "Can not launch url";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("1st Year Previous year paper"),
        ),
        body: Center(
            child: res != null
                ? ListView.builder(
                    itemCount: pyp_data.length,
                    itemBuilder: (context, index) {
                      var data = pyp_data[index];
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 6.0),
                        child: ListTile(
                          title: Text(
                            " ${data["sub_name"]}",
                            style: TextStyle(
                                fontSize: 18,
                                fontFamily: GoogleFonts.lato().fontFamily),
                          ),
                          leading: IconButton(
                              onPressed: () {
                                String url = "${data["download_link"]}";
                                Uri uri = Uri.parse(url);
                                //_launchURL("${data["download_link"]}");
                                launchUrl(uri,
                                    mode: LaunchMode
                                        .externalNonBrowserApplication);
                              },
                              icon: Icon(Icons.open_in_browser_rounded)),
                          subtitle: Text(
                            "Course Code :${data["sub_code"]} \nYear :${data["year"]}",
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: GoogleFonts.lato().fontFamily),
                          ),
                        ),
                      );
                    })
                : CircularProgressIndicator()));
  }
}
//CircularProgressIndicator()
