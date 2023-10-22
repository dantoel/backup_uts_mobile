import 'package:flutter/material.dart';

import 'detail_responden.dart';

class lihat_detail extends StatelessWidget {
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
                              "Detail Responden",
                              style: TextStyle(
                                  fontWeight: FontWeight.w900, fontSize: 25),
                            ),
                          ),
                          // ==================== Card ====================
                          GridView.count(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 1.5,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => detail_responden(
                                            data:
                                                "Academic Support and Resources")),
                                  );
                                },
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  elevation: 5,
                                  shadowColor: Colors.red,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 15),
                                        child: Text(
                                            "Academic Support and Resources",
                                            style: TextStyle(
                                              color: Colors.red[900],
                                              fontWeight: FontWeight.w800,
                                            ),
                                            textAlign: TextAlign.center),
                                      ),
                                      Expanded(
                                        child: Center(
                                          child: Text(
                                            "236",
                                            style: TextStyle(
                                              color: Colors.blue[800],
                                              fontWeight: FontWeight.w800,
                                              fontSize: 30,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => detail_responden(
                                            data: "Activities and Travelling")),
                                  );
                                },
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  elevation: 5,
                                  shadowColor: Colors.red,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 15),
                                        child: Text(
                                          "Activities and Travelling",
                                          style: TextStyle(
                                            color: Colors.red[900],
                                            fontWeight: FontWeight.w800,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      Expanded(
                                        child: Center(
                                          child: Text(
                                            "40",
                                            style: TextStyle(
                                              color: Colors.blue[800],
                                              fontWeight: FontWeight.w800,
                                              fontSize: 30,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => detail_responden(
                                            data: "Athletics and Sports")),
                                  );
                                },
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  elevation: 5,
                                  shadowColor: Colors.red,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 15),
                                        child: Text(
                                          "Athletics and Sports",
                                          style: TextStyle(
                                            color: Colors.red[900],
                                            fontWeight: FontWeight.w800,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      Expanded(
                                        child: Center(
                                          child: Text(
                                            "85",
                                            style: TextStyle(
                                              color: Colors.blue[800],
                                              fontWeight: FontWeight.w800,
                                              fontSize: 30,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => detail_responden(
                                            data: "Career Opportunities")),
                                  );
                                },
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  elevation: 5,
                                  shadowColor: Colors.red,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 15),
                                        child: Text(
                                          "Career Opportunities",
                                          style: TextStyle(
                                            color: Colors.red[900],
                                            fontWeight: FontWeight.w800,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      Expanded(
                                        child: Center(
                                          child: Text(
                                            "89",
                                            style: TextStyle(
                                              color: Colors.blue[800],
                                              fontWeight: FontWeight.w800,
                                              fontSize: 30,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => detail_responden(
                                            data: "Financial Support")),
                                  );
                                },
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  elevation: 5,
                                  shadowColor: Colors.red,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 15),
                                        child: Text(
                                          "Financial Support",
                                          style: TextStyle(
                                            color: Colors.red[900],
                                            fontWeight: FontWeight.w800,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      Expanded(
                                        child: Center(
                                          child: Text(
                                            "91",
                                            style: TextStyle(
                                              color: Colors.blue[800],
                                              fontWeight: FontWeight.w800,
                                              fontSize: 30,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => detail_responden(
                                            data: "Food and Cantines")),
                                  );
                                },
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  elevation: 5,
                                  shadowColor: Colors.red,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 15),
                                        child: Text(
                                          "Food and Cantines",
                                          style: TextStyle(
                                            color: Colors.red[900],
                                            fontWeight: FontWeight.w800,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      Expanded(
                                        child: Center(
                                          child: Text(
                                            "138",
                                            style: TextStyle(
                                              color: Colors.blue[800],
                                              fontWeight: FontWeight.w800,
                                              fontSize: 30,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => detail_responden(
                                            data:
                                                "Health and Well-being Support")),
                                  );
                                },
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  elevation: 5,
                                  shadowColor: Colors.red,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 15),
                                        child: Text(
                                          "Health and Well-being Support",
                                          style: TextStyle(
                                            color: Colors.red[900],
                                            fontWeight: FontWeight.w800,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      Expanded(
                                        child: Center(
                                          child: Text(
                                            "53",
                                            style: TextStyle(
                                              color: Colors.blue[800],
                                              fontWeight: FontWeight.w800,
                                              fontSize: 30,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => detail_responden(
                                            data:
                                                "Housing and Transportation")),
                                  );
                                },
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  elevation: 5,
                                  shadowColor: Colors.red,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 15),
                                        child: Text(
                                          "Housing and Transportation",
                                          style: TextStyle(
                                            color: Colors.red[900],
                                            fontWeight: FontWeight.w800,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      Expanded(
                                        child: Center(
                                          child: Text(
                                            "64",
                                            style: TextStyle(
                                              color: Colors.blue[800],
                                              fontWeight: FontWeight.w800,
                                              fontSize: 30,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => detail_responden(
                                            data:
                                                "International Students Experience")),
                                  );
                                },
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  elevation: 5,
                                  shadowColor: Colors.red,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 15),
                                        child: Text(
                                          "International Students Experience",
                                          style: TextStyle(
                                            color: Colors.red[900],
                                            fontWeight: FontWeight.w800,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      Expanded(
                                        child: Center(
                                          child: Text(
                                            "86",
                                            style: TextStyle(
                                              color: Colors.blue[800],
                                              fontWeight: FontWeight.w800,
                                              fontSize: 30,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => detail_responden(
                                            data: "Online Learning")),
                                  );
                                },
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  elevation: 5,
                                  shadowColor: Colors.red,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 15),
                                        child: Text(
                                          "Online Learning",
                                          style: TextStyle(
                                            color: Colors.red[900],
                                            fontWeight: FontWeight.w800,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      Expanded(
                                        child: Center(
                                          child: Text(
                                            "90",
                                            style: TextStyle(
                                              color: Colors.blue[800],
                                              fontWeight: FontWeight.w800,
                                              fontSize: 30,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => detail_responden(
                                            data: "Student Affairs")),
                                  );
                                },
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  elevation: 5,
                                  shadowColor: Colors.red,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 15),
                                        child: Text(
                                          "Student Affairs",
                                          style: TextStyle(
                                            color: Colors.red[900],
                                            fontWeight: FontWeight.w800,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      Expanded(
                                        child: Center(
                                          child: Text(
                                            "33",
                                            style: TextStyle(
                                              color: Colors.blue[800],
                                              fontWeight: FontWeight.w800,
                                              fontSize: 30,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
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
