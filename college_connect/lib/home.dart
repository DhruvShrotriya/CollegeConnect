// import 'package:college_connect/pages/faculty_details.dart';
// import 'package:college_connect/pages/modules/cab_chatpage.dart';
// import 'package:college_connect/pages/modules/feedback_front.dart';
// import 'package:college_connect/pyp_home.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:url_launcher/url_launcher.dart';
import 'package:college_connect/pages/faculty_details.dart';
import 'package:college_connect/pages/modules/cab_chatpage.dart';
import 'package:college_connect/pages/modules/feedback_front.dart';
import 'package:college_connect/pages/modules/maps.dart';
import 'package:college_connect/pyp_home.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'cal.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? email = FirebaseAuth.instance.currentUser!.email;
  final List<GridItem> items = [
    GridItem(icon: Icons.contacts_rounded, text: 'Faculty Directory'),
    GridItem(icon: Icons.calendar_month_rounded, text: 'Event Calendar'),
    GridItem(icon: Icons.pageview_rounded, text: 'Previous Year paper'),
    GridItem(icon: Icons.local_taxi_rounded, text: 'Cab Sharing'),
    GridItem(icon: Icons.search_rounded, text: 'Lost and found'),
    GridItem(icon: Icons.schedule_rounded, text: 'Time Table'),
    GridItem(icon: Icons.map, text: 'Maps'),
    GridItem(icon: Icons.feedback_rounded, text: 'Feedback'),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Homepage'),
          centerTitle: true,
        ),
        body: GridScreen(items: items, email: email),
      ),
    );
  }
}

class GridScreen extends StatelessWidget {
  final List<GridItem> items;

  var email;

  GridScreen({required this.items, required this.email});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: items.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (BuildContext context, int index) {
        return GridTile(
          child: GridItemButton(
            item: items[index],
            onTap: () {
              print('Tapped ${items[index].text}  ${index}');
              if (index == 0) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FacultyDetails()));
              }
              if (index == 1) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => UpcomingEventsPage()));
              }
              if (index == 2) {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => PYP()));
              }
              if (index == 3) {
                print(email);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => cchatpage(email: email)));
              }
              if (index == 4) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FacultyDetails()));
              }
              if (index == 5) {
                String url = "https://nuweb.nirmauni.ac.in/tt/cse/";
                Uri uri = Uri.parse(url);
                launchUrl(uri, mode: LaunchMode.inAppWebView);
              }
              if (index == 6) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => NiramaMaps()));
              }
              if (index == 7) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FeedbackFront()));
              }
            },
          ),
        );
      },
    );
  }
}

class GridItem {
  final IconData icon;
  final String text;

  GridItem({required this.icon, required this.text});
}

// class Home extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.deepPurple,
//       ),
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Homepage'),
//           centerTitle: true,
//         ),
//         body: GridScreen(),
//       ),
//     );
//   }
// }

// class GridScreen extends StatelessWidget {
//   final List<GridItem> items = [
//     GridItem(icon: Icons.contacts_rounded, text: 'Faculty Directory'),
//     GridItem(icon: Icons.calendar_month_rounded, text: 'Event Calendar'),
//     GridItem(icon: Icons.pageview_rounded, text: 'Previous Year paper'),
//     GridItem(icon: Icons.local_taxi_rounded, text: 'Cab Sharing'),
//     GridItem(icon: Icons.search_rounded, text: 'Lost and found'),
//     GridItem(icon: Icons.schedule_rounded, text: 'Time Table'),
//     GridItem(icon: Icons.map, text: 'Maps'),
//     GridItem(icon: Icons.feedback_rounded, text: 'Feedback'),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//       itemCount: items.length,
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//       ),
//       itemBuilder: (BuildContext context, int index) {
//         return GridTile(
//           child: GridItemButton(
//             item: items[index],
//             onTap: () {
//               print('Tapped ${items[index].text}  ${index}');
//               if (index == 0) {
//                 Navigator.push(context,
//                     MaterialPageRoute(builder: (context) => FacultyDetails()));
//               }
//               if (index == 1) {
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => cchatpage(
//                               email: "dhruvshrotriya03@gmail.com",
//                             )));
//               }
//               if (index == 2) {
//                 Navigator.push(
//                     context, MaterialPageRoute(builder: (context) => PYP()));
//               }
//               if (index == 3) {
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => cchatpage(
//                               email: "dhruvshrotriya03@gmail.com",
//                             )));
//               }
//               if (index == 4) {
//                 Navigator.push(context,
//                     MaterialPageRoute(builder: (context) => FacultyDetails()));
//               }
//               if (index == 5) {
//                 String url = "https://nuweb.nirmauni.ac.in/tt/cse/";
//                 Uri uri = Uri.parse(url);

//                 launchUrl(uri, mode: LaunchMode.inAppWebView);
//               }
//               if (index == 6) {
//                 Navigator.push(context,
//                     MaterialPageRoute(builder: (context) => FacultyDetails()));
//               }
//               if (index == 7) {
//                 Navigator.push(context,
//                     MaterialPageRoute(builder: (context) => FeedbackFront()));
//               }
//             },
//           ),
//         );
//       },
//     );
//   }
// }

// class GridItem {
//   final IconData icon;
//   final String text;

//   GridItem({required this.icon, required this.text});
// }

class GridItemButton extends StatelessWidget {
  final GridItem item;
  final VoidCallback onTap;

  const GridItemButton({required this.item, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(item.icon, size: 55),
          SizedBox(height: 18),
          Text(item.text),
        ],
      ),
    );
  }
}
