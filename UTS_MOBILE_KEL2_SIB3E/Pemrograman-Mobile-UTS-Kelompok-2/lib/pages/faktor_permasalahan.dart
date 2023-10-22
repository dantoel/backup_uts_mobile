import 'package:charts_flutter_new/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:survey_komplain/models/chart_data.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:dio/dio.dart';

class faktor_permasalahan extends StatefulWidget {
  @override
  State<faktor_permasalahan> createState() => _faktor_permasalahanState();
}

final dio = Dio();

class _faktor_permasalahanState extends State<faktor_permasalahan> {
  String url_domain = "http://192.168.43.161:8000/";
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

  final List<ChartData> chartData = [
    ChartData(1, 35),
    ChartData(2, 23),
    ChartData(3, 34),
    ChartData(4, 25),
    ChartData(5, 40)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
      ),
      body: Column(
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
          Text('tulisin sendiri'),
          Expanded(child: Container()),
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
    );
  }
}
