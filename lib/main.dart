import 'package:flutter/material.dart';
import 'package:flutter_application_8/LoginPage.dart';
import 'package:flutter_application_8/RegisterPage.dart';
import 'package:flutter_application_8/ProductPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
