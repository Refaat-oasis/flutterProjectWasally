import 'package:flutter/material.dart';
// import 'package:project1/screens/chat_screen.dart';
// import 'package:project1/screens/delivery_home.dart';
// import 'package:project1/screens/new_order.dart';
// import 'package:project1/screens/setting.dart';
import '../screens/chat_screen.dart';
import '../screens/delivery_home.dart';
import '../screens/new_order.dart';
import '../screens/setting.dart';

class LayoutScreen extends StatefulWidget {
  static const String routeName = 'layout';
  final bool isDriver;
  final String? usermailID;

  // LayoutScreen(this.isDriver, this.username, {super.key});
  const LayoutScreen(this.isDriver, this.usermailID, {Key? key})
      : super(key: key);

  @override
  State<LayoutScreen> createState() => LayoutScreenState();
}

class LayoutScreenState extends State<LayoutScreen> {
  int currentIndex = 0;
  List<BottomNavigationBarItem>? bottomsNavBar;
  List<Widget>? screens;

  @override
  void initState() {
    super.initState();

    bottomsNavBar = [
      widget.isDriver
          ? const BottomNavigationBarItem(
              icon: Icon(Icons.square_outlined),
              label: "Orders",
            )
          : const BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: "New_Order",
            ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.chat),
        label: "Chat",
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.settings),
        label: "Setting",
      ),
    ];

    screens = [
      //   widget.isDriver ? DeliveryHome() : NewOrder(),
      //   const ChatsScreen(username),
      //   const SettingScreen(),
      // ];

      widget.isDriver ? DeliveryHome() : const NewOrderScreen(),
      ChatsScreen(widget.usermailID!), // Use widget.username here
      SettingScreen(widget.usermailID!),
    ];
  }

  void changeBottomScreen(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: bottomsNavBar!,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (value) {
          changeBottomScreen(value);
        },
      ),
      body: screens?[currentIndex],
    );
  }
}
