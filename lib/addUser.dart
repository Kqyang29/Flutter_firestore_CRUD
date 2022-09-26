import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_crud/db.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import "package:firebase_core/firebase_core.dart";

class AddUserPage extends StatefulWidget {
  const AddUserPage({super.key});

  @override
  State<AddUserPage> createState() => _AddUserPageState();
}

class _AddUserPageState extends State<AddUserPage> {
  final NameController = TextEditingController();
  final AgeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ADD User"),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: <Widget>[
          TextField(
            controller: NameController,
            decoration: InputDecoration(
              label: Text('Name'),
            ),
          ),
          SizedBox(
            height: 24,
          ),
          TextField(
            controller: AgeController,
            decoration: InputDecoration(
              label: Text('Age'),
            ),
            keyboardType: TextInputType.number,
          ),
          SizedBox(
            height: 24,
          ),
          ElevatedButton(
            onPressed: () {
              final user = User(
                name: NameController.text,
                age: int.parse(AgeController.text),
              );
              createUser(user);
              Navigator.pop(context);
            },
            child: Text("Create"),
          ),
        ],
      ),
    );
  }
}
