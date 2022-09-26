import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class UND extends StatefulWidget {
  const UND({super.key});

  @override
  State<UND> createState() => _UNDState();
}

class _UNDState extends State<UND> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update and Delete"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                final docUser =
                    FirebaseFirestore.instance.collection("users").doc("my-id");

                // update specific field
                docUser.update({
                  'name': "Emma",
                });
              },
              child: Text("Update"),
            ),
            ElevatedButton(
              onPressed: () {
                final docUser = FirebaseFirestore.instance
                    .collection("users")
                    .doc("4FvQwDE6Eg2XFpZGw3AK");

                // update specific field
                docUser.delete();
              },
              child: Text("Delete"),
            ),
          ],
        ),
      ),
    );
  }
}
