import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../flavors.dart';
import '../models/public_user/public_user.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(F.title),
      ),
      body: Center(
        child: Text(
          'Hello ${F.title}',
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {
            const data = PublicUser(
                followingCount: 12, followerCount: 11, uid: "second user id");
            await FirebaseFirestore.instance
                .collection('public_user')
                .doc("second")
                .set(data.toJson());
          } catch (e) {
            debugPrint(e.toString());
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
