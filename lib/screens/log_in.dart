import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginUser extends StatelessWidget {
  final myBController = TextEditingController();
  final myCController = TextEditingController();
  final _auth = FirebaseAuth.instance;

  late String loginEmail;
  late String loginPassword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Log In',
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.08,
              ),
              TextField(
                decoration: const InputDecoration(
                    hintText: 'Enter your email',
                    filled: true,
                    fillColor: Colors.white),
                controller: myBController,
                onChanged: (v2) {
                  loginEmail = v2;
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              TextField(
                obscureText: true,
                obscuringCharacter: '*',
                decoration: const InputDecoration(
                    hintText: 'Enter your password',
                    filled: true,
                    fillColor: Colors.white),
                controller: myCController,
                onChanged: (v3) {
                  loginPassword = v3;
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              FlatButton(
                onPressed: () async {
                  if (loginEmail.isNotEmpty && loginPassword.isNotEmpty) {
                    final loginuser = await _auth
                        .signInWithEmailAndPassword(
                            email: loginEmail, password: loginPassword)
                        .whenComplete(
                            () => Navigator.pushNamed(context, 'home'));
                  }
                  myBController.clear();
                  myCController.clear();
                },
                child: const Text('Log In'),
                color: Colors.blue,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.popAndPushNamed(context, 'signup');
                  },
                  child: Text("Didn\'t have account?")),
            ],
          ),
        ),
      ),
    );
  }
}
