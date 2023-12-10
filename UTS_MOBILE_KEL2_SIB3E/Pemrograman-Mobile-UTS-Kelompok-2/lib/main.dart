import 'package:flutter/material.dart';
import 'package:survey_komplain/pages/home.dart';
import 'package:survey_komplain/pages/login/register.dart';
import 'package:survey_komplain/pages/detail_kekerasan.dart';
import 'package:survey_komplain/pages/login/login.dart';

Future<void> main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
