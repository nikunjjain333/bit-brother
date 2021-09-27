import 'package:flutter/material.dart';
import 'package:bit_brother/screens/home.dart';
import 'package:bit_brother/screens/log_in.dart';
import 'package:bit_brother/screens/sign_up.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NewUser(),
      routes: {
        'login':(context)=>LoginUser(),
        'signup':(context)=>NewUser(),
        'home':(context)=>MyHomePage(),
      },
    );
  }
}
