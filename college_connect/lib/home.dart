import 'package:college_connect/pages/faculty_details.dart';
import 'package:college_connect/pages/modules/feedback_front.dart';
import 'package:college_connect/pyp_home.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
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
        body: GridScreen(),
      ),
    );
  }
}

class GridScreen extends StatelessWidget {
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FacultyDetails()));
              }
              if (index == 2) {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => PYP()));
              }
              if (index == 3) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FacultyDetails()));
              }
              if (index == 4) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FacultyDetails()));
              }
              if (index == 5) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FacultyDetails()));
              }
              if (index == 6) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FacultyDetails()));
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
// class Home extends StatelessWidget {
//   const Home({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Home"),
//         centerTitle: true,
//       ),
//       // body: GridView.count(
//       //   crossAxisCount: 3,
//       //   crossAxisSpacing: 8,
//       //   mainAxisSpacing: 8,
//       //   children: List.generate(choices.length, (index) {
//       //     return Padding(
//       //       padding: const EdgeInsets.all(8.0),
//       //       child: Center(
//       //         child: SelectCard(
//       //           choice: choices[index],
//       //         ),
//       //       ),
//       //     );
//       //   }),
//       // ),
//       body: GridScreen(),
//     );
//   }
// }

// // class Choice {
// //   const Choice({required this.title, required this.icon});
// //   final String title;
// //   final IconData icon;
// // }

// // const List<Choice> choices = const <Choice>[
// //   const Choice(title: 'Faculty Directory', icon: Icons.contacts),
// //   const Choice(title: 'Event Calender', icon: Icons.calendar_month),
// //   const Choice(title: 'Maps', icon: Icons.map),
// //   const Choice(title: 'PYP', icon: Icons.phone),
// //   const Choice(title: 'Lost and found', icon: Icons.camera_alt),
// //   const Choice(title: 'Cab Sharing', icon: Icons.car_rental_rounded),
// //   const Choice(title: 'Time Table', icon: Icons.schedule),
// //   const Choice(title: 'Feedback', icon: Icons.feedback_rounded),
// // ];

// // class SelectCard extends StatelessWidget {
// //   SelectCard({Key? key, required this.choice}) : super(key: key);
// //   final Choice choice;

// //   @override
// //   Widget build(BuildContext context) {
// //     final TextStyle? textStyle = Theme.of(context).textTheme.displaySmall;
// //     return Card(
// //         color: Colors.deepPurple.withOpacity(0.75),
// //         child: Center(
// //           child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.center,
// //               children: <Widget>[
// //                 Expanded(child: Icon(choice.icon, size: 49.0)),
// //                 Text(choice.title,
// //                     style: TextStyle(fontSize: 15, color: Colors.white)),
// //               ]),
// //         ));
// //   }
// // }
// class Home extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Grid with Circular Buttons'),
//         ),
//         body: GridScreen(),
//       ),
//     );
//   }
// }

// class GridScreen extends StatelessWidget {
//   final List<GridItem> items = [
//     GridItem(icon: Icons.home, text: 'Home'),
//     GridItem(icon: Icons.camera, text: 'Camera'),
//     GridItem(icon: Icons.mail, text: 'Mail'),
//     GridItem(icon: Icons.settings, text: 'Settings'),
//     GridItem(icon: Icons.person, text: 'Profile'),
//     GridItem(icon: Icons.help, text: 'Help'),
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
//           child: InkWell(
//             onTap: () {
//               print('Tapped ${items[index].text}');
//             },
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Icon(items[index].icon, size: 48.0),
//                 SizedBox(height: 8.0),
//                 Text(items[index].text),
//               ],
//             ),
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
