// ignore_for_file: sized_box_for_whitespace, unused_import, unused_local_variable, must_be_immutable, duplicate_ignore, camel_case_types
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
// import 'package:project1/models/neworder.dart';
// import 'package:project1/screens/tracking_screen.dart';
import '../screens/tracking_screen.dart';
import '../models/neworder.dart';

class DeliveryHome extends StatelessWidget {
  DeliveryHome({super.key});
  CollectionReference neworder =
      FirebaseFirestore.instance.collection('neworder');
  bool isloading = true;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: neworder.get(),
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
                      itemBuilder: (context, index) =>
                          deliveryorders(neworder: neworderlist[index]),
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
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.directions_car_rounded,
                              color: Colors.grey),
                          Text(
                            'car',
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.directions_run, color: Colors.orange),
                          Text(
                            'courier',
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.orange,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.local_shipping, color: Colors.grey),
                          Text(
                            'truck',
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.grey,
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
                    const Text('20\$', style: TextStyle(fontSize: 25)),
                    const Spacer(),
                    Container(
                      width: 110,
                      height: 40,
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)),
                        color: Colors.orange,
                        onPressed: () {
                          {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TrackingScreen(
                                  neworder: neworder,
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
