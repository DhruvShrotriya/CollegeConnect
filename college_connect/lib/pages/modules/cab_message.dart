import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class cmessages extends StatefulWidget {
  String email;

  cmessages({required this.email});

  @override
  // ignore: library_private_types_in_public_api, no_logic_in_create_state
  _cmessagesState createState() => _cmessagesState(email: email);
}

class _cmessagesState extends State<cmessages> {
  String email;
  _cmessagesState({required this.email});

  Stream<QuerySnapshot> _messageStream = FirebaseFirestore.instance
      .collection('cabMessages')
      .orderBy('time')
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _messageStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("something is wrong");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        return ListView.builder(
          itemCount: snapshot.data!.docs.length,
          physics: ScrollPhysics(),
          shrinkWrap: true,
          primary: true,
          itemBuilder: (_, index) {
            QueryDocumentSnapshot qs = snapshot.data!.docs[index];
            Timestamp t = qs['time'];
            DateTime d = t.toDate();
            print(d.toString());
            return Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              child: Column(
                crossAxisAlignment: email == qs['email']
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 300,
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Colors.purple,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      // title: Text(
                      //   qs['message'],
                      //   style: TextStyle(
                      //     fontSize: 15,
                      //   ),
                      // ),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 200,
                            child: Text(
                              qs['email'].toString().substring(
                                  0, qs['email'].toString().indexOf("@")),
                              softWrap: true,
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ),
                          Text(
                            d.hour.toString() + ":" + d.minute.toString(),
                            style: TextStyle(
                              fontSize: 10,
                            ),
                          )
                        ],
                      ),
                      subtitle: Text(
                        qs['message'],
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
