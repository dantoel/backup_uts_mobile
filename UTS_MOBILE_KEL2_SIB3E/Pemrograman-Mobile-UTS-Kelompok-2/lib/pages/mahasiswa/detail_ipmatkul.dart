/*
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class detail_mahasiswa extends StatefulWidget {
  @override
  State<detail_mahasiswa> createState() => _detail_mahasiswaState();
}

class _detail_mahasiswaState extends State<detail_mahasiswa> {
  final dio = Dio();
  List<Map<String, dynamic>> data = [];

  List<String> nim = [];
  List<String> nama_mhs = [];
  List<String> ip_manpro = [];
  List<String> ip_kamsi = [];
  List<String> ip_ebis = [];
  List<String> ip_mobile = [];
  List<String> ip_spk = [];
  List<String> ip_pcvk = [];
  List<String> ip_proyek = [];
  List<String> ips = [];
  List<String> status = [];

  bool isLoading = true;
  final _formKey = GlobalKey<FormState>();



  String url_domain = "http://192.168.43.8:8000/";

  @override
  void initState() {
    super.initState();
    /*
    fetchData();
    fetchDropDown();
    */
    detail_mhs();
  }
*/
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class detail_ipmatkul extends StatefulWidget {
  @override
  _detail_ipmatkulState createState() => _detail_ipmatkulState();
}

class _detail_ipmatkulState extends State<detail_ipmatkul> {
  Dio dio = Dio();
  List<Map<String, dynamic>> nilaiMatkulList = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  final nimController = TextEditingController();
  final nama_mhsController = TextEditingController();
  final ip_manproController = TextEditingController();
  final ip_kamsiController = TextEditingController();
  final ip_ebisController = TextEditingController();
  final ip_mobileController = TextEditingController();
  final ip_spkController = TextEditingController();
  final ip_pcvkController = TextEditingController();
  final ip_proyekController = TextEditingController();
  final ipsController = TextEditingController();
  final statusController = TextEditingController();

  String url_domain = "http://192.168.43.8:8000/";

  Future<void> fetchData() async {
    try {
      Response response = await dio.post("${url_domain}api/show_nilai");
      setState(() {
        nilaiMatkulList = List<Map<String, dynamic>>.from(response.data);
      });
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  Future<void> deleteData(int id) async {
    try {
      await dio.delete("${url_domain}api/show_nilai");
      fetchData(); // Refresh data after deletion
    } catch (e) {
      print('Error deleting data: $e');
    }
  }

  Future<void> editData(int id, Map<String, dynamic> newData) async {
    try {
      await dio.put('$url_domain/api/detail_mhs', data: newData);

      fetchData(); // Refresh data after editing
    } catch (e) {
      print('Error editing data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kelola Nilai Mata Kuliah'),
      ),
      body: ListView.builder(
        itemCount: nilaiMatkulList.length,
        itemBuilder: (context, index) {
          final nilaiMatkul = nilaiMatkulList[index];
          return ListTile(
            title: Text('${nilaiMatkul['nim']} - ${nilaiMatkul['nama_mhs']}'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Manajemen Proyek : ${nilaiMatkul['ip_manpro']}'),
                Text('Keamanan Siber : ${nilaiMatkul['ip_kamsi']}'),
                Text('E-Bussines : ${nilaiMatkul['ip_ebis']}'),
                Text('Pemrograman Mobile : ${nilaiMatkul['ip_mobile']}'),
                Text('Sistem Pendukung Keputusan : ${nilaiMatkul['ip_spk']}'),
                Text('PCVK : ${nilaiMatkul['ip_pcvk']}'),
                Text('Proyek 3 : ${nilaiMatkul['ip_proyek']}'),
                Text('IPS :  ${nilaiMatkul['ips']}'),
                Text('Status Akhir : ${nilaiMatkul['status']}'),
                // Tambahkan lebih banyak teks sesuai kebutuhan
              ],
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      // Show dialog for editing
                      showDialog(
                        context: context,
                        builder: (context) {
                          // Set masing-masing TextEditingController dengan nilai dari nilaiMatkul
                          ip_manproController?.text =
                              nilaiMatkul['ip_manpro'].toString();
                          ip_kamsiController?.text =
                              nilaiMatkul['ip_kamsi'].toString();
                          ip_ebisController?.text =
                              nilaiMatkul['ip_ebis'].toString();
                          ip_mobileController?.text =
                              nilaiMatkul['ip_mobile'].toString();
                          ip_spkController?.text =
                              nilaiMatkul['ip_spk'].toString();
                          ip_pcvkController?.text =
                              nilaiMatkul['ip_pcvk'].toString();
                          ip_proyekController?.text =
                              nilaiMatkul['ip_proyek'].toString();

                          return AlertDialog(
                            title: Text('Edit Data'),
                            content: Column(
                              children: [
                                // Tambahkan form atau input sesuai kebutuhan
                                TextField(
                                  controller: ip_manproController,
                                  decoration: InputDecoration(
                                      labelText: 'IP Manajemen Proyek'),
                                ),
                                TextField(
                                  controller: ip_kamsiController,
                                  decoration: InputDecoration(
                                      labelText: 'IP Keamanan Siber'),
                                ),
                                TextField(
                                  controller: ip_ebisController,
                                  decoration: InputDecoration(
                                      labelText: 'IP E-Business'),
                                ),
                                TextField(
                                  controller: ip_mobileController,
                                  decoration: InputDecoration(
                                      labelText: 'IP Pemrograman Mobile'),
                                ),
                                TextField(
                                  controller: ip_spkController,
                                  decoration:
                                      InputDecoration(labelText: 'IP SPK'),
                                ),
                                TextField(
                                  controller: ip_pcvkController,
                                  decoration:
                                      InputDecoration(labelText: 'IP PCVK'),
                                ),
                                TextField(
                                  controller: ip_proyekController,
                                  decoration:
                                      InputDecoration(labelText: 'IP Proyek'),
                                ),
                              ],
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () {
                                  // Implement logic untuk menyimpan perubahan data
                                  //saveEditedData();
                                  Navigator.pop(context);
                                },
                                child: Text('Save'),
                              ),
                            ],
                          );
                        },
                      );
                    })

                /*
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Delete Confirmation'),
                          content: Text(
                              'Are you sure you want to delete this data?'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                deleteData(nilaiMatkul['id']);
                                Navigator.pop(context);
                              },
                              child: Text('Delete'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
                */
              ],
            ),
          );
        },
      ),
    );
  }
}
