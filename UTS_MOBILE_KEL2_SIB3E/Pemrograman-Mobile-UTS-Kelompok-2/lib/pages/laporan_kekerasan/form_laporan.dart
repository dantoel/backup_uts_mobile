import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class FormLaporan extends StatefulWidget {
  //final Item item;
  //FormLaporan(this.item);

  @override
  FormLaporanState createState() => FormLaporanState();
}

class FormLaporanState extends State<FormLaporan> {
  late String _filePath; // Menyimpan path file yang dipilih

// Widget upload file
  // Widget _buildFilePicker() {
  //   return TextFormField(
  //     decoration: InputDecoration(
  //       labelText: 'Pilih File',
  //       prefixIcon: Icon(Icons.file_upload),
  //       border: OutlineInputBorder(
  //         borderRadius: BorderRadius.circular(5.0),
  //       ),
  //     ),
  //     readOnly: true,
  //     onTap: () async {
  //       FilePickerResult? result = await FilePicker.platform.pickFiles();

  //       if (result != null) {
  //         setState(() {
  //           _filePath = result.files.single.path!;
  //         });
  //       }
  //     },
  //   );
  // }

  final dio = Dio();
  String url_domain = "http://192.168.1.6:8000";

  final _formKey = GlobalKey<FormState>();

  int _nim = 0;
  String _nama = '';
  int _telepon = 0;
  String _Jenis = '';
  String _report = '';

  TextEditingController nimCont = TextEditingController();
  TextEditingController namaCont = TextEditingController();
  TextEditingController JenisCont = TextEditingController();
  TextEditingController teleponCont = TextEditingController();
  TextEditingController reportCont = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  Future<void> postData() async {
    try {
      Response response = await dio.post(
        '$url_domain/api/create_data',
        data: {
          'Jenis': _Jenis,
          'Reports': _report,
        },
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Berhasil menyimpan data'),
          ),
        );
        // Reset form
        _formKey.currentState!.reset();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Gagal menyimpan data'),
          ),
        );
      }
    } catch (e) {
      print('Terjadi kesalahan: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Terjadi kesalahan: $e'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Laporan Kekerasan'),
        centerTitle: true,
        backgroundColor: Colors.red[800],
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 10),
                Text(
                  "Informasi Pribadi",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'NIM',
                      prefixIcon: Icon(Icons.perm_device_information_rounded),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      int? parsednim = int.tryParse(value);
                      if (parsednim != null) {
                        setState(() {
                          _nim = parsednim;
                        });
                      }
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your nim';
                      }
                      return null;
                    },
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Nama',
                      prefixIcon: Icon(Icons.perm_identity),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    onChanged: (value) {
                      setState(() {
                        _nama = value;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the your name';
                      }
                      return null;
                    },
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Telepon',
                      prefixIcon: Icon(Icons.phone_android),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      int? parsedtelepon = int.tryParse(value);
                      if (parsedtelepon != null) {
                        setState(() {
                          _telepon = parsedtelepon;
                        });
                      }
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the telepon number';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 20),
                //
                Text(
                  "Laporan Pengguna",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: 'Pilih Jenis',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    hint: Text('Pilih Jenis Laporan'),
                    value: _Jenis.isEmpty ? null : _Jenis,
                    onChanged: (newValue) {
                      setState(() {
                        _Jenis = newValue!;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select a Jenis Laporan';
                      }
                      return null;
                    },
                    items: <String>[
                      'Pelecehan seksual',
                      'Kekerasan',
                      'Pencemaran nama baik',
                      'Penghinaan',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.category,
                              color: Colors.black45,
                            ),
                            SizedBox(width: 10),
                            Text(value),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Report',
                      prefixIcon: Icon(Icons.report),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    onChanged: (value) {
                      setState(() {
                        _report = value;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the report';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 20),
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Konfirmasi'),
                              content: Text('Apakah anda yakin?'),
                              actions: <Widget>[
                                TextButton(
                                  child: Text('Batal'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                TextButton(
                                  child: Text('Ya'),
                                  onPressed: () {
                                    postData();

                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text('Processing Data')),
                                    );
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red[800],
                      padding: const EdgeInsets.all(15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      "Submit",
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
        ),
      ),
    );
  }
}
