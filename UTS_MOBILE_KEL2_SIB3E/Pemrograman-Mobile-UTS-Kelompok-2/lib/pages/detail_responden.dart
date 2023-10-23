import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

abstract class detailresponden extends StatelessWidget {
  final String data;
  detailresponden({required this.data});
}

class detail_responden extends StatefulWidget {
  @override
  State<detail_responden> createState() => _detail_respondenState();
}

class _detail_respondenState extends State<detail_responden> {
  final dio = Dio();
  List<Map<String, dynamic>> data = [];

  String url_domain = "http://192.168.77.238:8000/";

  @override
  void initState() {
    super.initState();
    show_all_data();
  }

  Future<dynamic> show_all_data() async {
    try {
      var response = await dio.post("${url_domain}api/all_data");
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
                        vertical: 20, horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Text(
                            // ignore: prefer_interpolation_to_compose_strings
                            "Detail Faktor ",
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
                              label: Text(
                                'Baris',
                                style: TextStyle(fontStyle: FontStyle.italic),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Nilai',
                                style: TextStyle(fontStyle: FontStyle.italic),
                              ),
                            ),
                          ],

                          rows: data.map((rowData) {
                            return DataRow(
                              cells: <DataCell>[
                                DataCell(Text(rowData['Baris'].toString())),
                                DataCell(Text(rowData['Nilai'].toString())),
                              ],
                            );
                          }).toList(),

                          // ==================== Card ====================
                          // for (var i = 0; i < dataList.length; i++)
                          //   DataTable(
                          //     columns: const <DataColumn>[
                          //       DataColumn(
                          //         label: Text(
                          //           'Nama Baris',
                          //           style:
                          //               TextStyle(fontStyle: FontStyle.italic),
                          //         ),
                          //       ),
                          //       DataColumn(
                          //         label: Text(
                          //           'Nilai',
                          //           style:
                          //               TextStyle(fontStyle: FontStyle.italic),
                          //         ),
                          //       ),
                          //     ],
                          //     rows: const <DataRow>[
                          //       DataRow(
                          //         cells: <DataCell>[
                          //           DataCell(Text('Age')),
                          //           DataCell(Text(dataList[i]
                          //               .age)), // Ganti dengan nilai yang sesuai
                          //         ],
                          //       ),
                          //       DataRow(
                          //         cells: <DataCell>[
                          //           DataCell(Text('Gpa')),
                          //           DataCell(Text(dataList[i]
                          //               .gpa)), // Ganti dengan nilai yang sesuai
                          //         ],
                          //       ),
                          //       DataRow(
                          //         cells: <DataCell>[
                          //           DataCell(Text('Year')),
                          //           DataCell(Text(dataList[i]
                          //               .year)), // Ganti dengan nilai yang sesuai
                          //         ],
                          //       ),
                          //       DataRow(
                          //         cells: <DataCell>[
                          //           DataCell(Text('Count')),
                          //           DataCell(Text(dataList[i]
                          //               .count)), // Ganti dengan nilai yang sesuai
                          //         ],
                          //       ),
                          //       DataRow(
                          //         cells: <DataCell>[
                          //           DataCell(Text('Gender')),
                          //           DataCell(Text(dataList[i]
                          //               .gender)), // Ganti dengan nilai yang sesuai
                          //         ],
                          //       ),
                          //       DataRow(
                          //         cells: <DataCell>[
                          //           DataCell(Text('Nationality')),
                          //           DataCell(Text(dataList[i]
                          //               .nationality)), // Ganti dengan nilai yang sesuai
                          //         ],
                          //       ),
                          //       DataRow(
                          //         cells: <DataCell>[
                          //           DataCell(Text('Report')),
                          //           DataCell(Text(dataList[i]
                          //               .report)), // Ganti dengan nilai yang sesuai
                          //         ],
                          //       ),
                          //     ],
                          //   )
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
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
