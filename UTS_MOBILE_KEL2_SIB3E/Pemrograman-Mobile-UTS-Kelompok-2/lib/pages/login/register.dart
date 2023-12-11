import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:survey_komplain/pages/login/login.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  final _nimController = TextEditingController();
  final _namaController = TextEditingController();
  final _nomorTeleponController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  final dio = Dio();
  String url_domain = "http://192.168.1.18:8000";

  int _nim = 0;
  String _nama = '';
  int _telepon = 0;
  String _email = '';
  String _password = '';

  Future<void> register() async {
    try {
      Response response = await dio.post(
        '$url_domain/api/register',
        data: {
          'nim': _nim,
          'nama': _nama,
          'nomor_telepon': _telepon,
          'email': _email,
          'password': _password,
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
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive, overlays: []);
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(color: Colors.red[800]),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Image.asset("assets/judul.png"),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                width: 300,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.white,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // Form Components
                      Text(
                        "Register",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8.0),
                              bottomLeft: Radius.circular(8.0),
                            ),
                            child: Container(
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => LoginPage(),
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.amber[700],
                                ),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10),
                                  child: Text("Login"),
                                ),
                              ),
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(8.0),
                              bottomRight: Radius.circular(8.0),
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {}
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.red,
                              ),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                child: Text("Register"),
                              ),
                            ),
                          ),
                        ],
                      ),

                      TextFormField(
                        //controller: _nimController,
                        decoration: InputDecoration(
                          labelText: "Masukkan NIM",
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
                            return 'Please enter your NIM';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        //controller: _namaController,
                        decoration: InputDecoration(
                          labelText: "Masukkan Nama",
                        ),
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
                      TextFormField(
                        //controller: _nomorTeleponController,
                        decoration: InputDecoration(
                          labelText: "Masukkan Nomor Telepon",
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
                      TextFormField(
                        //controller: _emailController,
                        decoration: InputDecoration(
                          labelText: "Masukkan E-mail",
                        ),
                        keyboardType: TextInputType.multiline,
                        onChanged: (value) {
                          setState(() {
                            _email = value;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          } else if (!value.contains('@')) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          labelText: "Password",
                        ),
                        keyboardType: TextInputType.multiline,
                        obscureText: true,
                        onChanged: (value) {
                          setState(() {
                            _password = value;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a password';
                          }
                          return null;
                        },
                      ),
                      /*
                      TextFormField(
                        //controller: _confirmPasswordController,
                        decoration: InputDecoration(
                          labelText: "Confirm Password",
                        ),
                        keyboardType: TextInputType.multiline,
                        obscureText: true,
                        onChanged: (value) {
                          setState(() {
                            _password = value;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a password';
                          } else if (value != _passwordController.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                      ), */
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState?.validate() ?? false) {
                              // TODO: Process registration
                              register();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            primary:
                                Colors.red, // Set your desired background color
                            textStyle: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color:
                                  Colors.white, // Set your desired text color
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 30),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text("Register"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
