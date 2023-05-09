import 'dart:convert';

import 'package:college_connect/pages/faculty_overview.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';

class PYP_3 extends StatefulWidget {
  const PYP_3({super.key});

  @override
  State<PYP_3> createState() => _PYP_3State();
}

class _PYP_3State extends State<PYP_3> {
  var res;
  var pyp_data;
  double? _progress;
  var api = Uri.parse(
      "https://script.google.com/macros/s/AKfycbz7j2lVnuvW7DaVeh8LpzUrWO29iEHnP8JlXy25v3jbNCt4d8zxkI-ZJ2AQer5GndoZ/exec");
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
          title: Text("3rd Year Previous year paper"),
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
