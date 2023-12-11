// ignore_for_file: non_constant_identifier_names

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:survey_komplain/controller/dbhelper.dart';
import 'package:survey_komplain/models/item.dart';
import 'package:survey_komplain/pages/laporan_kekerasan/form_laporan.dart';
import 'package:survey_komplain/pages/survey/detail_responden.dart';

import 'detail_kekerasan.dart';
import 'faktor_permasalahan.dart';
import 'form_tambah.dart';
import 'total_responden_gender.dart';
import 'total_responden_negara.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DbHelper dbHelper = DbHelper();
  int count = 0;
  List<Item> itemList = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _showReportDialog();
    });
  }

  Future<void> _showReportDialog() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Image.asset(
                  "assets/no_harashment.png",
                  height: 100,
                  width: 100,
                  fit: BoxFit.contain,
                ),
                Text(
                  "Apakah kamu pernah mengalami atau mengetahui kejadian kekerasan seksual?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () async {
                    var data = await navigateToEntryFormKekerasan(context);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red[700], // warna latar belakang button
                    onPrimary: Colors.white, // warna teks
                  ),
                  child: Text("Laporkan"),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  final dio = Dio();

  String url_domain = "http://192.168.1.18:8000/";
  // String url_count_responden = ;
  // String url_create_data = "${url_domain}api/create_data";
  // String url_show_data = "${url_domain}api/show_data";

  Future<dynamic> countRespondence() async {
    try {
      var response = await dio.post("${url_domain}api/count_responden");
      var result = response.data;
      return result;
    } catch (e) {
      print('error : ${e.toString()}');
      rethrow;
    }
  }

  Future<dynamic> average_age() async {
    try {
      var response = await dio.post("${url_domain}api/average_age");
      var result = response.data;
      return result;
    } catch (e) {
      print('error : ${e.toString()}');
      rethrow;
    }
  }

  Future<dynamic> average_gpa() async {
    try {
      var response = await dio.post("${url_domain}api/average_gpa");
      var result = response.data;
      return result;
    } catch (e) {
      print('error : ${e.toString()}');
      rethrow;
    }
  }

  Future<Item?> navigateToEntryForm(BuildContext context) async {
    var result = await Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) {
      return TambahFormPage();
    }));
    return result;
  }

  Future<Item?> navigateToEntryFormKekerasan(BuildContext context) async {
    var result = await Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) {
      return FormLaporan();
    }));
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 180,
                  decoration: BoxDecoration(
                    color: Colors.red[800],
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50)),
                  ),
                ),
                Positioned(
                  top: 5,
                  left: 5,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(7),
                    child: Container(
                      height: 40,
                      width: 40,
                      child: IconButton(
                        icon: const Icon(
                          Icons.menu,
                          size: 30,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ),
                const Positioned(
                  top: 20,
                  left: 40,
                  child: Image(
                    image: AssetImage("assets/judul.png"),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: ClipOval(
                    child: Image.asset("assets/logo.png"),
                  ),
                ),
                Positioned(
                    bottom: 20,
                    right: 20,
                    child: ElevatedButton(
                      onPressed: () async {
                        return showDialog<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Pilih Form'),
                              content: SingleChildScrollView(
                                child: ListBody(
                                  children: <Widget>[
                                    SizedBox(height: 16),
                                    ElevatedButton(
                                      onPressed: () async {
                                        var data =
                                            await navigateToEntryFormKekerasan(
                                                context);
                                      },
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.red[
                                            700], // warna latar belakang button
                                        onPrimary: Colors.white,
                                      ),
                                      child: Text("Tambah Laporan Kekerasan"),
                                    ),
                                    ElevatedButton(
                                      onPressed: () async {
                                        var data =
                                            await navigateToEntryForm(context);
                                      },
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.red[
                                            700], // warna latar belakang button
                                        onPrimary: Colors.white,
                                      ),
                                      child: Text("Tambah Laporan Survey"),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },

//Ganti bagian onPressed yang button "Tambah Data" (biru atas)
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[800],
                        padding: const EdgeInsets.all(10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        "Tambah Data",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ))
              ],
            ),
            //=============== BODY ====================
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(bottom: 40),
                            child: Text(
                              "Hasil Survey dari Responden : ",
                              style: TextStyle(fontWeight: FontWeight.w900),
                            ),
                          ),
                          // ==================== Card ====================
                          GridView.count(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 1.3,
                            children: [
                              InkWell(
                                onTap: () {
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //       builder: (context) => lihat_detail()),
                                  // );
                                },
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  elevation: 5,
                                  shadowColor: Colors.red,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 15),
                                        child: Text(
                                          "Total Responden",
                                          style: TextStyle(
                                            color: Colors.red[900],
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: FutureBuilder<dynamic>(
                                          future: countRespondence(),
                                          builder: (context, snapshot) {
                                            if (snapshot.hasData) {
                                              return Center(
                                                child: Text(
                                                  snapshot.data[0].toString(),
                                                  style: TextStyle(
                                                    color: Colors.blue[800],
                                                    fontWeight: FontWeight.w800,
                                                    fontSize: 30,
                                                  ),
                                                ),
                                              );
                                            } else {
                                              return const Center(
                                                child: CircularProgressIndicator
                                                    .adaptive(),
                                              );
                                            }
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //       builder: (context) => lihat_detail()),
                                  // );
                                },
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  elevation: 5,
                                  shadowColor: Colors.red,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 15),
                                        child: Text(
                                          "Umur Rata-rata Responden",
                                          style: TextStyle(
                                            color: Colors.red[900],
                                            fontWeight: FontWeight.w800,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      Expanded(
                                        child: FutureBuilder<dynamic>(
                                          future: average_age(),
                                          builder: (context, snapshot) {
                                            if (snapshot.hasData) {
                                              return Center(
                                                child: Text(
                                                  (snapshot.data[0] as num)
                                                      .toStringAsFixed(2),
                                                  style: TextStyle(
                                                    color: Colors.blue[800],
                                                    fontWeight: FontWeight.w800,
                                                    fontSize: 30,
                                                  ),
                                                ),
                                              );
                                            } else {
                                              return const Center(
                                                child: CircularProgressIndicator
                                                    .adaptive(),
                                              );
                                            }
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //       builder: (context) => lihat_detail()),
                                  // );
                                },
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  elevation: 5,
                                  shadowColor: Colors.red,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 15),
                                        child: Text(
                                          "IPK / GPA Rata-rata",
                                          style: TextStyle(
                                            color: Colors.red[900],
                                            fontWeight: FontWeight.w800,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      Expanded(
                                        child: FutureBuilder<dynamic>(
                                          future: average_gpa(),
                                          builder: (context, snapshot) {
                                            if (snapshot.hasData) {
                                              return Center(
                                                child: Text(
                                                  (snapshot.data[0] as num)
                                                      .toStringAsFixed(2),
                                                  style: TextStyle(
                                                    color: Colors.blue[800],
                                                    fontWeight: FontWeight.w800,
                                                    fontSize: 30,
                                                  ),
                                                ),
                                              );
                                            } else {
                                              return const Center(
                                                child: CircularProgressIndicator
                                                    .adaptive(),
                                              );
                                            }
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            faktor_permasalahan()),
                                  );
                                },
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  elevation: 5,
                                  shadowColor: Colors.red,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 15),
                                        child: Text(
                                          "Total Faktor Permasalahan",
                                          style: TextStyle(
                                            color: Colors.red[900],
                                            fontWeight: FontWeight.w800,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      Expanded(
                                        child: Center(
                                          child: Icon(
                                            Icons.bar_chart,
                                            size: 50.0,
                                            color: Colors.red[800],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            total_responden_gender()),
                                  );
                                },
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  elevation: 5,
                                  shadowColor: Colors.red,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 15),
                                        child: Text(
                                          "Total Responden (Gender)",
                                          style: TextStyle(
                                            color: Colors.red[900],
                                            fontWeight: FontWeight.w800,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      Expanded(
                                        child: Center(
                                          child: Icon(
                                            Icons.bar_chart,
                                            size: 50.0,
                                            color: Colors.red[800],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            responden_negara()),
                                  );
                                },
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  elevation: 5,
                                  shadowColor: Colors.red,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 15),
                                        child: Text(
                                          "Total Responden (Negara)",
                                          style: TextStyle(
                                            color: Colors.red[900],
                                            fontWeight: FontWeight.w800,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      Expanded(
                                        child: Center(
                                          child: Icon(
                                            Icons.bar_chart,
                                            size: 50.0,
                                            color: Colors.red[800],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.all(20),
              child: ElevatedButton(
                onPressed: () async {
                  return showDialog<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Pilih Form'),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: <Widget>[
                              SizedBox(height: 16),
                              ElevatedButton(
                                onPressed: () async {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            detail_kekerasan()),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.red[700],
                                ),
                                child: Text("Lihat Laporan Kekerasan"),
                              ),
                              ElevatedButton(
                                onPressed: () async {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            detail_responden()),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.red[700],
                                ),
                                child: Text("Lihat Laporan Survey"),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                /*Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => detail_responden()),
                  );
                },*/
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red[800],
                  padding: const EdgeInsets.all(15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  "Lihat Hasil Responden",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
