import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class User {
  String? id;
  final String name;
  final int? age;

  User({
    this.id = '',
    required this.name,
    required this.age,
  });

  Map<String, dynamic> toJson() => {'id': id, 'name': name, "age": age};

  static User fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        name: json['name'],
        age: json['age'],
      );
}

Stream<List<User>> readUsers() => FirebaseFirestore.instance
    .collection("users")
    // document id
    .snapshots()
    // doc.data = field data in db
    .map((snapshot) =>
        snapshot.docs.map((doc) => User.fromJson(doc.data())).toList());

Future<User?> readUser() async {
  final docUser = FirebaseFirestore.instance.collection("users").doc("my-id");
  final snapshot = await docUser.get();

  if (snapshot.exists) {
    return User.fromJson(snapshot.data()!);
  }
}

Future createUser(User user) async {
  // reference to document
  // collection() = location collection name
  // doc() = generate id
  final docUser = FirebaseFirestore.instance.collection("users").doc();

  user.id = docUser.id;
  final json = user.toJson();
  //create document and write data to Firebase
  await docUser.set(json);
}

Widget buildUser(User user) {
  return ListTile(
    leading: CircleAvatar(child: Text("${user.age}")),
    title: Text("${user.name}"),
  );
}
