import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:survey_komplain/pages/login/login.dart';
import 'package:survey_komplain/pages/survey/home.dart';
import 'package:survey_komplain/pages/homeasli.dart';

class login_admin extends StatefulWidget {
  const login_admin({Key? key}) : super(key: key);

  @override
  State<login_admin> createState() => _login_adminState();
}

final dio = Dio();
String url_domain = "http://192.168.0.109:8000";

String _email = '';
String _password = '';

class _login_adminState extends State<login_admin> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<void> login() async {
    try {
      Response response = await dio.post(
        '$url_domain/api/login',
        data: {
          'email': _email,
          'password': _password,
        },
      );

      if (response.statusCode == 200) {
        //Map<String, dynamic> responseData = response.data;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Berhasil Login'),
          ),
        );

        // Reset form or any other actions upon successful login
        _formKey.currentState!.reset();

        // You can use the response data to make further decisions
        // For example, check if the response contains a token or user information
        // and store it in a global state for future use

        // Navigate to the HomePage
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            //ubah
            builder: (_) => Homeasli(),
          ),
        );
      } else if (response.statusCode == 404) {
        //Map<String, dynamic> responseData = response.data;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Email Tidak Ditemukan'),
          ),
        );
      } else if (response.statusCode == 401) {
        //Map<String, dynamic> responseData = response.data;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Password Salah'),
          ),
        );
      } else {
        // Handle other status codes
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Gagal login. Silakan coba lagi.'),
          ),
        );
      }
    } catch (e) {
      print('Terjadi kesalahan: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Terjadi kesalahan. Silakan coba lagi.'),
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
                        "Login Admin",
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
                                  primary: Colors.red,
                                ),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 2),
                                  child: Text("Login Mhs"),
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
                                primary: Colors.amber[700],
                              ),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 2),
                                child: Text("Login Admin"),
                              ),
                            ),
                          ),
                        ],
                      ),

                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          labelText: "Email",
                        ),
                        keyboardType: TextInputType.multiline,
                        onChanged: (value) {
                          setState(() {
                            _email = value;
                          });
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                      ),

                      TextFormField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          labelText: "Password",
                        ),
                        obscureText: true,
                        keyboardType: TextInputType.multiline,
                        onChanged: (value) {
                          setState(() {
                            _password = value;
                          });
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a password';
                          }
                          return null;
                        },
                      ),

                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: ElevatedButton(
                          onPressed: () async {
                            // Validate the form first
                            if (_formKey.currentState?.validate() ?? false) {
                              try {
                                // Call the login method
                                await login();

                                // If login is successful, navigate to the HomePage
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => Homeasli(),
                                  ),
                                );
                              } catch (error) {
                                print('Error: $error');
                                // Handle login error if needed
                              }
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red,
                            textStyle: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            padding: EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 30,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text("Login"),
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
