// ignore_for_file: non_constant_identifier_names

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class TambahFormPage extends StatefulWidget {
  //final Item item;
  //TambahFormPage(this.item);

  @override
  TambahFormPageState createState() => TambahFormPageState();
}

class TambahFormPageState extends State<TambahFormPage> {
  //Item item;
  //TambahFormPageState(this.item);
  final dio = Dio();
  String url_domain = "http://192.168.1.18:8000";

  final _formKey = GlobalKey<FormState>();
  //int _id = 2000;
  String _genre = '';
  String _gender = '';
  int _age = 0;
  double _gpa = 0.0;
  int _year = 0;
  int _count = 0;
  String _nationality = '';
  String _report = '';

  TextEditingController genreCont = TextEditingController();
  TextEditingController ageCont = TextEditingController();
  TextEditingController genderCont = TextEditingController();
  TextEditingController gpaCont = TextEditingController();
  TextEditingController yearCont = TextEditingController();
  TextEditingController countCont = TextEditingController();
  TextEditingController nationalityCont = TextEditingController();
  TextEditingController reportCont = TextEditingController();

  // String url_count_responden = ;
  // String url_create_data = "${url_domain}api/create_data";
  // String url_show_data = "${url_domain}api/show_data";

  @override
  void initState() {
    super.initState();
  }

  Future<void> postData() async {
    try {
      Response response = await dio.post(
        '$url_domain/api/create_data',
        data: {
          'Genre': _genre,
          'Reports': _report,
          'Age': _age,
          'Gpa': _gpa,
          'Year': _year,
          'Count': _count,
          'Gender': _gender,
          'Nationality': _nationality,
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
    /*if (item != null) {
        genreCont.text = item.genre;
        ageCont.text = item.age.toString();
        genderCont.text = item.gender;
        gpaCont.text = item.gpa.toString();
        yearCont.text = item.year.toString();
        countCont.text = item.count.toString();
        nationalityCont.text = item.nationality;
        reportCont.text = item.report;
      }
      */
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Data'),
        centerTitle: true,
        backgroundColor: Colors.red[800],
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: 'Pilih Genre',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    hint: Text('Pilih Genre'),
                    value: _genre.isEmpty ? null : _genre,
                    onChanged: (newValue) {
                      setState(() {
                        _genre = newValue!;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select a genre';
                      }
                      return null;
                    },
                    items: <String>[
                      'Academic Support and Resources',
                      'Activities and Travelling',
                      'Athletics and sports',
                      'Career opportunities',
                      'Financial Support',
                      'Food and Cantines',
                      'Health and Well-being Support',
                      'Housing and Transportation',
                      'International student experiences',
                      'Online learning',
                      'Student Affairs'
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
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Age',
                            prefixIcon: Icon(Icons.perm_contact_calendar),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            int? parsedAge = int.tryParse(value);
                            if (parsedAge != null) {
                              setState(() {
                                _age = parsedAge;
                              });
                            }
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your age';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            labelText: 'Pilih Gender',
                            prefixIcon: Icon(Icons.person),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          hint: Text('Pilih Gender'),
                          value: _gender.isEmpty ? null : _gender,
                          onChanged: (newValue) {
                            setState(() {
                              _gender = newValue!;
                            });
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please select your gender';
                            }
                            return null;
                          },
                          items: <String>[
                            'L',
                            'P',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        child: Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'GPA',
                          prefixIcon: Icon(Icons.grade),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          double? parsedGpa = double.tryParse(value);
                          if (parsedGpa != null) {
                            setState(() {
                              _gpa = parsedGpa;
                            });
                          }
                        },

                        /* 
                        keyboardType: TextInputType.number,
                          onChanged: (value) {
                            int? parsedAge = int.tryParse(value);
                            if (parsedAge != null) {
                              setState(() {
                                _age = parsedAge;
                              });
                            }
                          },
                          */
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your GPA';
                          }
                          return null;
                        },
                      ),
                    )),
                    SizedBox(width: 20),
                    Expanded(
                        child: Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          labelText: 'Pilih Year',
                          prefixIcon: Icon(Icons.calendar_today),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        hint: Text('Pilih Year'),
                        value: _year == 0 ? null : _year.toString(),
                        onChanged: (newValue) {
                          setState(() {
                            _year = int.parse(newValue!);
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select a year';
                          }
                          return null;
                        },
                        items: <String>['1', '2', '3', '4', '5']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ))
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Count',
                      prefixIcon: Icon(Icons.calculate),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      int? parsedCount = int.tryParse(value);
                      if (parsedCount != null) {
                        setState(() {
                          _count = parsedCount;
                        });
                      }
                    },
                    /*
                    keyboardType: TextInputType.number,
                          onChanged: (value) {
                            int? parsedAge = int.tryParse(value);
                            if (parsedAge != null) {
                              setState(() {
                                _age = parsedAge;
                              });
                            }
                          },
                          */
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the count';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: 'Pilih Nationality',
                      prefixIcon: Icon(Icons.flag),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    hint: Text('Pilih Nationality'),
                    value: _nationality.isEmpty ? null : _nationality,
                    onChanged: (newValue) {
                      setState(() {
                        _nationality = newValue!;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select a nationality';
                      }
                      return null;
                    },
                    items: <String>[
                      'France',
                      'Indonesia',
                      'Mexico',
                      'Soudan',
                      'South Africa',
                      'Yemen'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
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
