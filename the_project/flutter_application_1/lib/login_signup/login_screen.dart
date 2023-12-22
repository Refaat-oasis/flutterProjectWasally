// ignore_for_file: use_build_context_synchronously, avoid_print, sized_box_for_whitespace, avoid_types_as_parameter_names, non_constant_identifier_names, unnecessary_string_interpolations, unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project1/models/user_model.dart';
// import 'package:project1/layout/layout.dart';
// import 'package:project1/login_signup/signup_choose.dart';
import '../components/constant.dart';
import '../layout/layout.dart';
import '../login_signup/signup_choose.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String usermailID = "unknown";
  bool? isDriver;

  Future<void> _searchUser(
      BuildContext context, String email, String password) async {
    try {
      QuerySnapshot driversearch = await FirebaseFirestore.instance
          .collection('drivers')
          .where('email', isEqualTo: email)
          .where('password', isEqualTo: password)
          .get();

      QuerySnapshot usersearch = await FirebaseFirestore.instance
          .collection('users')
          .where('email', isEqualTo: email)
          .where('password', isEqualTo: password)
          .get();

      if (driversearch.docs.isNotEmpty) {
        print('sadaoidsadsinaidijsadssioadjad ${driversearch.docs.first.id}');
        String id = driversearch.docs.first.id;
        userModel = user_model.fromMap(
            driversearch.docs.first.data() as Map<String, dynamic>, id);
        print(userModel.toJson());
        print('$id');

        print('driver has been found');
        usermailID = emailController.text;
        print('$usermailID');
        isDriver = true;
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LayoutScreen(isDriver!, usermailID),
          ),
        );
      } else if (usersearch.docs.isNotEmpty) {
        String id = usersearch.docs.first.id;
        userModel = user_model.fromMap(
            usersearch.docs.first.data() as Map<String, dynamic>, id);
        print(userModel.toJson());
        print('user has been found');
        usermailID = emailController.text;
        print('$usermailID');
        isDriver = false;
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LayoutScreen(isDriver!, usermailID),
          ),
        );
      } else {
        print('email or password is incorrect');
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Logging In'),
              content: const Text('email or password is incorrect'),
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
      }
    } catch (e) {
      print('Error happened: $e');
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text('An error occurred during the login process'),
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
    }
  }

  var formKey = GlobalKey<FormState>();
  bool isVisible = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: formKey,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 60,
                ),
                Image.asset(
                  "assets/images/dilevery_logo.png",
                  width: 250,
                  height: 250,
                ),
                Container(
                  width: 340,
                  height: 400,
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
                        "Welcome Back!",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 28),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      const Text(
                        "Login to your existing account",
                        style: TextStyle(color: Colors.grey, fontSize: 18),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 300,
                        height: 60,
                        child: TextFormField(
                          controller: emailController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'required user name';
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.orange),
                              borderRadius: BorderRadius.circular(28),
                            ),
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
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 300,
                        height: 58,
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'required user password';
                            } else {
                              return null;
                            }
                          },
                          obscureText: isVisible,
                          controller: passwordController,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.orange),
                              borderRadius: BorderRadius.circular(28),
                            ),
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
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 180.0, top: 13),
                        child: Text("forget password?"),
                      ),
                      const SizedBox(
                        height: 11,
                      ),
                      Container(
                        width: 260,
                        height: 40,
                        child: MaterialButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                          color: Colors.orange,
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              String email = emailController.text;
                              String password = passwordController.text;
                              _searchUser(context, email, password);
                              print("$email   $password");
                            }
                          },
                          child: const Text(
                            "LOGIN",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 70.0),
                        child: Row(
                          children: [
                            const Text(
                              'Don\'t have an account?',
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext) {
                                      return SignUpChoose();
                                    },
                                  ),
                                );
                              },
                              child: const Text(
                                'Sign up',
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
