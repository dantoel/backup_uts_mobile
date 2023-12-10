import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class detail_responden extends StatefulWidget {
  @override
  State<detail_responden> createState() => _detail_respondenState();
}

class _detail_respondenState extends State<detail_responden> {
  final dio = Dio();
  List<Map<String, dynamic>> data = [];

  String url_domain = "http://192.168.1.6:8000/";

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
                        vertical: 20, horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Text(
                            // ignore: prefer_interpolation_to_compose_strings
                            "Detail Responden ",
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 25,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        DataTable(
                          columnSpacing: 16,
                          dataRowMaxHeight: 150,
                          columns: const <DataColumn>[
                            DataColumn(
                              label: Text(
                                'Genre',
                                style: TextStyle(fontStyle: FontStyle.italic),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Reports',
                                style: TextStyle(fontStyle: FontStyle.italic),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Gpa',
                                style: TextStyle(fontStyle: FontStyle.italic),
                              ),
                            ),
                          ],
                          rows: data.map((rowData) {
                            return DataRow(
                              cells: <DataCell>[
                                DataCell(
                                  Container(
                                    width: 80, // Atur lebar sel
                                    height: 200, // Atur tinggi sel
                                    alignment: Alignment
                                        .centerLeft, // Atur alignment teks dalam sel
                                    child: Text(rowData['Genre'].toString()),
                                  ), // Atur margin vertikal
                                ),
                                DataCell(
                                  Container(
                                    width: 180, // Atur lebar sel
                                    height: 150, // Atur tinggi sel
                                    alignment: Alignment
                                        .centerLeft, // Atur alignment teks dalam sel
                                    child: Text(rowData['Reports'].toString()),
                                  ),
                                ),
                                DataCell(
                                  Container(
                                      width: 100, // Atur lebar sel
                                      height: 40, // Atur tinggi sel
                                      alignment: Alignment
                                          .centerLeft, // Atur alignment teks dalam sel
                                      child: Text(rowData['Gpa'].toString())),
                                )
                              ],
                            );
                          }).toList(),
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
