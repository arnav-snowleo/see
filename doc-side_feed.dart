import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_authen/api/food_api.dart';
import 'package:doctor_authen/notifier/auth_notifier.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../showBookingRequests.dart';

class Feed extends StatefulWidget {
  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  SizedBox heightGap = SizedBox(
    height: 20,
  );

  TextEditingController specController = TextEditingController();
  TextEditingController expController = TextEditingController();
  TextEditingController docnameController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController clinicController = TextEditingController();
  TextEditingController homeController = TextEditingController();

  Map<String, dynamic> doctorPropToAdd;
  // creating a reference variable
  CollectionReference collectionReference =
      Firestore.instance.collection("doctors");
  // addProduct is the method responsible for adding products to FIRESTORE
  addDoctorProp() {
    doctorPropToAdd = {
      "docname": docnameController.text,
      "spec": specController.text,
      "exp": expController.text,
      "loc": locationController.text,
      "clinic": clinicController.text,
      "home": homeController.text,
      //"name": nameController.text,
      //"name": nameController.text,
      //"name": nameController.text,
    };
    // calling firestore add method
    collectionReference.add(doctorPropToAdd).whenComplete(
          () => Fluttertoast.showToast(msg: "Doctor Details Added to Database"),
        );
  }

  Widget _buildTextField(TextEditingController controller, String labelText) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white10,
        border: Border.all(color: Colors.green),
      ),
      child: TextField(
        controller: controller,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
            labelText: labelText,
            labelStyle: TextStyle(color: Colors.grey),
            border: InputBorder.none),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    AuthNotifier authNotifier = Provider.of<AuthNotifier>(context);

    print("building Feed");
    return Scaffold(
      appBar: AppBar(
        title: Text(
          authNotifier.user != null
              ? "Hello, " + authNotifier.user.displayName
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
        child: ListScreen(),
        /*child: Column(
          children: <Widget>[
            heightGap,
            _buildTextField(docnameController, 'Name'),
            heightGap,
            _buildTextField(locationController, 'Location'),
            heightGap,
            _buildTextField(specController, 'Speciality'),
            heightGap,
            _buildTextField(expController, 'Experience'),
            heightGap,
            _buildTextField(
                clinicController, 'Clinic Service- Enter YES or NO'),
            heightGap,
            _buildTextField(
                homeController, 'Home Visit Service- Enter YES or NO'),
            heightGap,
            RaisedButton(
              color: Colors.pinkAccent,
              onPressed: () {
                addDoctorProp();
              },
              child: Text('Add My Details'),
            ),
          ],
        ),*/
      ),
    );
  }
}
