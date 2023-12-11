// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
// import 'package:project1/login_signup/signup_choose.dart';
import '../login_signup/signup_choose.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SignUpCustomerState();
}

class _SignUpCustomerState extends State<SettingScreen> {
  var formKey = GlobalKey<FormState>();

  bool isVisible = true;

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
              const Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 66,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 47,
                      backgroundImage: NetworkImage(
                          'https://buffer.com/cdn-cgi/image/w=1000,fit=contain,q=90,f=auto/library/content/images/size/w1200/2023/10/free-images.jpg'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.orange,
                      child: Icon(
                        Icons.camera_alt_outlined,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
              Container(
                width: 340,
                height: 460,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: Colors.grey),
                ),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 18,
                      ),
                      const Text(
                        "User Profile",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 26),
                      ),
                      const SizedBox(
                        height: 14,
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
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'required user name';
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
                        width: 300,
                        height: 60,
                        child: TextFormField(
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'required user number';
                            } else {
                              return null;
                            }
                          },
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
                        height: 18,
                      ),
                      Container(
                        width: 300,
                        height: 60,
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'required user address';
                            } else {
                              return null;
                            }
                          },
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
                        height: 15,
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
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignUpChoose(),
                                  ));
                            }
                          },
                          child: const Text("UPDATE",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22)),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
