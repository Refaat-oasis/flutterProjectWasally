// ignore_for_file: sized_box_for_whitespace, must_be_immutable, unused_import, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../components/constant.dart';
import '../models/neworder.dart';

class TrackingScreen extends StatefulWidget {
  const TrackingScreen(
      {required this.neworder,
      required this.isDriver,
      required this.isaccepted,
      super.key});
  final Neworder neworder;
  final bool isaccepted;
  final bool isDriver;

  @override
  State<TrackingScreen> createState() => _TrackingScreenState();
}

class _TrackingScreenState extends State<TrackingScreen> {
  String driverName(isDriver) {
    if (isDriver) {
      return userModel.username;
    } else {
      return "";
    }
  }

  String driverPhone(isDriver) {
    if (isDriver) {
      return userModel.phonenumber;
    } else {
      return "";
    }
  }

  late String id;
  late String deliverymethod;

  Future<void> passorder() async {
    QuerySnapshot orderended = await FirebaseFirestore.instance
        .collection('neworder')
        .where('fromstreet', isEqualTo: widget.neworder.fromstreet)
        .where('tostreet', isEqualTo: widget.neworder.tostreet)
        .where('fromphone', isEqualTo: widget.neworder.fromphone)
        .get();

    print('sadaoidsadsinaidijsadssioadjad ${orderended.docs.first.id}');
    id = orderended.docs.first.id;
    deleteorder();
  }

  CollectionReference endedorder =
      FirebaseFirestore.instance.collection('neworder');
  Future<void> deleteorder() {
    return endedorder
        .doc(id)
        .delete()
        .then((value) => print("order Deleted"))
        .catchError((error) => print("Failed to delete user: $error"));
  }

  String usedmethod() {
    deliverymethod = widget.neworder.deliverymethod;
    return deliverymethod;
  }

  String getTextBasedOnMethod() {
    String methodResult = usedmethod();

    if (methodResult == "car") {
      return "40\$";
    } else if (methodResult == "courier") {
      return "25\$";
    } else if (methodResult == "truck") {
      return "50\$";
    } else {
      return "ask user";
    }
  }

  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  WriteBatch batch = FirebaseFirestore.instance.batch();
  bool _methodCalled = false;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!_methodCalled) {
      // Assuming neworder is an instance of the Neworder class
      searchorderaccepted(context, widget.neworder);
      _methodCalled = true;
    }
  }

  Future<void> searchorderaccepted(
      BuildContext context, Neworder neworder) async {
    try {
      QuerySnapshot searchorderaccepted = await FirebaseFirestore.instance
          .collection('neworder')
          .where('fromstreet', isEqualTo: neworder.fromstreet)
          .where('tostreet', isEqualTo: neworder.tostreet)
          .where('fromphone', isEqualTo: neworder.fromphone)
          .get();

      if (searchorderaccepted.docs.isNotEmpty) {
        String id = searchorderaccepted.docs.first.id;
        await batch.commit();
        await firestore.collection('neworder').doc(id).update(
          {
            'drivername': userModel.username,
          },
        );
      }
    } catch (e) {
      print('$e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: const Stream.empty(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            iconTheme: const IconThemeData(color: Colors.orange, size: 35),
          ),
          backgroundColor: Colors.white,
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(21.0),
              child: Container(
                width: 350,
                height: 300,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(color: Colors.grey),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          const SizedBox(
                            height: 110,
                          ),
                          const CircleAvatar(
                            radius: 7,
                            backgroundColor: Colors.orange,
                          ),
                          Container(
                            height: 20,
                            color: Colors.orange,
                            width: 4,
                          ),
                          const CircleAvatar(
                            radius: 7,
                            backgroundColor: Colors.orange,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Icon(Icons.phone, color: Colors.orange),
                        ],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 300,
                        height: 700,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 30,
                            ),
                            Row(children: [
                              Text(driverName(widget.isDriver),
                                  style: const TextStyle(fontSize: 20)),
                              const Spacer(),
                              Text(
                                isAccepted(widget.isaccepted),
                                style: const TextStyle(
                                  fontSize: 25,
                                  color: Colors.orange,
                                ),
                              ),
                              const Spacer(),
                              Text(driverPhone(widget.isDriver),
                                  style: const TextStyle(
                                    fontSize: 20,
                                  )),
                            ]),
                            const Divider(
                                color: Colors.orangeAccent,
                                thickness: 3,
                                endIndent: 25),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.directions_car_rounded,
                                        color: usedmethod() == "car"
                                            ? Colors.orange
                                            : Colors.grey),
                                    Text('car',
                                        style: TextStyle(
                                          fontSize: 25,
                                          color: usedmethod() == "car"
                                              ? Colors.orange
                                              : Colors.grey,
                                        )),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.directions_run,
                                        color: usedmethod() == "courier"
                                            ? Colors.orange
                                            : Colors.grey),
                                    Text('courier',
                                        style: TextStyle(
                                          fontSize: 25,
                                          color: usedmethod() == "courier"
                                              ? Colors.orange
                                              : Colors.grey,
                                        )),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.local_shipping,
                                        color: usedmethod() == "truck"
                                            ? Colors.orange
                                            : Colors.grey),
                                    Text('truck',
                                        style: TextStyle(
                                          fontSize: 25,
                                          color: usedmethod() == "truck"
                                              ? Colors.orange
                                              : Colors.grey,
                                        )),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            Text(widget.neworder.fromstreet,
                                style: const TextStyle(fontSize: 25)),
                            const SizedBox(
                              height: 3,
                            ),
                            Text(widget.neworder.tostreet,
                                style: const TextStyle(fontSize: 25)),
                            const SizedBox(
                              height: 3,
                            ),
                            Text(widget.neworder.fromphone,
                                style: const TextStyle(
                                  fontSize: 25,
                                )),
                            const Divider(
                                color: Colors.orangeAccent,
                                thickness: 3,
                                endIndent: 25),
                            Row(children: [
                              Text(getTextBasedOnMethod(),
                                  style: const TextStyle(fontSize: 25)),
                              const Spacer(),
                              MaterialButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18)),
                                color: Colors.orange,
                                onPressed: () {
                                  if (widget.isDriver) {
                                    Navigator.pop(context);
                                  } else {
                                    passorder();
                                    Navigator.pop(context);
                                  }
                                },
                                child: const Text(
                                  "cancel",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22),
                                ),
                              ),
                              const Spacer(),
                              Visibility(
                                visible: widget.isDriver,
                                child: MaterialButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18)),
                                  color: Colors.orange,
                                  onPressed: () {
                                    passorder();
                                    Navigator.pop(context);
                                  },
                                  child: const Text(
                                    "deliverd",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22),
                                  ),
                                ),
                              ),
                            ])
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

String isAccepted(isaccepted) {
  if (isaccepted) {
    return "acceted";
  } else {
    return "waiting";
  }
}
