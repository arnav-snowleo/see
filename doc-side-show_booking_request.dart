import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  Color primaryColor = Colors.blue[900];
  Color secondaryColor = Colors.blue[700];

  _buildTextField(TextEditingController controller, String labelText) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color: secondaryColor, border: Border.all(color: Colors.blue)),
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

  SizedBox smallHeightGap = SizedBox(height: 10);
  SizedBox bigHeightGap = SizedBox(height: 20);
  SizedBox widthGap = SizedBox(width: 20);
  SizedBox smallWidthGap = SizedBox(width: 10);

  TextEditingController nameController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController conditionController = TextEditingController();
  TextEditingController remarksController = TextEditingController();

  CollectionReference ref = Firestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      backgroundColor: primaryColor,
      body: StreamBuilder(
        stream: ref.snapshots(),
        builder: (_, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index) {
                //var userId = snapshot.data.documents[index].documentID;  =>see what should be done
                var doc = snapshot.data.documents[index].data;
                return Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width * 0.95,
                      decoration: BoxDecoration(
                          color: Colors.pinkAccent,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25),
                              topRight: Radius.circular(25))),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10, left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    'Appointment Request',
                                    style: TextStyle(
                                        fontSize: 25, color: Colors.white),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    // flutter defined function
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        // return object of type Dialog
                                        return Center(
                                          child: Card(
                                            color: Colors.pinkAccent,
                                            child: AlertDialog(
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                  new Radius.circular(20.0),
                                                ),
                                              ),
                                              title: Center(
                                                child: new Text("Request by " +
                                                    doc['name']),
                                              ),
                                              /*content: Center(
                                                  child: new Text(
                                                      "Booking Request Details")),*/
                                              actions: <Widget>[
                                                Card(
                                                  elevation: 0,
                                                  child: Column(
                                                    children: <Widget>[
                                                      Row(
                                                        children: <Widget>[
                                                          Column(
                                                            children: <Widget>[
                                                              Text(
                                                                "NAME : ",
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 18,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Column(
                                                            children: <Widget>[
                                                              Text(
                                                                doc['name'],
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 18,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: <Widget>[
                                                          Column(
                                                            children: <Widget>[
                                                              Text(
                                                                "DATE : ",
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 18,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Column(
                                                            children: <Widget>[
                                                              Text(
                                                                doc['date'],
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 18,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: <Widget>[
                                                          Column(
                                                            children: <Widget>[
                                                              Text(
                                                                "TIME : ",
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 18,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Column(
                                                            children: <Widget>[
                                                              Text(
                                                                doc['time'],
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 18,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: <Widget>[
                                                          Column(
                                                            children: <Widget>[
                                                              Text(
                                                                "PHONE : ",
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 18,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Column(
                                                            children: <Widget>[
                                                              Text(
                                                                doc['phone'],
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 18,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: <Widget>[
                                                          Column(
                                                            children: <Widget>[
                                                              Text(
                                                                "EMAIL : ",
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 18,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Column(
                                                            children: <Widget>[
                                                              Text(
                                                                doc['email'],
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 18,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: <Widget>[
                                                          Column(
                                                            children: <Widget>[
                                                              Text(
                                                                "AGE : ",
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 18,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Column(
                                                            children: <Widget>[
                                                              Text(
                                                                doc['age'],
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 18,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: <Widget>[
                                                          Column(
                                                            children: <Widget>[
                                                              Text(
                                                                "GENDER : ",
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 18,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Column(
                                                            children: <Widget>[
                                                              Text(
                                                                doc['gender'],
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 18,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: <Widget>[
                                                          Column(
                                                            children: <Widget>[
                                                              Text(
                                                                "CONDITION : ",
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 18,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Column(
                                                            children: <Widget>[
                                                              Text(
                                                                doc['condition'],
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 18,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                      bigHeightGap,
                                                      bigHeightGap,
                                                      Row(
                                                        children: <Widget>[],
                                                      ),
                                                      Row(
                                                        children: <Widget>[
                                                          Text(
                                                            'REMARKS: ',
                                                            style: TextStyle(
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Text(
                                                        doc['remarks'],
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                bigHeightGap,
                                                Center(
                                                  child: FlatButton(
                                                    child: new Text("Close"),
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                  ),
                                                ),
                                                // usually buttons at the bottom of the dialog
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  icon: Icon(
                                    Icons.more_vert,
                                    color: Colors.white,
                                    size: 25,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Icon(
                                  Icons.access_time,
                                  size: 20,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  doc['date'] + " , " + doc['time'],
                                  /*widget.appointmentDate +
                                ', ' +
                                widget.appointmentTime,*/
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.white70),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 180,
                      width: MediaQuery.of(context).size.width * 0.95,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(25),
                              bottomRight: Radius.circular(25))),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: 500,
                              height: 100,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Column(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: CircleAvatar(
                                          radius: 40,
                                          backgroundColor: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Text("Name:  " + doc['name']),
                                        ],
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Text("Email:  " + doc['email']),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ), // accept decline
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Container(
                                width: 500,
                                //color: Colors.indigo,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    SizedBox(
                                      height: 50,
                                      child: RaisedButton(
                                        disabledElevation: 0,
                                        focusElevation: 0,
                                        highlightElevation: 0,
                                        hoverElevation: 0,
                                        elevation: 0.5,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        ),
                                        textColor: Colors.white,
                                        color: Colors.pinkAccent,
                                        child: Text(
                                          'accept',
                                          style: TextStyle(
                                            fontSize: 15,
                                          ),
                                        ),
                                        onPressed: () {} /*widget.onAccep,*/,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    SizedBox(
                                      height: 50,
                                      child: RaisedButton(
                                        disabledElevation: 0,
                                        focusElevation: 0,
                                        highlightElevation: 0,
                                        hoverElevation: 0,
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50)),
                                        textColor: Colors.black26,
                                        color: Color(0xffEBEFFB),
                                        child: Text(
                                          'Decline',
                                          style: TextStyle(
                                            color: Color(0xff878FA6),
                                            fontSize: 15,
                                          ),
                                        ),
                                        onPressed: /*widget.onDecline,*/ () {},
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    ListTile(
                      leading: IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          nameController.text = doc['name'];
                          dateController.text = doc['date'];
                          timeController.text = doc['time'];
                          phoneController.text = doc['phone'];
                          emailController.text = doc['email'];
                          ageController.text = doc['age'];
                          genderController.text = doc['gender'];
                          conditionController.text = doc['condition'];
                          remarksController.text = doc['remarks'];
                          showDialog(
                            context: context,
                            builder: (context) => Dialog(
                              child: Container(
                                color: primaryColor,
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: ListView(
                                    shrinkWrap: true,
                                    children: <Widget>[
                                      bigHeightGap,
                                      _buildTextField(nameController, 'Name'),
                                      bigHeightGap,
                                      _buildTextField(dateController, 'Date'),
                                      bigHeightGap,
                                      _buildTextField(timeController, 'Time'),
                                      bigHeightGap,
                                      _buildTextField(phoneController, 'Phone'),
                                      bigHeightGap,
                                      _buildTextField(emailController, 'Email'),
                                      bigHeightGap,
                                      _buildTextField(ageController, 'Age'),
                                      bigHeightGap,
                                      _buildTextField(
                                          genderController, 'Gender'),
                                      bigHeightGap,
                                      _buildTextField(
                                          conditionController, 'Condition'),
                                      bigHeightGap,
                                      _buildTextField(
                                          remarksController, 'Remarks'),
                                      bigHeightGap,
                                      FlatButton(
                                        color: Colors.green,
                                        onPressed: () {
                                          snapshot
                                              .data.documents[index].reference
                                              .updateData({
                                            "name": nameController.text,
                                            "date": dateController.text,
                                            "time": timeController.text,
                                            "phone": phoneController.text,
                                            "email": emailController.text,
                                            "age": ageController.text,
                                            "gender": genderController.text,
                                            "condition":
                                                conditionController.text,
                                            "remarks": remarksController.text,
                                          }).whenComplete(
                                                  () => Navigator.pop(context));
                                        },
                                        child: Text('UPDATE'),
                                      ),
                                      bigHeightGap,
                                      FlatButton(
                                        color: Colors.red,
                                        onPressed: () {
                                          snapshot
                                              .data.documents[index].reference
                                              .delete();
                                          Navigator.of(context).pop();
                                        },
                                        child: Text('DELETE'),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      title: Text(
                        doc['name'],
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      subtitle: Column(
                        children: <Widget>[],
                      ),
                    ),
                  ],
                );
              },
            );
          } else
            return Text('');
        }, // snapshot is the listener
      ),
    );
  }
}
