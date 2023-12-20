// ignore_for_file: non_constant_identifier_names

import 'package:dio/dio.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:survey_komplain/controller/dbhelper.dart';
import 'package:survey_komplain/models/item.dart';
import 'package:survey_komplain/pages/laporan_kekerasan/form_laporan.dart';
import 'package:survey_komplain/pages/mahasiswa/detail_mahasiswa.dart';
import 'package:survey_komplain/pages/mahasiswa/detail_ipmatkul.dart';
import 'package:survey_komplain/pages/survey/detail_kekerasan.dart';

class dashboard_laporan extends StatefulWidget {
  @override
  State<dashboard_laporan> createState() => _dashboard_laporanState();
}

class _dashboard_laporanState extends State<dashboard_laporan> {
  DbHelper dbHelper = DbHelper();
  int count = 0;

  @override
  void initState() {
    super.initState();
    //WidgetsBinding.instance!.addPostFrameCallback((_) {
    //  _showReportDialog();
    //}
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

  String url_domain = "http://192.168.0.109:8000/";

  Future<dynamic> hitung_pelecehan() async {
    try {
      var response = await dio.post(
        "${url_domain}api/hitung_jenis_laporan",
        queryParameters: {"jenis": "Pelecehan seksual"},
      );
      var result = response.data;
      return result;
    } catch (e) {
      print('error : ${e.toString()}');
      rethrow;
    }
  }

  Future<dynamic> hitung_kekerasan() async {
    try {
      var response = await dio.post(
        "${url_domain}api/hitung_jenis_laporan",
        queryParameters: {"jenis": "Kekerasan"},
      );
      var result = response.data;
      return result;
    } catch (e) {
      print('error : ${e.toString()}');
      rethrow;
    }
  }

  Future<dynamic> hitung_pencemaran() async {
    try {
      var response = await dio.post(
        "${url_domain}api/hitung_jenis_laporan",
        queryParameters: {"jenis": "Pencemaran nama baik"},
      );
      var result = response.data;
      return result;
    } catch (e) {
      print('error : ${e.toString()}');
      rethrow;
    }
  }

  Future<dynamic> hitung_penghinaan() async {
    try {
      var response = await dio.post(
        "${url_domain}api/hitung_jenis_laporan",
        queryParameters: {"jenis": "Penghinaan"},
      );
      var result = response.data;
      return result;
    } catch (e) {
      print('error : ${e.toString()}');
      rethrow;
    }
  }

  Future<dynamic> hitung_total() async {
    try {
      var response = await dio.post("${url_domain}api/jumlah_laporan");
      var result = response.data;
      return result;
    } catch (e) {
      print('error : ${e.toString()}');
      rethrow;
    }
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
      appBar: AppBar(
        title: Text('Statistik Laporan'),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Column(
          children: [
            //=============== BODY ====================
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 300,
                      child: Column(children: [
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                                padding: EdgeInsets.all(5),
                                child: Text("Persentase Laporan"))),
                        //Chart
                        Expanded(
                          child: Row(
                            children: [
                              Container(
                                width: 200,
                                child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: PieChart(
                                    PieChartData(
                                      sections: [
                                        PieChartSectionData(
                                          value: 62,
                                          color: Colors.red,
                                          title: '62%',
                                        ),
                                        PieChartSectionData(
                                          value: 12,
                                          color: Colors.green,
                                          title: '12%',
                                        ),
                                        PieChartSectionData(
                                          value: 12,
                                          color: Colors.yellow,
                                          title: '12%',
                                        ),
                                        PieChartSectionData(
                                          value: 12,
                                          color:
                                              Color.fromARGB(255, 255, 94, 0),
                                          title: '12%',
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.circle, color: Colors.green),
                                      SizedBox(width: 5),
                                      Text('Penghinaan'),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.circle, color: Colors.red),
                                      SizedBox(width: 5),
                                      Text('Pelecehan'),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.circle, color: Colors.yellow),
                                      SizedBox(width: 5),
                                      Text('Pencemaran'),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.circle,
                                          color:
                                              Color.fromARGB(255, 255, 94, 0)),
                                      SizedBox(width: 5),
                                      Text('Kekerasan'),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        Row(
                          children: [
                            // ... other status widgets ...
                            FutureBuilder(
                              future: hitung_pelecehan(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return CircularProgressIndicator();
                                } else if (snapshot.hasError) {
                                  return Text('Error: ${snapshot.error}');
                                } else {
                                  var data = snapshot.data;
                                  return Padding(
                                    padding: EdgeInsets.only(
                                        top: 20, bottom: 20, left: 15),
                                    child: Container(
                                      width: 80,
                                      height: 60,
                                      color: Color.fromARGB(255, 255, 0, 0),
                                      child: Padding(
                                        padding: EdgeInsets.all(5),
                                        child: Column(
                                          children: [
                                            Text(
                                              "Pelecehan",
                                              style: TextStyle(fontSize: 12),
                                            ),
                                            Text(
                                              data.toString(),
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }
                              },
                            ),
                            //Batas Awal Lulus
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 20, bottom: 20, left: 15),
                              child: FutureBuilder(
                                future:
                                    hitung_kekerasan(), // Ganti dengan fungsi status_lulus
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return CircularProgressIndicator();
                                  } else if (snapshot.hasError) {
                                    return Text('Error: ${snapshot.error}');
                                  } else {
                                    var data = snapshot.data;
                                    return Container(
                                      width: 80,
                                      height: 60,
                                      color: Color.fromARGB(255, 255, 98, 0),
                                      child: Padding(
                                        padding: EdgeInsets.all(5),
                                        child: Column(
                                          children: [
                                            Text(
                                              "Kekerasan",
                                              style: TextStyle(fontSize: 10),
                                              textAlign: TextAlign.center,
                                            ),
                                            Text(
                                              data.toString(),
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }
                                },
                              ),
                            ),
                            //Batas Akhir Lulus
                            //Batas Awal Keluar
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 20, bottom: 20, left: 15),
                              child: FutureBuilder(
                                future:
                                    hitung_pencemaran(), // Ganti dengan fungsi status_lulus
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return CircularProgressIndicator();
                                  } else if (snapshot.hasError) {
                                    return Text('Error: ${snapshot.error}');
                                  } else {
                                    var data = snapshot.data;
                                    return Container(
                                      width: 80,
                                      height: 60,
                                      color: Color.fromARGB(255, 255, 234, 0),
                                      child: Padding(
                                        padding: EdgeInsets.all(5),
                                        child: Column(
                                          children: [
                                            Text(
                                              "Pencemaran",
                                              style: TextStyle(fontSize: 12),
                                            ),
                                            Text(
                                              data.toString(),
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 20, bottom: 20, left: 15),
                              child: FutureBuilder(
                                future:
                                    hitung_penghinaan(), // Ganti dengan fungsi status_lulus
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return CircularProgressIndicator();
                                  } else if (snapshot.hasError) {
                                    return Text('Error: ${snapshot.error}');
                                  } else {
                                    var data = snapshot.data;
                                    return Container(
                                      width: 80,
                                      height: 60,
                                      color: Color.fromARGB(255, 137, 250, 0),
                                      child: Padding(
                                        padding: EdgeInsets.all(5),
                                        child: Column(
                                          children: [
                                            Text(
                                              "Penghinaan",
                                              style: TextStyle(fontSize: 12),
                                            ),
                                            Text(
                                              data.toString(),
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }
                                },
                              ),
                            ),
                            /*Padding(
                              padding: EdgeInsets.only(
                                  top: 20, bottom: 20, left: 15),
                              child: Container(
                                width: 80,
                                height: 60,
                                color: Colors.yellow,
                                child: Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Column(children: [
                                      Text(
                                        "Keluar",
                                        style: TextStyle(fontSize: 12),
                                      ),
                                      Text(
                                        "10",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ])),
                              ),
                            )
                            */
                          ],
                        )
                      ]),
                    ),
                    ////baris 2
                    Row(
                      children: [
                        // ... other status widgets ...
                        FutureBuilder(
                          future: hitung_total(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return CircularProgressIndicator();
                            } else if (snapshot.hasError) {
                              return Text('Error: ${snapshot.error}');
                            } else {
                              var data = snapshot.data;
                              return Padding(
                                padding: EdgeInsets.only(
                                    top: 20, bottom: 20, left: 15),
                                child: Container(
                                  width: 80,
                                  height: 60,
                                  color: Color.fromARGB(255, 255, 170, 0),
                                  child: Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Column(
                                      children: [
                                        Text(
                                          "Total laporan",
                                          style: TextStyle(fontSize: 10),
                                        ),
                                        Text(
                                          data.toString(),
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                        //Batas Awal Lulus
                        Padding(
                          padding:
                              EdgeInsets.only(top: 20, bottom: 20, left: 15),
                          child: FutureBuilder(
                            future:
                                hitung_kekerasan(), // Ganti dengan fungsi status_lulus
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return CircularProgressIndicator();
                              } else if (snapshot.hasError) {
                                return Text('Error: ${snapshot.error}');
                              } else {
                                var data = snapshot.data;
                                return Container(
                                  width: 80,
                                  height: 60,
                                  color: Colors.yellow,
                                  child: Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Column(
                                      children: [
                                        Text(
                                          "Diproses",
                                          style: TextStyle(fontSize: 10),
                                          textAlign: TextAlign.center,
                                        ),
                                        Text(
                                          "3",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                        //Batas Akhir Lulus
                        //Batas Awal Keluar
                        Padding(
                          padding:
                              EdgeInsets.only(top: 20, bottom: 20, left: 15),
                          child: FutureBuilder(
                            future:
                                hitung_pencemaran(), // Ganti dengan fungsi status_lulus
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return CircularProgressIndicator();
                              } else if (snapshot.hasError) {
                                return Text('Error: ${snapshot.error}');
                              } else {
                                var data = snapshot.data;
                                return Container(
                                  width: 80,
                                  height: 60,
                                  color: Colors.red,
                                  child: Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Column(
                                      children: [
                                        Text(
                                          "Ditolak",
                                          style: TextStyle(fontSize: 12),
                                        ),
                                        Text(
                                          data.toString(),
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(top: 20, bottom: 20, left: 15),
                          child: FutureBuilder(
                            future:
                                hitung_penghinaan(), // Ganti dengan fungsi status_lulus
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return CircularProgressIndicator();
                              } else if (snapshot.hasError) {
                                return Text('Error: ${snapshot.error}');
                              } else {
                                var data = snapshot.data;
                                return Container(
                                  width: 80,
                                  height: 60,
                                  color: Color.fromARGB(255, 0, 250, 71),
                                  child: Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Column(
                                      children: [
                                        Text(
                                          "Selesai",
                                          style: TextStyle(fontSize: 12),
                                        ),
                                        Text(
                                          "5",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                        /*Padding(
                              padding: EdgeInsets.only(
                                  top: 20, bottom: 20, left: 15),
                              child: Container(
                                width: 80,
                                height: 60,
                                color: Colors.yellow,
                                child: Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Column(children: [
                                      Text(
                                        "Keluar",
                                        style: TextStyle(fontSize: 12),
                                      ),
                                      Text(
                                        "10",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ])),
                              ),
                            )
                            */
                      ],
                    ),
                    Container(
                      width: double.infinity,
                      height: 200,
                      child: Column(children: [
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                                padding: EdgeInsets.all(5),
                                child: Text("Grafik Laporan Masuk"))),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(top: 10, left: 50),
                            child: LineChart(
                              LineChartData(
                                maxX: 4,
                                minY: 0,
                                maxY: 4,
                                lineBarsData: [
                                  LineChartBarData(
                                    spots: [
                                      FlSpot(1, 2), //tahun 2018
                                      FlSpot(2, 1), //tahun 2019
                                      FlSpot(3, 2), //tahun 2020
                                      FlSpot(4, 3), //tahun 2021
                                    ],
                                  ),
                                ],
                                titlesData: FlTitlesData(
                                  bottomTitles: AxisTitles(
                                    sideTitles: SideTitles(
                                      showTitles: true,
                                      interval: 1,
                                      getTitlesWidget: (value, meta) {
                                        switch (value.toInt()) {
                                          case 1:
                                            return Text('Sep');
                                          case 2:
                                            return Text('Okt');
                                          case 3:
                                            return Text('Nov');
                                          case 4:
                                            return Text('Des');
                                          default:
                                            return SizedBox.shrink();
                                        }
                                      },
                                    ),
                                  ),
                                  leftTitles: AxisTitles(
                                      sideTitles:
                                          SideTitles(showTitles: false)),
                                  topTitles: AxisTitles(
                                      sideTitles:
                                          SideTitles(showTitles: false)),
                                ),
                                borderData: FlBorderData(
                                    show: false), // Menghilangkan border
                              ),
                            ),
                          ),
                        ),
                      ]),
                    )
                  ],
                ),
              ),
            ),
            //======================= grid ================

            //=============== Tombol Bawah ================
            Container(
              width: double.infinity,
              margin: const EdgeInsets.all(20),
              child: ElevatedButton(
                onPressed: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => detail_kekerasan()),
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
                  "Lihat Detail Laporan",
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
