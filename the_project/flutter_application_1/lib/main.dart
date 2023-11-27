import 'package:flutter/material.dart';
import 'package:flutter_application_1/firebase_options.dart';
import 'package:flutter_application_1/home.dart';
import 'package:flutter_application_1/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';

// void main() async {
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(MyApp());
//}
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ); // or any other service initialization
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // return MaterialApp(debugShowCheckedModeBanner: false, home: LoginScreen());
    return MaterialApp(
      initialRoute: 'welcom',
      debugShowCheckedModeBanner: false,
      routes: {
        'welcom': (context) => LoginScreen(),
        'home': (context) => home(),
      },
    );
  }
}
