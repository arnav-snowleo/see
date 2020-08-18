import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:phone_otp_authen/api/food_api.dart';
import 'package:phone_otp_authen/bookingRequestCRUDForm.dart';
import 'package:phone_otp_authen/notifier/auth_notifier.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

/*
class Feed extends StatefulWidget {
  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {



  @override
  Widget build(BuildContext context) {
    AuthNotifier authNotifier = Provider.of<AuthNotifier>(context);

    print("building Feed");
    return Scaffold(
      appBar: AppBar(
        title: Text(
          authNotifier.user != null
              ? "hello, " + authNotifier.user.displayName
              : "Feed",
        ),
        actions: <Widget>[
          // action button
          FlatButton(
            onPressed: () => signout(authNotifier),
            child: Text(
              "Logout",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[

          ],
        ),
      ),
    );
  }
}


*/

class Feed extends StatefulWidget {
  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  SizedBox smallHeightGap = SizedBox(height: 10);
  SizedBox bigHeightGap = SizedBox(height: 20);

  TextEditingController docnameController = TextEditingController();
  TextEditingController specController = TextEditingController();
  TextEditingController expController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController clinicController = TextEditingController();
  TextEditingController homeController = TextEditingController();

  CollectionReference ref = Firestore.instance.collection('doctors');

  // text field
  Widget _buildTextField(TextEditingController controller, String labelText) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color: Colors.blueAccent, border: Border.all(color: Colors.blue)),
      child: TextField(
        controller: controller,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
            labelText: labelText,
            labelStyle: TextStyle(color: Colors.white),
            border: InputBorder.none),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    AuthNotifier authNotifier = Provider.of<AuthNotifier>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          authNotifier.user != null
              ? "hello, " + authNotifier.user.displayName
              : "Feed",
        ),
        actions: <Widget>[
          // action button
          FlatButton(
            onPressed: () => signout(authNotifier),
            child: Text(
              "Logout",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ],
        backgroundColor: Colors.deepPurple,
        elevation: 10,
      ),
      backgroundColor: Colors.deepPurpleAccent,
      body: StreamBuilder(
        stream: ref.snapshots(),
        builder: (_, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index) {
                var userId = snapshot.data.documents[index].documentID;
                var doc = snapshot.data.documents[index].data;
                return Card(
                  color: Colors.deepPurpleAccent,
                  elevation: 5,
                  child: ListTile(
                    leading: IconButton(
                      icon: Icon(Icons.person),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => Dialog(
                            child: BookingRequestScreen(),
                          ),
                        );
                        /*
                        BookingRequestScreen();

                        docnameController.text = doc['docname'];
                        showDialog(
                          context: context,
                          builder: (context) => Dialog(
                            child: Card(
                              color: Colors.white,
                              elevation: 0,
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: ListView(
                                  shrinkWrap: true,
                                  children: <Widget>[
                                    bigHeightGap,
                                    FlatButton(
                                      color: Colors.green,
                                      onPressed: () {
                                        BookingRequestScreen();
                                      },
                                      /*{
                                        snapshot.data.documents[index].reference
                                            .updateData({
                                          "docname": docnameController.text ,
                                        }).whenComplete(
                                              () {
                                            Fluttertoast.showToast(
                                                msg:
                                                    "Booking For home, now not done yet");
                                          },
                                        );
                                      },*/
                                      child: Text('Book For Home'),
                                    ),
                                    smallHeightGap,
                                    FlatButton(
                                      color: Colors.green,
                                      onPressed: () {
                                        BookingRequestScreen();
                                        /*
                                        snapshot.data.documents[index].reference
                                            .updateData({
                                          "docname": docnameController.text,
                                        }).whenComplete(
                                          () {
                                            Fluttertoast.showToast(
                                                msg:
                                                    "Booking for Clinic, now not done yet");
                                          },
                                        );*/
                                      },
                                      child: Text('Book For Clinic'),
                                    ),
                                    smallHeightGap,
                                    FlatButton(
                                      color: Colors.green,
                                      onPressed: () {
                                        snapshot.data.documents[index].reference
                                            .updateData({
                                          "docname": docnameController.text,
                                        }).whenComplete(
                                          () {
                                            Fluttertoast.showToast(
                                                msg:
                                                    "Pay and Consult Online, now not done yet");
                                          },
                                        );
                                      },
                                      child: Text('Online Consultation'),
                                    ),
                                    bigHeightGap,
                                    FlatButton(
                                      color: Colors.red,
                                      onPressed: () {
                                        Navigator.pop(context);
                                        /*
                                        snapshot.data.documents[index].reference
                                            .delete();

                                         */
                                      },
                                      child: Text('Back'),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );*/
                      },
                    ),
                    title: Text(
                      "Doctor Name: " + doc["docname"],
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    subtitle: Column(
                      children: <Widget>[
                        Text(
                          "Experience: " + doc["exp"],
                          style: TextStyle(
                            color: Colors.yellow,
                          ),
                        ),
                        Text(
                          "Speciality: " + doc["spec"],
                          style: TextStyle(
                            color: Colors.yellow,
                          ),
                        ),
                        Text(
                          "Location: " + doc["loc"],
                          style: TextStyle(
                            color: Colors.yellow,
                          ),
                        ),
                        Text(
                          "Clinic Service: " + doc["clinic"],
                          style: TextStyle(
                            color: Colors.yellow,
                          ),
                        ),
                        Text(
                          "Home Visit: " + doc["home"],
                          style: TextStyle(
                            color: Colors.yellow,
                          ),
                        ),
                        Text(
                          "User ID: " + userId.toString(),
                          style: TextStyle(
                            color: Colors.yellow,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else
            return Text(' ');
        }, // snapshot is the listener
      ),
    );
  }
}
