import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_crud/addUser.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import "package:firebase_core/firebase_core.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final appBarcontroller = TextEditingController();
  final NameController = TextEditingController();
  final AgeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: appBarcontroller,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddUserPage()),
              );
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
