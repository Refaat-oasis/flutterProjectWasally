// ignore_for_file: sized_box_for_whitespace, non_constant_identifier_names

// ignore: unused_import
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:project1/models/message.dart';

// ignore: must_be_immutable
class ChatsDetailsScreen extends StatelessWidget {
  String? username;
  ChatsDetailsScreen(this.username, {super.key});

  final scrolcontrol = ScrollController();
  var messageController = TextEditingController();
  TextEditingController edittedxt = TextEditingController();
  CollectionReference messages =
      FirebaseFirestore.instance.collection('messages');
  bool isloading = true;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy('createdAt', descending: true).snapshots(),

      builder: (context, Snapshot) {
        if (Snapshot.hasData) {
          isloading = false;
          List<Message> messageslist = [];
          for (int i = 0; i < Snapshot.data!.docs.length; i++) {
            messageslist.add(Message.fromJson(Snapshot.data!.docs[i]));
          }
          return Scaffold(
            appBar: AppBar(
              titleSpacing: 0,
              title: const Row(
                children: [
                  CircleAvatar(
                    radius: 22.0,
                    backgroundImage: AssetImage(
                      'assets/images/dilevery_logo.png', // Replace with the actual URL
                    ),
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    'Mohammed',
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ),
            body: ConditionalBuilder(
              condition: true,
              builder: (context) => Padding(
                padding: const EdgeInsets.all(17.0),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                        reverse: true,
                        controller: scrolcontrol,
                        itemCount: messageslist.length,
                        itemBuilder: (context, index) {
                          return messageslist[index].id == username
                              ? buildMyMessage(message: messageslist[index])
                              : buildFriendMessage(
                                  message: messageslist[index]);
                        },
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 10,
                        ),
                        // itemCount: 5,
                      ),
                    ),
                    Container(
                      height: 50,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(
                          15.0,
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15.0),
                              child: TextFormField(
                                controller: messageController,
                                decoration: const InputDecoration(
                                  hintText: 'write your message',
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 50,
                            child: MaterialButton(
                              color: Colors.blue,
                              onPressed: () {
                                // Handle send button click
                                messages.add({
                                  'message': messageController.text,
                                  'createdAt': DateTime.now(),
                                  'ID': username,
                                });
                                messageController.clear();
                                scrolcontrol.animateTo(0,
                                    duration: const Duration(seconds: 1),
                                    curve: Curves.easeIn);
                              },
                              minWidth: 1,
                              child: const Icon(
                                Icons.send,
                                size: 18,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              fallback: (context) => const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        } else {
          return ModalProgressHUD(
            inAsyncCall: isloading,
            child: Scaffold(
              appBar: AppBar(
                titleSpacing: 0,
                title: const Row(
                  children: [
                    CircleAvatar(
                      radius: 22.0,
                      backgroundImage: AssetImage(
                        'assets/images/dilevery_logo.png',
                      ),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      'Loading',
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ),
              body: ConditionalBuilder(
                condition: true,
                builder: (context) => Padding(
                  padding: const EdgeInsets.all(17.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.separated(
                          itemBuilder: (context, index) {
                            return null;
                          },
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 10,
                          ),
                          itemCount: 5,
                        ),
                      ),
                      Container(
                        height: 50,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(
                            15.0,
                          ),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0),
                                child: TextFormField(
                                  controller: messageController,
                                  decoration: const InputDecoration(
                                    hintText: 'write your message',
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 50,
                              child: MaterialButton(
                                color: Colors.blue,
                                onPressed: () {
                                  // Handle send button click
                                  messages.add({
                                    'message': messageController.text,
                                  });
                                  messageController.clear();
                                },
                                minWidth: 1,
                                child: const Icon(
                                  Icons.send,
                                  size: 18,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                fallback: (context) => const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
          );
        }
      },
    );
  }

  Widget buildMyMessage({required message}) => Align(
        alignment: AlignmentDirectional.centerEnd,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blue.withOpacity(
              .2,
            ),
            borderRadius: const BorderRadiusDirectional.only(
              bottomStart: Radius.circular(
                10.0,
              ),
              topStart: Radius.circular(
                10.0,
              ),
              topEnd: Radius.circular(
                10.0,
              ),
            ),
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 5.0,
            horizontal: 10.0,
          ),
          child: Text(
            message.message, // Fixed typo: 'model}' to 'model'
          ),
        ),
      );

  Widget buildFriendMessage({required message}) => Align(
        alignment: AlignmentDirectional.centerStart,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.orange.withOpacity(
              .2,
            ),
            borderRadius: const BorderRadiusDirectional.only(
              bottomEnd: Radius.circular(
                10.0,
              ),
              topStart: Radius.circular(
                10.0,
              ),
              topEnd: Radius.circular(
                10.0,
              ),
            ),
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 5.0,
            horizontal: 10.0,
          ),
          child: Text(
            message.message, 
          ),
        ),
      );
}
