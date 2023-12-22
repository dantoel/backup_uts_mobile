// ignore_for_file: non_constant_identifier_names

import 'package:dio/dio.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:survey_komplain/controller/dbhelper.dart';
import 'package:survey_komplain/models/item.dart';
import 'package:survey_komplain/pages/laporan_kekerasan/form_laporan.dart';
import 'package:survey_komplain/pages/mahasiswa/detail_mahasiswa.dart';
import 'package:survey_komplain/pages/mahasiswa/detail_ipmatkul.dart';

class HomeMahasiswa extends StatefulWidget {
  @override
  State<HomeMahasiswa> createState() => _HomeMahasiswaState();
}

class _HomeMahasiswaState extends State<HomeMahasiswa> {
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

  String url_domain = "http://192.168.43.8:8000/";

  Future<dynamic> status_lulus() async {
    try {
      var response = await dio.post(
        "${url_domain}api/count_status_mhs",
        queryParameters: {"status_akhir": "Lulus"},
      );
      var result = response.data;
      return result;
    } catch (e) {
      print('error : ${e.toString()}');
      rethrow;
    }
  }

  Future<dynamic> status_keluar() async {
    try {
      var response = await dio.post(
        "${url_domain}api/count_status_mhs",
        queryParameters: {"status_akhir": "Keluar/Mengundurkan Diri"},
      );
      var result = response.data;
      return result;
    } catch (e) {
      print('error : ${e.toString()}');
      rethrow;
    }
  }

  Future<dynamic> status_mengulangTA() async {
    try {
      var response = await dio.post(
        "${url_domain}api/count_status_mhs",
        queryParameters: {
          "status_akhir": "Mengulang Karena Tidak Lulus Tugas Akhir"
        },
      );
      var result = response.data;
      return result;
    } catch (e) {
      print('error : ${e.toString()}');
      rethrow;
    }
  }

  Future<dynamic> status_tidakJelas() async {
    try {
      var response = await dio.post(
        "${url_domain}api/count_status_mhs",
        queryParameters: {
          "status_akhir": "Tidak Aktif Mengulang TA (Mahasiswa Tidak Jelas)"
        },
      );
      var result = response.data;
      return result;
    } catch (e) {
      print('error : ${e.toString()}');
      rethrow;
    }
  }

  Future<dynamic> status_MDMaba() async {
    try {
      var response = await dio.post(
        "${url_domain}api/count_status_mhs",
        queryParameters: {"status_akhir": "MD MABA"},
      );
      var result = response.data;
      return result;
    } catch (e) {
      print('error : ${e.toString()}');
      rethrow;
    }
  }

  Future<dynamic> status_terminal() async {
    try {
      var response = await dio.post(
        "${url_domain}api/count_status_mhs",
        queryParameters: {"status_akhir": "MD TDU setelah Cuti/TRM"},
      );
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
        title: Text('Statistik Mahasiswa'),
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
                                child: Text("Persentase Status Mahasiswa"))),
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
                                          value: 11,
                                          color: Colors.red,
                                          title: '11%',
                                        ),
                                        PieChartSectionData(
                                          value: 77,
                                          color: Colors.green,
                                          title: '77%',
                                        ),
                                        PieChartSectionData(
                                          value: 7,
                                          color: Colors.yellow,
                                          title: '7%',
                                        ),
                                        PieChartSectionData(
                                          value: 5,
                                          color:
                                              Color.fromARGB(255, 255, 94, 0),
                                          title: '5%',
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
                                      Text('Lulus'),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.circle, color: Colors.red),
                                      SizedBox(width: 5),
                                      Text('Keluar/MD'),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.circle, color: Colors.yellow),
                                      SizedBox(width: 5),
                                      Text('Mengulang TA'),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.circle,
                                          color:
                                              Color.fromARGB(255, 255, 94, 0)),
                                      SizedBox(width: 5),
                                      Text('Mahasiswa Tidak Jelas'),
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
                              future: status_lulus(),
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
                                      color: Colors.green,
                                      child: Padding(
                                        padding: EdgeInsets.all(5),
                                        child: Column(
                                          children: [
                                            Text(
                                              "Lulus",
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
                                    status_mengulangTA(), // Ganti dengan fungsi status_lulus
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
                                              "Mengulang TA",
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
                                    status_keluar(), // Ganti dengan fungsi status_lulus
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
                                              "Keluar/MD",
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
                                    status_tidakJelas(), // Ganti dengan fungsi status_lulus
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
                                      color: Color.fromARGB(255, 250, 112, 0),
                                      child: Padding(
                                        padding: EdgeInsets.all(5),
                                        child: Column(
                                          children: [
                                            Text(
                                              "Tidak Jelas",
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
                    Container(
                      width: double.infinity,
                      height: 200,
                      child: Column(children: [
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                                padding: EdgeInsets.all(5),
                                child: Text("Rata-rata IPK Per Tahun"))),
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
                                      FlSpot(1, 3.65), //tahun 2018
                                      FlSpot(2, 3.47), //tahun 2019
                                      FlSpot(3, 3.67), //tahun 2020
                                      FlSpot(4, 3.83), //tahun 2021
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
                                            return Text('2018');
                                          case 2:
                                            return Text('2019');
                                          case 3:
                                            return Text('2020');
                                          case 4:
                                            return Text('2021');
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => detail_ipmatkul()),
                  );
                },
                child: Container(
                  width: double.infinity,
                  child: Card(
                    color: Color.fromARGB(255, 167, 244, 0),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 30),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.data_thresholding,
                            size: 50,
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('Kelola Nilai Mahasiswa',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                                Text(
                                  'Semester Ganjil 2023/2024',
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            //=============== Tombol Bawah ================
            Container(
              width: double.infinity,
              margin: const EdgeInsets.all(20),
              child: ElevatedButton(
                onPressed: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => detail_mahasiswa()),
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
                  "Lihat IPK Mahasiswa",
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
