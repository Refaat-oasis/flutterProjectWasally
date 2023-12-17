import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'chats_detiels_screen.dart';

// ignore: must_be_immutable
class ChatsScreen extends StatelessWidget {
  String? username;
  ChatsScreen(this.username, {super.key});

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
                builder: (context) => ChatsDetailsScreen(username),
              ));
        },
        child: const Padding(
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
                'Mohammed',
                style: TextStyle(
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      );
}
