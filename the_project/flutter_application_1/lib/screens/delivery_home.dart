// ignore_for_file: sized_box_for_whitespace, unused_import, unused_local_variable, must_be_immutable, duplicate_ignore, camel_case_types
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../screens/tracking_screen.dart';
import '../models/neworder.dart';

class DeliveryHome extends StatelessWidget {
  DeliveryHome({super.key});

  CollectionReference neworder =
      FirebaseFirestore.instance.collection('neworder');
  bool isloading = true;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: neworder.orderBy('createdAt', descending: true).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return ModalProgressHUD(
            inAsyncCall: isloading,
            child: const Scaffold(),
          );
        } else {
          List<Neworder> neworderlist = [];
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            neworderlist.add(Neworder.fromJson(snapshot.data!.docs[i]));
          }
          isloading = false;
          return ModalProgressHUD(
            inAsyncCall: isloading,
            child: Scaffold(
              body: Center(
                  child: Padding(
                padding: const EdgeInsets.all(21.0),
                child: Column(children: [
                  Expanded(
                    child: ListView.separated(
                      itemCount: neworderlist.length,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) => deliveryorders(
                        neworder: neworderlist[index],
                      ),
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 15,
                      ),
                    ),
                  )
                ]),
              )),
            ),
          );
        }
      },
    );
  }
}

class deliveryorders extends StatelessWidget {
  deliveryorders({required this.neworder, super.key});

  Neworder neworder;
  late String deliverymethod;
  String usedmethod() {
    deliverymethod = neworder.deliverymethod;
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

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 340,
      height: 230,
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
                  height: 55,
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
              height: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.directions_car_rounded,
                              color: usedmethod() == "car"
                                  ? Colors.orange
                                  : Colors.grey),
                          Text(
                            'car',
                            style: TextStyle(
                              fontSize: 25,
                              color: usedmethod() == "car"
                                  ? Colors.orange
                                  : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.directions_run,
                              color: usedmethod() == "courier"
                                  ? Colors.orange
                                  : Colors.grey),
                          Text(
                            'courier',
                            style: TextStyle(
                              fontSize: 25,
                              color: usedmethod() == "courier"
                                  ? Colors.orange
                                  : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.local_shipping,
                              color: usedmethod() == "truck"
                                  ? Colors.orange
                                  : Colors.grey),
                          Text(
                            'truck',
                            style: TextStyle(
                              fontSize: 25,
                              color: usedmethod() == "truck"
                                  ? Colors.orange
                                  : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    neworder.fromstreet,
                    style: const TextStyle(fontSize: 25),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    neworder.tostreet,
                    style: const TextStyle(fontSize: 25),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(neworder.fromphone,
                      style: const TextStyle(
                        fontSize: 25,
                      )),
                  const Divider(
                      color: Colors.orangeAccent, thickness: 3, endIndent: 25),
                  Row(children: [
                    Text(getTextBasedOnMethod(),
                        style: const TextStyle(fontSize: 25)),
                    const Spacer(),
                    Container(
                      width: 110,
                      height: 40,
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)),
                        color: Colors.orange,
                        onPressed: () {
                          const bool isaccepted = true;
                          {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TrackingScreen(
                                  isDriver: true,
                                  neworder: neworder,
                                  isaccepted: isaccepted,
                                ),
                              ),
                            );
                          }
                        },
                        child: const Text("Accept",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 22)),
                      ),
                    ),
                  ])
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
