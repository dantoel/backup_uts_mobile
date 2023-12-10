import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

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
  final Map<String, double> dataMap = {
    'Male': 549,
    'Female': 456,
  };

  String url_domain = "http://192.168.1.18:8000";

  @override
  void initState() {
    super.initState();
  }

  Future<dynamic> count_genderM() async {
    try {
      var response = await dio.post(
        "${url_domain}/api/count_gender",
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
                                            child: PieChart(
                                              dataMap: dataMap,
                                              colorList: [
                                                Colors.red,
                                                Colors.blue
                                              ],
                                              animationDuration:
                                                  Duration(milliseconds: 800),
                                              chartLegendSpacing: 32,
                                              chartRadius:
                                                  MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      2.7,
                                              chartValuesOptions:
                                                  ChartValuesOptions(
                                                showChartValueBackground: true,
                                                showChartValuesInPercentage:
                                                    true,
                                                showChartValuesOutside: false,
                                                chartValueStyle: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
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
