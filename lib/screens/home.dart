import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        actions: [
          IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut().whenComplete(
                    () => Navigator.popAndPushNamed(context, 'login'));
              },
              icon: Icon(Icons.logout))
        ],
        title: Text('My Home Page'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text('LogIn Successfully')),
        ],
      ),
    );
  }
}
