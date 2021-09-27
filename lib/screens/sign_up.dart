import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

late String createNewUserName;
late String createNewEmail;
late String createNewPassword;

class NewUser extends StatelessWidget {
  final myAController = TextEditingController();
  final myBController = TextEditingController();
  final myCController = TextEditingController();

  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.08,
                ),
                TextField(
                  decoration: const InputDecoration(
                      hintText: 'Enter your name',
                      filled: true,
                      fillColor: Colors.white),
                  controller: myAController,
                  onChanged: (v1) {
                    createNewUserName = v1;
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                TextField(
                  decoration: const InputDecoration(
                      hintText: 'Enter your email',
                      filled: true,
                      fillColor: Colors.white),
                  controller: myBController,
                  onChanged: (v2) {
                    createNewEmail = v2;
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                TextField(
                  obscuringCharacter: '*',
                  obscureText: true,
                  decoration: const InputDecoration(
                      hintText: 'Enter your password',
                      filled: true,
                      fillColor: Colors.white),
                  controller: myCController,
                  onChanged: (v3) {
                    createNewPassword = v3;
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                FlatButton(
                  onPressed: () async {
                    if (createNewUserName.isNotEmpty &&
                        createNewPassword.isNotEmpty &&
                        createNewEmail.isNotEmpty) {
                      try {
                        final user = await _auth
                            .createUserWithEmailAndPassword(
                                email: createNewEmail,
                                password: createNewPassword)
                            .whenComplete(() =>
                                Navigator.popAndPushNamed(context, 'home'));
                      } catch (e) {
                        print(e);
                      }
                    }
                    myAController.clear();
                    myBController.clear();
                    myCController.clear();
                  },
                  child: const Text('Sign Up'),
                  color: Colors.blue,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.popAndPushNamed(context, 'login');
                    },
                    child: const Text('Already have account?'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
