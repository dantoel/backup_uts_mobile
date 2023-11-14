import 'package:flutter/material.dart';

import 'splash/splashScreen.dart';

Future<void> main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: splash(),
    );
  }
}
