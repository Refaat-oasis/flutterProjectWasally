// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'login_signup/signup_choose.dart';

class SignUpCustomer extends StatelessWidget {
  const SignUpCustomer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.orange, size: 35)),
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                "assets/images/dilevery_logo.png",
                width: 300,
                height: 150,
              ),
              Container(
                width: 340,
                height: 500,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: Colors.grey),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 18,
                    ),
                    const Text(
                      "Create Your Account",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Container(
                      width: 300,
                      height: 60,
                      child: TextFormField(
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.orange),
                                borderRadius: BorderRadius.circular(28)),
                            labelText: " Username",
                            labelStyle: const TextStyle(color: Colors.black),
                            prefixIcon: const Icon(
                              Icons.account_circle_outlined,
                              color: Colors.grey,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(28))),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 300,
                      height: 60,
                      child: TextFormField(
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.orange),
                                borderRadius: BorderRadius.circular(28)),
                            labelText: " Phone Number",
                            labelStyle: const TextStyle(color: Colors.black),
                            prefixIcon: const Icon(
                              Icons.call,
                              color: Colors.grey,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(28))),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 300,
                      height: 60,
                      child: TextFormField(
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.orange),
                                borderRadius: BorderRadius.circular(28)),
                            labelText: "Email address",
                            labelStyle: const TextStyle(color: Colors.black),
                            prefixIcon: const Icon(
                              Icons.email,
                              color: Colors.grey,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(28))),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 300,
                      height: 58,
                      child: TextFormField(
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.orange),
                                borderRadius: BorderRadius.circular(28)),
                            labelText: "Password",
                            labelStyle: const TextStyle(color: Colors.black),
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: Colors.grey,
                            ),
                            suffixIcon: const Icon(
                              Icons.remove_red_eye_sharp,
                              color: Colors.grey,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(28),
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Container(
                      width: 260,
                      height: 40,
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)),
                        color: Colors.orange,
                        onPressed: () {},
                        child: const Text("Create Account",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 22)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 70.0),
                      child: Row(
                        children: [
                          const Text(
                            'Already have an account?',
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignUpChoose(),
                                  ));
                            },
                            child: const Text(
                              'Sign in',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.orange,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
