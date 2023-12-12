// ignore_for_file: sized_box_for_whitespace
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project1/models/neworder.dart';
// import 'package:project1/screens/tracking_screen.dart';
import '../screens/tracking_screen.dart';

// ignore: must_be_immutable
class DeliveryHome extends StatelessWidget {
  DeliveryHome({super.key});

  CollectionReference orderadded =
      FirebaseFirestore.instance.collection('neworder');
//{fromcity: assa, toaddress: ss, toname: ss,
// toflat: ass, tophone: 0105, fromname: roma,
// tohouse: ass, tostreet: ass, fromstreet: ss,
// tocity: ass, fromflat: 12, fromhouse: 12, fromphone: 0106}

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: orderadded.get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading");
        }
        // print(snapshot.data!.docs[0].data());
        // var firstDocumentData = snapshot.data!.docs[0].data();

        // String startpoint = firstDocumentData!['fromstreet'];

        // newOrder n1 = newOrder();

        Map<String, dynamic>? firstDocumentData =
            snapshot.data!.docs[0].data() as Map<String, dynamic>?;

        if (firstDocumentData != null) {
          // Access data from the first document

          print(firstDocumentData);

          // Access a specific field (e.g., 'fromstreet')

          String startpoint = firstDocumentData['fromstreet'];
          String endpoint = firstDocumentData['tostreet'];
          String senderphone = firstDocumentData['fromphone'];
          // newOrder n1 = newOrder(startpoint :startpoint,endpoint,senderphone);

          // You can also iterate through all documents if needed

          for (var document in snapshot.data!.docs) {
            var documentData = document.data() as Map<String, dynamic>;

            // Process each document data here
          }
        } else {
          print("No data available");
        }

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
                                  height: 200,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Row(
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
                                      const SizedBox(
                                        height: 3,
                                      ),
                                      const Text('Benziena Mobile ',
                                          style: TextStyle(fontSize: 25)),
                                      const SizedBox(
                                        height: 3,
                                      ),
                                      const Text('Bus Station ',
                                          style: TextStyle(fontSize: 25)),
                                      const SizedBox(
                                        height: 3,
                                      ),
                                      const Text('0123456789',
                                          style: TextStyle(
                                            fontSize: 25,
                                          )),
                                      const Divider(
                                          color: Colors.orangeAccent,
                                          thickness: 3,
                                          endIndent: 25),
                                      Row(children: [
                                        const Text('20\$',
                                            style: TextStyle(fontSize: 25)),
                                        const Spacer(),
                                        Container(
                                          width: 110,
                                          height: 40,
                                          child: MaterialButton(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(18)),
                                            color: Colors.orange,
                                            onPressed: () {
                                              {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          const TrackingScreen(),
                                                    ));
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
