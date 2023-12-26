// ignore_for_file: must_be_immutable, unused_import, use_key_in_widget_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:project1/models/chatuser.dart';
import '../components/constant.dart';
import 'chats_detiels_screen.dart';

class ChatsScreen extends StatelessWidget {
  ChatsScreen(this.isDriver, {Key? key});
  late bool isDriver;
  late CollectionReference theotherone;

  @override
  Widget build(BuildContext context) {
    if (isDriver) {
      theotherone = FirebaseFirestore.instance.collection('users');
    } else {
      theotherone = FirebaseFirestore.instance.collection('drivers');
    }
    return ConditionalBuilder(
      condition: true,
      builder: (context) => FutureBuilder<QuerySnapshot>(
        future: theotherone.get(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<chatuser> listuserchatnames = [];
            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              listuserchatnames.add(chatuser.fromJson(snapshot.data!.docs[i]));
            }

            return ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) =>
                  buildChatItem(context, listuserchatnames[index]),
              separatorBuilder: (context, index) => const Divider(),
              itemCount: listuserchatnames.length,
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      fallback: (context) => const Center(child: CircularProgressIndicator()),
    );
  }

  Widget buildChatItem(BuildContext context, chatuser user) => InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatsDetailsScreen(),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              const CircleAvatar(
                radius: 25.0,
                backgroundImage: AssetImage('assets/images/dilevery_logo.png'),
              ),
              const SizedBox(
                width: 15.0,
              ),
              Text(
                user.userchatname,
                style: const TextStyle(
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      );
}
