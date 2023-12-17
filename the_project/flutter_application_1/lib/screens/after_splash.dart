// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
// import 'package:project1/login_signup/login_screen.dart';
// import 'package:project1/login_signup/signup_choose.dart';
import '../login_signup/login_screen.dart';
import '../login_signup/signup_choose.dart';

class AfterSplash extends StatelessWidget {
  const AfterSplash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar:AppBar(titleTextStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 30,)),
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(children: [
            Image.asset(
              "assets/images/dilevery_logo.png",
              width: 200,
              height: 200,
            ),
            const Text(
              "Wasally",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                color: Colors.black,
                fontSize: 60,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: 350,
              height: 250,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: Colors.grey),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 35,
                  ),
                  Container(
                    width: 250,
                    height: 70,
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      color: Colors.orange,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUpChoose(),
                            ));
                      },
                      child: const Text("Sign Up",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 35)),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: 250,
                    height: 70,
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      color: Colors.grey,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ));
                      },
                      child: const Text("Login",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 35)),
                    ),
                  ),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
