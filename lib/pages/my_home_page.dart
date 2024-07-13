import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../flavors.dart';
import '../models/public_user.dart';

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
            final userData = await FirebaseFirestore.instance
                .collection('public_user')
                .doc("G4IMoK5ybIkH2q12fYSL")
                .get();

            final user = PublicUser.fromJson(userData.data()!);
            print(user.uid);
          } catch (e) {
            print(e);
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
