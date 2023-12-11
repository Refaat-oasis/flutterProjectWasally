// ignore_for_file: sized_box_for_whitespace

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'package:project1/screens/tracking_screen.dart';
import '../screens/tracking_screen.dart';

class NewOrder extends StatelessWidget {
  NewOrder({super.key});

  final TextEditingController fromcity = TextEditingController();
  final TextEditingController fromstreet = TextEditingController();
  final TextEditingController fromhouse = TextEditingController();
  final TextEditingController fromflat = TextEditingController();
  final TextEditingController fromname = TextEditingController();
  final TextEditingController fromphone = TextEditingController();
  final TextEditingController fromaddress = TextEditingController();

  final TextEditingController tocity = TextEditingController();
  final TextEditingController tostreet = TextEditingController();
  final TextEditingController tohouse = TextEditingController();
  final TextEditingController toflat = TextEditingController();
  final TextEditingController toname = TextEditingController();
  final TextEditingController tophone = TextEditingController();
  final TextEditingController toaddress = TextEditingController();

  Future addneworder() async {
    try {
      await FirebaseFirestore.instance.collection('neworder').add({
        'fromcity': fromcity.text.trim(),
        'fromstreet': fromstreet.text.trim(),
        'fromhouse': fromhouse.text.trim(),
        'fromflat': fromflat.text.trim(),
        'fromname': fromname.text.trim(),
        'fromphone': fromphone.text.trim(),
        'toaddress': fromaddress.text.trim(),
        'tocity': tocity.text.trim(),
        'tostreet': tostreet.text.trim(),
        'tohouse': tohouse.text.trim(),
        'toflat': toflat.text.trim(),
        'toname': toname.text.trim(),
        'tophone': tophone.text.trim(),
        // ignore: equal_keys_in_map
        'toaddress': toaddress.text.trim(),
      });
      print('Order added successfully!');
    } catch (e) {
      print('Error adding order: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Creat a new order',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Delivery method :',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 100,
                        height: 70,
                        decoration: BoxDecoration(
                          color: Colors.grey[350],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Column(
                          children: [
                            Icon(Icons.directions_run),
                            Text(
                              'Courier',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Up to 10 kg',
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 100,
                        height: 70,
                        decoration: BoxDecoration(
                          color: Colors.grey[350],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Column(
                          children: [
                            Icon(Icons.directions_car_rounded),
                            Text(
                              'Car',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Up to 60 kg',
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 100,
                        height: 70,
                        decoration: BoxDecoration(
                          color: Colors.grey[350],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Column(
                          children: [
                            Icon(Icons.local_shipping),
                            Text(
                              'Truck',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '> 60 kg',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'From',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    'Address',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    height: 49,
                    child: TextFormField(
                      controller: fromcity,
                      decoration: InputDecoration(
                        labelText: 'City',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(23)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    height: 49,
                    child: TextFormField(
                      controller: fromstreet,
                      decoration: InputDecoration(
                        labelText: 'Street',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(23)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 49,
                        width: MediaQuery.of(context).size.width / 2.1,
                        child: TextFormField(
                          controller: fromhouse,
                          decoration: InputDecoration(
                            labelText: 'House',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(23)),
                          ),
                        ),
                      ),
                      Container(
                        height: 49,
                        width: MediaQuery.of(context).size.width / 2.1,
                        child: TextFormField(
                          controller: fromflat,
                          decoration: InputDecoration(
                            labelText: 'Flat',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(23)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    'Contact details',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    height: 49,
                    child: TextFormField(
                      controller: fromname,
                      decoration: InputDecoration(
                        labelText: 'Name',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(23)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    height: 49,
                    child: TextFormField(
                      controller: fromphone,
                      decoration: InputDecoration(
                        labelText: 'Phone',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(23)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    height: 49,
                    child: TextFormField(
                      controller: fromaddress,
                      decoration: InputDecoration(
                        labelText: 'Address information',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(23)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'To',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    'Address',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    height: 49,
                    child: TextFormField(
                      controller: tocity,
                      decoration: InputDecoration(
                        labelText: 'City',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(23)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    height: 49,
                    child: TextFormField(
                      controller: tostreet,
                      decoration: InputDecoration(
                        labelText: 'Street',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(23)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 49,
                        width: MediaQuery.of(context).size.width / 2.1,
                        child: TextFormField(
                          controller: tohouse,
                          decoration: InputDecoration(
                            labelText: 'House',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(23)),
                          ),
                        ),
                      ),
                      Container(
                        height: 49,
                        width: MediaQuery.of(context).size.width / 2.1,
                        child: TextFormField(
                          controller: toflat,
                          decoration: InputDecoration(
                            labelText: 'Flat',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(23)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    'Contact details',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    height: 49,
                    child: TextFormField(
                      controller: toname,
                      decoration: InputDecoration(
                        labelText: 'Name',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(23)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    height: 49,
                    child: TextFormField(
                      controller: tophone,
                      decoration: InputDecoration(
                        labelText: 'Phone',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(23)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    height: 49,
                    child: TextFormField(
                      controller: toaddress,
                      decoration: InputDecoration(
                        labelText: 'Address information',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(23)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 260,
                      height: 40,
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)),
                        color: Colors.orange,
                        onPressed: () {
                          addneworder();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const TrackingScreen(),
                              ));
                        },
                        child: const Text("Create Order",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 22)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
