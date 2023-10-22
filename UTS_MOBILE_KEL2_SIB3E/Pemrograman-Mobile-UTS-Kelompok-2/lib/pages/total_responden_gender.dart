import 'package:charts_flutter_new/flutter.dart' as charts;
import 'package:flutter/material.dart';

class MyData {
  final String name;
  final int value;

  MyData(this.name, this.value);
}

class responden_gender extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var data = [
      new MyData('Male', 549),
      new MyData('Female', 456),
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
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,",
                              style: TextStyle(
                                fontSize: 15,
                              ),
                              textAlign: TextAlign.center,
                            ),
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
