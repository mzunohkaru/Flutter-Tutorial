import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../flavors.dart';

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
            final data = {
              'name': 'John Doe',
            };
            await FirebaseFirestore.instance.collection('data').doc().set(data);
          } catch (e) {
            print(e);
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
