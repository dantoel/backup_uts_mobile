import 'package:charts_flutter_new/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class responden_negara extends StatefulWidget {
  @override
  State<responden_negara> createState() => _responden_negaraState();
}

class MyData {
  final String name;
  final int value;

  MyData(this.name, this.value);
}

class _responden_negaraState extends State<responden_negara> {
  final dio = Dio();

  String url_domain = "http://192.168.77.239:8000/";
  // String url_count_responden = ;
  // String url_create_data = "${url_domain}api/create_data";
  // String url_show_data = "${url_domain}api/show_data";

  @override
  void initState() {
    super.initState();
  }

  Future<dynamic> countcountryFR() async {
    try {
      var response = await dio.post(
        "${url_domain}api/count_country",
        queryParameters: {"Nationality": "France"},
      );
      var result = response.data;
      return result;
    } catch (e) {
      print('error : ${e.toString()}');
      rethrow;
    }
  }

  Future<dynamic> countcountryID() async {
    try {
      var response = await dio.post(
        "${url_domain}api/count_country",
        queryParameters: {"Nationality": "Indonesia"},
      );
      var result = response.data;
      return result;
    } catch (e) {
      print('error : ${e.toString()}');
      rethrow;
    }
  }

  Future<dynamic> countcountryMX() async {
    try {
      var response = await dio.post(
        "${url_domain}api/count_country",
        queryParameters: {"Nationality": "Mexico"},
      );
      var result = response.data;
      return result;
    } catch (e) {
      print('error : ${e.toString()}');
      rethrow;
    }
  }

  Future<dynamic> countcountrySD() async {
    try {
      var response = await dio.post(
        "${url_domain}api/count_country",
        queryParameters: {"Nationality": "Soudan"},
      );
      var result = response.data;
      return result;
    } catch (e) {
      print('error : ${e.toString()}');
      rethrow;
    }
  }

  Future<dynamic> countcountrySA() async {
    try {
      var response = await dio.post(
        "${url_domain}api/count_country",
        queryParameters: {"Nationality": "South Africa"},
      );
      var result = response.data;
      return result;
    } catch (e) {
      print('error : ${e.toString()}');
      rethrow;
    }
  }

  Future<dynamic> countcountryYMN() async {
    try {
      var response = await dio.post(
        "${url_domain}api/count_country",
        queryParameters: {"Nationality": "Yemen"},
      );
      var result = response.data;
      return result;
    } catch (e) {
      print('error : ${e.toString()}');
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    var data = [
      new MyData('FRA', 133),
      new MyData('IDN', 485),
      new MyData('MXC', 144),
      new MyData('SDN', 168),
      new MyData('SAF', 26),
      new MyData('YMN', 49),
    ];

    var seriesList = [
      new charts.Series<MyData, String>(
        id: 'Values',
        domainFn: (MyData data, _) => data.name,
        measureFn: (MyData data, _) => data.value,
        data: data,
        labelAccessorFn: (MyData data, _) => '${data.name}: ${data.value}',
      ),
    ];

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            //=============== BODY ====================
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Text(
                              "Detail Responden",
                              style: TextStyle(
                                  fontWeight: FontWeight.w900, fontSize: 25),
                            ),
                          ),
                          // ==================== Card ====================
                          GridView.count(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            crossAxisCount: 1,
                            childAspectRatio: 1,
                            children: [
                              Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                elevation: 5,
                                shadowColor: Colors.red,
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Center(
                                          child: charts.BarChart(
                                            seriesList,
                                            vertical: false,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Text(
                              "Diagram Total Responden Berdasarkan Negara",
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 25,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Text(
                              "France",
                              style: TextStyle(
                                fontSize: 15,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: FutureBuilder<dynamic>(
                                  future: countcountryFR(),
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
                                  })),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Text(
                              "Indonesia",
                              style: TextStyle(
                                fontSize: 15,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: FutureBuilder<dynamic>(
                                  future: countcountryID(),
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
                                  })),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Text(
                              "Mexico",
                              style: TextStyle(
                                fontSize: 15,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: FutureBuilder<dynamic>(
                                  future: countcountryMX(),
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
                                  })),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Text(
                              "Soudan",
                              style: TextStyle(
                                fontSize: 15,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: FutureBuilder<dynamic>(
                                  future: countcountrySD(),
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
                                  })),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Text(
                              "Yemen",
                              style: TextStyle(
                                fontSize: 15,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: FutureBuilder<dynamic>(
                                  future: countcountryYMN(),
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
                                  }))
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
                  Navigator.pop(context);
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
    );
  }
}
