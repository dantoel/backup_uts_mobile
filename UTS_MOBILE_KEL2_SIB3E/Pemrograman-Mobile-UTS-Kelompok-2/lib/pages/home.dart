// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import 'faktor_permasalahan.dart';
import 'lihat_detail.dart';
import 'total_responden_gender.dart';
import 'total_responden_negara.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final dio = Dio();

  String url_domain = "http://192.168.1.8:8000/";
  // String url_count_responden = ;
  // String url_create_data = "${url_domain}api/create_data";
  // String url_show_data = "${url_domain}api/show_data";

  @override
  void initState() {
    super.initState();
  }

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
                            padding: EdgeInsets.only(bottom: 20),
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
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => lihat_detail()),
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
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => lihat_detail()),
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
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => lihat_detail()),
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
                                            responden_gender()),
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
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => lihat_detail()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red[800],
                  padding: const EdgeInsets.all(15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  "Lihat Detail Responden",
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
