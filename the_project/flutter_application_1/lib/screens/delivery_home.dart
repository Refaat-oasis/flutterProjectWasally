// ignore_for_file: sized_box_for_whitespace
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DeliveryHome extends StatelessWidget {
  DeliveryHome({super.key});

  CollectionReference neworder =
      FirebaseFirestore.instance.collection('neworder');

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: neworder.get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }
        print(snapshot.data!.docs[0].data());
        return Scaffold(
          // appBar: AppBar(
          //     title: Padding(
          //       padding: const EdgeInsets.all(5.0),
          //     ),
          //     leading: Padding(
          //       padding: const EdgeInsets.all(6.0),
          //       child: Container(
          //         decoration: BoxDecoration(
          //           shape: BoxShape.circle,
          //           image: DecorationImage(
          //             image: AssetImage("assets/images/img.png"),
          //           ),
          //         ),
          //       ),
          //     ),
          //     backgroundColor: Colors.orange,
          //     elevation: 0,
          //     iconTheme: IconThemeData(color: Colors.white, size: 35),
          //     actions: [
          //       Icon(
          //         Icons.menu,
          //       ),
          //       SizedBox(
          //         width: 8,
          //       ),
          //       //onPressed: () {},
          //     ]),

          body: Center(
              child: Padding(
            padding: const EdgeInsets.all(21.0),
            child: Column(children: [
              Expanded(
                child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) => Container(
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
                                    const Icon(Icons.phone,
                                        color: Colors.orange),
                                  ],
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  width: 300,
                                  height: 185,
                                  child: const Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Row(
                                            children: [
                                              Icon(Icons.directions_car_rounded,
                                                  color: Colors.grey),
                                              Text('car',
                                                  style: TextStyle(
                                                    fontSize: 25,
                                                    color: Colors.grey,
                                                  )),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Icon(Icons.directions_run,
                                                  color: Colors.orange),
                                              Text('courier',
                                                  style: TextStyle(
                                                    fontSize: 25,
                                                    color: Colors.orange,
                                                  )),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Icon(Icons.local_shipping,
                                                  color: Colors.grey),
                                              Text('truck',
                                                  style: TextStyle(
                                                    fontSize: 25,
                                                    color: Colors.grey,
                                                  )),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      Text('Benziena Mobile ',
                                          style: TextStyle(fontSize: 25)),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      Text('Bus Station ',
                                          style: TextStyle(fontSize: 25)),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      Text('0123456789',
                                          style: TextStyle(
                                            fontSize: 25,
                                          )),
                                      Divider(
                                          color: Colors.orangeAccent,
                                          thickness: 3,
                                          endIndent: 25),
                                      Row(children: [
                                        Text('20\$',
                                            style: TextStyle(fontSize: 25)),
                                        Spacer(),
                                        Text("Accept",
                                            style: TextStyle(
                                                color: Colors.orange,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 25)),
                                      ])
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                    separatorBuilder: (context, index) => const SizedBox(
                          height: 15,
                        ),
                    itemCount: 10),
              )
            ]),
          )),
        );
      },
    );
  }
}
