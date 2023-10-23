import 'package:charts_flutter_new/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class total_responden_gender extends StatefulWidget {
  @override
  State<total_responden_gender> createState() => _total_responden_genderState();
}

class MyData {
  final String name;
  final int value;

  MyData(this.name, this.value);
}

class _total_responden_genderState extends State<total_responden_gender> {
  final dio = Dio();

  String url_domain = "http://192.168.0.106:8000/";
  // String url_count_responden = ;
  // String url_create_data = "${url_domain}api/create_data";
  // String url_show_data = "${url_domain}api/show_data";

  @override
  void initState() {
    super.initState();
  }

  Future<dynamic> count_genderM() async {
    try {
      var response = await dio.post(
        "${url_domain}api/count_gender",
        queryParameters: {"Gender": "M"},
      );
      var result = response.data;
      return result;
    } catch (e) {
      print('error : ${e.toString()}');
      rethrow;
    }
  }

  Future<dynamic> count_genderF() async {
    try {
      var response = await dio.post(
        "${url_domain}api/count_gender",
        queryParameters: {"Gender": "F"},
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
      new MyData('Male', 456),
      new MyData('Female', 549),
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
                                            child: charts.PieChart(
                                              seriesList,
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
                                "Diagram Total Responden Berdasarkan Gender",
                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 25,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),

                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Text(
                                      "Male",
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: FutureBuilder<dynamic>(
                                      future: count_genderM(),
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
                                          return Container();
                                        }
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                      child: Text(
                                        "Female",
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Padding(
                                        padding: const EdgeInsets.only(top: 20),
                                        child: FutureBuilder<dynamic>(
                                            future: count_genderF(),
                                            builder: (context, snapshot) {
                                              if (snapshot.hasData) {
                                                return Center(
                                                    child: Text(
                                                  (snapshot.data[0] as num)
                                                      .toStringAsFixed(2),
                                                  style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 84, 141, 206),
                                                    fontWeight: FontWeight.w800,
                                                    fontSize: 30,
                                                  ),
                                                ));
                                              } else
                                                return Container();
                                            })),
                                  ],
                                ))
                          ]),
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
