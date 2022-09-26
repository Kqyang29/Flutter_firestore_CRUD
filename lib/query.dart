import 'package:firebase_crud/db.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Query extends StatefulWidget {
  const Query({super.key});

  @override
  State<Query> createState() => _QueryState();
}

class _QueryState extends State<Query> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Read Sigle User"),
        ),
        body: FutureBuilder<User?>(
          future: readUser(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("Something went wrong ${snapshot.error}");
            } else if (snapshot.hasData) {
              final users = snapshot.data;
              return users == null
                  ? Center(
                      child: Text("No user"),
                    )
                  : buildUser(users);
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}
