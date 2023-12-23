// ignore_for_file: must_be_immutable, unused_import

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:project1/models/chatuser.dart';
import '../components/constant.dart';
import 'chats_detiels_screen.dart';

class ChatsScreen extends StatelessWidget {
  ChatsScreen({super.key});

  CollectionReference drivers =
      FirebaseFirestore.instance.collection('drivers');
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
      condition: true,
      builder: (context) => ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => buildChatItem(context),
        separatorBuilder: (context, index) => const Divider(),
        itemCount: 5,
      ),
      fallback: (context) => const Center(child: CircularProgressIndicator()),
    );
  }

  Widget buildChatItem(context) => InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChatsDetailsScreen(),
              ));
        },
        child: FutureBuilder<QuerySnapshot>(
          future: users.get(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<userchat> listuserchatnames = [];
              for (int i = 0; i < snapshot.data!.docs.length; i++) {
                listuserchatnames
                    .add(userchat.fromJson(snapshot.data!.docs[i]));
              }
              return const Padding(
                padding: EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 25.0,
                      backgroundImage: AssetImage(
                        'assets/images/dilevery_logo.png',
                      ),
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Text(
                      'mohamed',
                      style: TextStyle(
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return const Padding(
                padding: EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 25.0,
                      backgroundImage: AssetImage(
                        'assets/images/dilevery_logo.png',
                      ),
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Text(
                      'unknown',
                      style: TextStyle(
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      );
}
