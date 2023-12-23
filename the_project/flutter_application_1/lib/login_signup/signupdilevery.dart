// ignore_for_file: sized_box_for_whitespace, must_be_immutable, use_build_context_synchronously, avoid_print, annotate_overrides

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../login_signup/login_screen.dart';
import '../login_signup/signup_choose.dart';

class SignUpDilevery extends StatefulWidget {
  const SignUpDilevery({super.key});

  @override
  State<SignUpDilevery> createState() => _SignUpDileveryState();
}

class _SignUpDileveryState extends State<SignUpDilevery> {
  bool isVisible = true;
  var formKey = GlobalKey<FormState>();
  final TextEditingController phonenumbercontroller = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final TextEditingController vechiletypecontroller = TextEditingController();

  // Future signUp() async {

  Future<bool> isUsernameTaken(String email) async {
    final QuerySnapshot query = await FirebaseFirestore.instance
        .collection('drivers')
        .where('email', isEqualTo: email)
        .get();

    if (query.docs.isNotEmpty) {
      print("email is already taken");
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('signing up'),
            content: const Text('email is already taken'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
      return true;
    } else {
      print("user is not taken");

      return false;
    }
  }

  Future adduserdetail() async {
    final String email = emailcontroller.text.trim();
    final bool isTaken = await isUsernameTaken(email);

    if (isTaken) {
      print('email is already taken. Please choose another one.');
    } else {
      await FirebaseFirestore.instance.collection('users').add({
        'username': usernameController.text.trim(),
        'password': passwordcontroller.text.trim(),
        'email': email,
        'phonenumber': phonenumbercontroller.text.trim(),
        'vechiletype': vechiletypecontroller.text.trim(),
      });
    }
  }

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.orange, size: 35)),
      backgroundColor: Colors.white,
      body: Form(
        key: formKey,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  "assets/images/dilevery_logo.png",
                  width: 150,
                  height: 100,
                ),
                Container(
                  width: 340,
                  height: 570,
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
                        " Dilevery Create Account",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 26),
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
                          controller: usernameController,
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
                              borderRadius: BorderRadius.circular(28),
                            ),
                          ),
                          validator: (value) {
                            final RegExp usernameRegex =
                                RegExp(r'^[a-zA-Z0-9_]{4,30}$');
                            if (!usernameRegex.hasMatch(value!)) {
                              return 'Invalid username';
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 300,
                        height: 60,
                        child: TextFormField(
                          controller: phonenumbercontroller,
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
                              borderRadius: BorderRadius.circular(28),
                            ),
                          ),
                          validator: (value) {
                            final RegExp phoneRegex = RegExp(r'^[0-9]{7,}$');
                            if (!phoneRegex.hasMatch(value!)) {
                              return 'Invalid phone number';
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 300,
                        height: 60,
                        child: TextFormField(
                          controller: emailcontroller,
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
                              borderRadius: BorderRadius.circular(28),
                            ),
                          ),
                          validator: (value) {
                            final RegExp emailRegex =
                                RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                            if (!emailRegex.hasMatch(value!)) {
                              return 'Invalid email address';
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 300,
                        height: 60,
                        child: TextFormField(
                          controller: vechiletypecontroller,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.orange),
                                borderRadius: BorderRadius.circular(28)),
                            labelText: " Vehicle Type ",
                            hintText: "car , courier , truck",
                            labelStyle: const TextStyle(color: Colors.black),
                            prefixIcon: const Icon(
                              Icons.directions_car_rounded,
                              color: Colors.grey,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(28),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Required vehicle type';
                            } else {
                              // List of allowed vehicle types
                              final allowedTypes = ['car', 'courier', 'truck'];

                              // Check if the entered value is in the allowed types list
                              if (!allowedTypes.contains(value.toLowerCase())) {
                                return 'Invalid vehicle type';
                              } else {
                                return null;
                              }
                            }
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 300,
                        height: 58,
                        child: TextFormField(
                          controller: passwordcontroller,
                          obscureText: isVisible,
                          keyboardType: TextInputType.visiblePassword,
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
                            suffixIcon: InkWell(
                              onTap: () {
                                setState(() {
                                  isVisible = !isVisible;
                                });
                              },
                              child: isVisible
                                  ? const Icon(
                                      Icons.remove_red_eye_sharp,
                                      color: Colors.grey,
                                    )
                                  : const Icon(
                                      Icons.visibility_off,
                                      color: Colors.grey,
                                    ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(28),
                            ),
                          ),
                          validator: (value) {
                            final RegExp passwordRegex = RegExp(
                                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                            if (!passwordRegex.hasMatch(value!)) {
                              return 'Weak Password';
                            } else {
                              return null;
                            }
                          },
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
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              await adduserdetail();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const LoginScreen(),
                                  ));
                            }
                          },
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
      ),
    );
  }
}
