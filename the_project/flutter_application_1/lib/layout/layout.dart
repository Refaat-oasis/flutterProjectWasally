import 'package:flutter/material.dart';
import '../screens/chat_screen.dart';
import '../screens/delivery_home.dart';
import '../screens/new_order.dart';
import '../screens/setting.dart';

class LayoutScreen extends StatefulWidget {
  static const String routeName = 'layout';
  final bool isDriver;

  const LayoutScreen(this.isDriver, {Key? key}) : super(key: key);

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
      widget.isDriver ? DeliveryHome() : const NewOrderScreen(),
      ChatsScreen(widget.isDriver),
      SettingScreen(widget.isDriver),
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
