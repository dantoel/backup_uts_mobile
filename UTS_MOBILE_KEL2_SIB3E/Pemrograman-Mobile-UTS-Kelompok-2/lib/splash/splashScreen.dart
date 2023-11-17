// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:survey_komplain/pages/login/login.dart';
import 'package:survey_komplain/pages/login/register.dart';

class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) {
            if (true) {
              return RegisterPage();
            } else {
              return LoginPage();
            }
          },
        ),
      );
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(color: Colors.red[800]),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset("assets/judul.png"),
          CircularProgressIndicator(
            color: Colors.amber,
          )
        ]),
      ),
    );
  }
}
