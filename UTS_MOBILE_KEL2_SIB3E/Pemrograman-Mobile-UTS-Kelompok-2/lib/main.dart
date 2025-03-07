import 'package:flutter/material.dart';
import 'package:survey_komplain/splash/splashScreen.dart';
import 'package:survey_komplain/pages/mahasiswa/siakad_mhs.dart';
import 'package:survey_komplain/pages/laporan_kekerasan/dashboard_laporan.dart';

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
