import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String? id;
  final String username;
  final String email;
  final String phonenumber;
  final String password;

  const User(
      {this.id,
      required this.email,
      required this.username,
      required this.password,
      required this.phonenumber});
  toJson() {
    return {
      'username': username,
      'email': email,
      'pnonenumber': phonenumber,
      'password': password,
    };
  }

  factory User.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return User(
        email: data['email'],
        username: data['username'],
        password: data['password'],
        phonenumber: data['phonenumber']);
  }

  factory User.fromMap(Map<String, dynamic> map, String id) {
    return User(
        id: id,
        email: map['email'],
        username: map['username'],
        password: map['password'],
        phonenumber: map['phonenumber']);
  }
}
