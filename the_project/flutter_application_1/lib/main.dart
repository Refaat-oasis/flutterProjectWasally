// void main() async {
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(MyApp());
//}
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   ); // or any other service initialization
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // return MaterialApp(debugShowCheckedModeBanner: false, home: LoginScreen());
//     return MaterialApp(
//       initialRoute: 'welcom',
//       debugShowCheckedModeBanner: false,
//       routes: {
//         'welcom': (context) => LoginScreen(),
//         'home': (context) => const home(),
//       },
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:project1/components/theme.dart';
import 'package:project1/firebase_options.dart';
import 'package:project1/splash/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        color: Colors.white,
        debugShowCheckedModeBanner: false,
        theme: lightMode,
        darkTheme: darkMode,
        themeMode: ThemeMode.light,
        home: const SplashScreen());
  }
}
