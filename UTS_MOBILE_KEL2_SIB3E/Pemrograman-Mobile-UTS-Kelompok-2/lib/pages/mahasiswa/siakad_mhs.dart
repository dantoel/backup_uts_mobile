import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:survey_komplain/pages/login/login.dart';
import 'package:survey_komplain/pages/laporan_kekerasan/form_laporan.dart';
import 'package:survey_komplain/models/item.dart';

class siakad_mhs extends StatefulWidget {
  @override
  State<siakad_mhs> createState() => _siakad_mhsState();
}

class _siakad_mhsState extends State<siakad_mhs> {
  final dio = Dio();
  List<Map<String, dynamic>> data = [];

  String url_domain = "http://192.168.43.8:8000";

  @override
  void initState() {
    super.initState();
    //nilai_mhs();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _showReportDialog();
    });
  }

/*
  Future<dynamic> nilai_mhs() async {
    try {
      var response = await dio.post("${url_domain}/api/nilai_matkul");
      var result = response.data;
      //return result;
      if (result is List) {
        data = List<Map<String, dynamic>>.from(result);
        setState(() {});
      }
    } catch (e) {
      print('error : ${e.toString()}');
      rethrow;
    }
  }
*/
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
            Container(
              child: Stack(
                children: [
                  Transform.translate(
                    offset: Offset(-100.0, 0.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(800),
                        bottomRight: Radius.circular(800),
                      ),
                      child: Container(
                        width: double.infinity,
                        height: 140,
                        color: Colors.red[800],
                      ),
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
                              icon: Icon(
                                Icons.menu,
                                size: 30,
                              ),
                              onPressed: () {},
                            )),
                      )),
                  Positioned(
                    top: 40,
                    left: 60,
                    width: 100,
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
            ),
            //=============== BODY ====================
            Expanded(
              child: SingleChildScrollView(
                child: Column(children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Text(
                            // ignore: prefer_interpolation_to_compose_strings
                            "Nilai Mahasiswa \nFIRDA AGENG MIHARTO",
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 25,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        DataTable(
                          columns: const <DataColumn>[
                            DataColumn(
                              label: Text('Mata Kuliah'),
                            ),
                            DataColumn(
                              label: Text('Nilai'),
                            ),
                          ],
                          rows: const <DataRow>[
                            DataRow(
                              cells: <DataCell>[
                                DataCell(Text('Manajemen Proyek')),
                                DataCell(Text('3')),
                              ],
                            ),
                            DataRow(
                              cells: <DataCell>[
                                DataCell(Text('Keamanan Siber')),
                                DataCell(Text('3.5')),
                              ],
                            ),
                            DataRow(
                              cells: <DataCell>[
                                DataCell(Text('E-Business')),
                                DataCell(Text('3')),
                              ],
                            ),
                            DataRow(
                              cells: <DataCell>[
                                DataCell(Text('Pemrograman Mobile')),
                                DataCell(Text('3.5')),
                              ],
                            ),
                            DataRow(
                              cells: <DataCell>[
                                DataCell(Text('Sistem Pendukung Keputusan')),
                                DataCell(Text('3')),
                              ],
                            ),
                            DataRow(
                              cells: <DataCell>[
                                DataCell(Text('Proyek 3')),
                                DataCell(Text('4')),
                              ],
                            ),
                            DataRow(
                              cells: <DataCell>[
                                DataCell(Text('Indeks Prestasi')),
                                DataCell(Text('3')),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          width: double.infinity,
                          margin: const EdgeInsets.all(20),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red[800],
                              padding: EdgeInsets.all(15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text(
                              "Kembali",
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
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
