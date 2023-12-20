import 'package:flutter/material.dart';
import 'package:survey_komplain/pages/mahasiswa/home_mahasiswa.dart';
import 'package:survey_komplain/pages/survey/home.dart';
import 'package:survey_komplain/pages/laporan_kekerasan/dashboard_laporan.dart';

class Homeasli extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: <Widget>[
            // Section 1
            Container(
              height: MediaQuery.of(context).size.height / 3,
              width: double.infinity,
              color: Colors.red[800],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset('assets/judul.png'),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Center(
                      child: Text(
                        'Selamat datang! \nBerikut menu yang berhak anda akses',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ), //
                ],
              ),
            ),
/*
            // Section 2
            Container(
              height: MediaQuery.of(context).size.height / 4,
              width: double.infinity,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 35),
                  child: Text(
                    '"Membangun masa depan kampus yang lebih baik melalui data. Kami mengumpulkan dan menganalisis data fasilitas kampus untuk membantu meningkatkan pengalaman belajar Anda."',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ),
            ),
*/
            // Section 3
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Pilih menu yang anda inginkan :",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeMahasiswa()),
                          );
                        },
                        child: Container(
                          width: double.infinity,
                          child: Card(
                            color: Colors.amber[700],
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 30),
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.people_alt,
                                    size: 50,
                                  ),
                                  SizedBox(width: 20),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text('SIAKAD',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold)),
                                        Text(
                                            'Sistem Informasi akademik mahasiswa'),
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                          );
                        },
                        child: Container(
                          width: double.infinity,
                          child: Card(
                            color: Colors.amber[500],
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text('SIANGKET',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold)),
                                        Text(
                                          'Sistem Informasi Data Kuisioner Mahasiswa',
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => dashboard_laporan()),
                          );
                        },
                        child: Container(
                          width: double.infinity,
                          child: Card(
                            color: Colors.amber[500],
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text('SIPKS',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold)),
                                        Text(
                                          'Sistem Informasi Pelaporan Kekerasan Seksual Mahasiswa',
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
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
