import 'package:flutter/material.dart';

class detail_responden extends StatelessWidget {
  final String data;

  detail_responden({required this.data});

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
                              "Detail Faktor " + data,
                              style: TextStyle(
                                  fontWeight: FontWeight.w900, fontSize: 25),
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
                            rows: const <DataRow>[
                              DataRow(
                                cells: <DataCell>[
                                  DataCell(Text('Age')),
                                  DataCell(Text('27')),
                                ],
                              ),
                              DataRow(
                                cells: <DataCell>[
                                  DataCell(Text('Gpa')),
                                  DataCell(Text('2,18')),
                                ],
                              ),
                              DataRow(
                                cells: <DataCell>[
                                  DataCell(Text('Year')),
                                  DataCell(Text('2')),
                                ],
                              ),
                              DataRow(
                                cells: <DataCell>[
                                  DataCell(Text('Count')),
                                  DataCell(Text('1')),
                                ],
                              ),
                              DataRow(
                                cells: <DataCell>[
                                  DataCell(Text('Gender')),
                                  DataCell(Text('M')),
                                ],
                              ),
                              DataRow(
                                cells: <DataCell>[
                                  DataCell(Text('Nationality')),
                                  DataCell(Text('Indonesia')),
                                ],
                              ),
                              DataRow(
                                cells: <DataCell>[
                                  DataCell(Text('Report')),
                                  DataCell(Text(
                                      'The limited access to research databases and materials is causing a lot of frustration among students. We need better access to be able to succeed academically.')), // Ganti 'Flutter Mobile' dengan nilai yang sesuai
                                ],
                              ),
                            ],
                          )
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
