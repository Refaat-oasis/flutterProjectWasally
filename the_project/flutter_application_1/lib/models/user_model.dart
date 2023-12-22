import 'package:cloud_firestore/cloud_firestore.dart';

class user_model {
  final String? id;
  final String username;
  final String email;
  final String phonenumber;
  final String password;

  const user_model(
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

  factory user_model.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return user_model(
        email: data['email'],
        username: data['username'],
        password: data['password'],
        phonenumber: data['phonenumber']);
  }

  factory user_model.fromMap(Map<String, dynamic> map, String id) {
    return user_model(
        id: id,
        email: map['email'],
        username: map['username'],
        password: map['password'],
        phonenumber: map['phonenumber']);
  }
}
