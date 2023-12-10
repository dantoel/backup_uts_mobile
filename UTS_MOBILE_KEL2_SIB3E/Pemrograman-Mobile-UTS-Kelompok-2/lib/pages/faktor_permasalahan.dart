import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:survey_komplain/models/chart_data.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class faktor_permasalahan extends StatefulWidget {
  @override
  State<faktor_permasalahan> createState() => _faktor_permasalahanState();
}

final dio = Dio();

class _faktor_permasalahanState extends State<faktor_permasalahan> {
  String url_domain = "http://192.168.1.6:8000/";

  @override
  void initState() {
    super.initState();
  }

  Future<dynamic> countGenreAcademic() async {
    try {
      var response = await dio.post(
        "${url_domain}api/count_genre",
        queryParameters: {"Genre": "Academic Support and Resources"},
      );
      var result = response.data;
      return result;
    } catch (e) {
      print('error : ${e.toString()}');
      rethrow;
    }
  }

  Future<dynamic> countGenreActivities() async {
    try {
      var response = await dio.post(
        "${url_domain}api/count_genre",
        queryParameters: {"Genre": "Activities and Travelling"},
      );
      var result = response.data;
      return result;
    } catch (e) {
      print('error : ${e.toString()}');
      rethrow;
    }
  }

  Future<dynamic> countGenreSports() async {
    try {
      var response = await dio.post(
        "${url_domain}api/count_genre",
        queryParameters: {"Genre": "Athletics and sports"},
      );
      var result = response.data;
      return result;
    } catch (e) {
      print('error : ${e.toString()}');
      rethrow;
    }
  }

  Future<dynamic> countGenreCareer() async {
    try {
      var response = await dio.post(
        "${url_domain}api/count_genre",
        queryParameters: {"Genre": "Career opportunities"},
      );
      var result = response.data;
      return result;
    } catch (e) {
      print('error : ${e.toString()}');
      rethrow;
    }
  }

  Future<dynamic> countGenreFinancial() async {
    try {
      var response = await dio.post(
        "${url_domain}api/count_genre",
        queryParameters: {"Genre": "Financial Support"},
      );
      var result = response.data;
      return result;
    } catch (e) {
      print('error : ${e.toString()}');
      rethrow;
    }
  }

  Future<dynamic> countGenreCantines() async {
    try {
      var response = await dio.post(
        "${url_domain}api/count_genre",
        queryParameters: {"Genre": "Food and Cantines"},
      );
      var result = response.data;
      return result;
    } catch (e) {
      print('error : ${e.toString()}');
      rethrow;
    }
  }

  Future<dynamic> countGenreHealth() async {
    try {
      var response = await dio.post(
        "${url_domain}api/count_genre",
        queryParameters: {"Genre": "Health and Well-being Support"},
      );
      var result = response.data;
      return result;
    } catch (e) {
      print('error : ${e.toString()}');
      rethrow;
    }
  }

  Future<dynamic> countGenreHousing() async {
    try {
      var response = await dio.post(
        "${url_domain}api/count_genre",
        queryParameters: {"Genre": "Housing and Transportation"},
      );
      var result = response.data;
      return result;
    } catch (e) {
      print('error : ${e.toString()}');
      rethrow;
    }
  }

  Future<dynamic> countGenreInterStudents() async {
    try {
      var response = await dio.post(
        "${url_domain}api/count_genre",
        queryParameters: {"Genre": "International student experiences"},
      );
      var result = response.data;
      return result;
    } catch (e) {
      print('error : ${e.toString()}');
      rethrow;
    }
  }

  Future<dynamic> countGenreOnlineLearning() async {
    try {
      var response = await dio.post(
        "${url_domain}api/count_genre",
        queryParameters: {"Genre": "Online learning"},
      );
      var result = response.data;
      return result;
    } catch (e) {
      print('error : ${e.toString()}');
      rethrow;
    }
  }

  Future<dynamic> countGenreStudAffairs() async {
    try {
      var response = await dio.post(
        "${url_domain}api/count_genre",
        queryParameters: {"Genre": "Student Affairs"},
      );
      var result = response.data;
      return result;
    } catch (e) {
      print('error : ${e.toString()}');
      rethrow;
    }
  }

  final List<ChartData> chartData = [
    ChartData(1, 236),
    ChartData(2, 40),
    ChartData(3, 85),
    ChartData(4, 89),
    ChartData(5, 91),
    ChartData(6, 138),
    ChartData(7, 53),
    ChartData(8, 64),
    ChartData(9, 86),
    ChartData(10, 90),
    ChartData(11, 33)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SfCartesianChart(
                series: <ChartSeries>[
                  // Renders bar chart
                  ColumnSeries<ChartData, double>(
                    dataSource: chartData,
                    xValueMapper: (ChartData data, _) => data.x,
                    yValueMapper: (ChartData data, _) => data.y,
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  "Academic Support and Resources",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: FutureBuilder<dynamic>(
                      future: countGenreAcademic(),
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
                            child: CircularProgressIndicator.adaptive(),
                          );
                        }
                      })),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  "Activities and Travelling",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: FutureBuilder<dynamic>(
                      future: countGenreActivities(),
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
                            child: CircularProgressIndicator.adaptive(),
                          );
                        }
                      })),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  "Athletics and sports",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: FutureBuilder<dynamic>(
                      future: countGenreSports(),
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
                            child: CircularProgressIndicator.adaptive(),
                          );
                        }
                      })),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  "Career opportunities",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: FutureBuilder<dynamic>(
                      future: countGenreCareer(),
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
                            child: CircularProgressIndicator.adaptive(),
                          );
                        }
                      })),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  "Financial Support",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: FutureBuilder<dynamic>(
                      future: countGenreFinancial(),
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
                            child: CircularProgressIndicator.adaptive(),
                          );
                        }
                      })),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  "Food and Cantines",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: FutureBuilder<dynamic>(
                      future: countGenreCantines(),
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
                            child: CircularProgressIndicator.adaptive(),
                          );
                        }
                      })),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  "Health and Well-being Support",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: FutureBuilder<dynamic>(
                      future: countGenreHealth(),
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
                            child: CircularProgressIndicator.adaptive(),
                          );
                        }
                      })),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  "Housing and Transportation",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: FutureBuilder<dynamic>(
                      future: countGenreHousing(),
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
                            child: CircularProgressIndicator.adaptive(),
                          );
                        }
                      })),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  "International student experiences",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: FutureBuilder<dynamic>(
                      future: countGenreInterStudents(),
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
                            child: CircularProgressIndicator.adaptive(),
                          );
                        }
                      })),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  "Online Learning",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: FutureBuilder<dynamic>(
                      future: countGenreOnlineLearning(),
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
                            child: CircularProgressIndicator.adaptive(),
                          );
                        }
                      })),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  "Student Affairs",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: FutureBuilder<dynamic>(
                      future: countGenreStudAffairs(),
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
                            child: CircularProgressIndicator.adaptive(),
                          );
                        }
                      })),
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
        ));
  }
}
