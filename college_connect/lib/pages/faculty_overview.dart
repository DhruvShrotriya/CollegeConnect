import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FacultyOverview extends StatelessWidget {
  final fdata;

  const FacultyOverview({super.key, required this.fdata});
  //const FacultyOverview({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          fdata['name'],
        ),
      ),
      body: Container(
        // decoration: const BoxDecoration(
        //     gradient: LinearGradient(colors: [
        //   Colors.deepPurple,
        //   Colors.deepPurpleAccent,
        //   Color.fromRGBO(140, 64, 206, 0.992),
        //   Color.fromRGBO(166, 96, 216, 0.992),
        // ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 35,
              ),
              Hero(
                tag: fdata['name'],
                child: CircleAvatar(
                    radius: 75,
                    backgroundImage: NetworkImage(fdata['profile_pic'])),
              ),
              SizedBox(
                height: 22,
              ),
              Text(
                "Designation :   ${fdata["designation"]}",
                style: TextStyle(
                    fontSize: 15,
                    fontFamily: GoogleFonts.lato().fontFamily,
                    color: Colors.white),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Department :   ${fdata["Department"]}",
                style: TextStyle(
                    fontSize: 15,
                    fontFamily: GoogleFonts.lato().fontFamily,
                    color: Colors.white),
              ),
              SizedBox(
                height: 35,
              ),
              Text(
                "General Information",
                style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    fontFamily: GoogleFonts.lato().fontFamily,
                    color: Color.fromARGB(255, 177, 174, 174)),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Phone Number  :   ${fdata["phno"]}",
                style: TextStyle(
                    fontSize: 15,
                    fontFamily: GoogleFonts.lato().fontFamily,
                    color: Colors.white),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Email ID  :  ${fdata["emial"]}",
                style: TextStyle(
                    fontSize: 15,
                    fontFamily: GoogleFonts.lato().fontFamily,
                    color: Colors.white),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Office  :   ${fdata["office"]}",
                style: TextStyle(
                    fontSize: 15,
                    fontFamily: GoogleFonts.lato().fontFamily,
                    color: Colors.white),
              ),
              SizedBox(
                height: 35,
              ),
              Text(
                "Specialisation",
                style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    fontFamily: GoogleFonts.lato().fontFamily,
                    color: Color.fromARGB(255, 177, 174, 174)),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "${fdata["Specialisation"]}",
                style: TextStyle(
                    fontSize: 15,
                    fontFamily: GoogleFonts.lato().fontFamily,
                    color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
