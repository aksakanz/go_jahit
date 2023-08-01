import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_jahit/pages/takeOrder.dart';
import 'package:go_jahit/pages/userProfile.dart';

class UserDashboard extends StatefulWidget {
  const UserDashboard({super.key});

  @override
  State<UserDashboard> createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  User? user;
  String? nama;

  @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      _fetchUserDetail();
    }
  }

  Future<void> _fetchUserDetail() async {
    try {
      DocumentSnapshot<Map<String, dynamic>> userDocSnapshot =
          await FirebaseFirestore.instance
              .collection('users')
              .doc(user!.uid)
              .get();
      if (userDocSnapshot.exists) {
        setState(() {
          nama = userDocSnapshot.data()!['nama'];
        });
      } else {
        print('Dokumen tidak ditemukan');
      }
    } catch (e) {
      print('Error saat mengambil detail pengguna : $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/bg.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(15),
            child: Column(
              children: [
                Center(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                    height: 100,
                    width: 500,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.circular(20), // Menentukan radius sudut
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            left: 20,
                            top: 10,
                          ),
                          child: Text(
                            'Hello...',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            left: 20,
                            top: 5,
                          ),
                          child: nama != null
                              ? Text('$nama')
                              : Text(
                                  'Nama tidak valid',
                                  style: TextStyle(
                                    color: Colors.red,
                                  ),
                                ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(290, 60, 0, 0),
            width: 70,
            height: 70,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  )
                ]),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => UserProfile(),
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.fromLTRB(293, 63, 0, 0),
              width: 65,
              height: 65,
              decoration: BoxDecoration(
                color: Color(0xFFE8DBDB),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset('assets/personProfile.png'),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10, 160, 0, 0),
            child: Text(
              "Category",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 200,
            ),
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                  top: 5,
                                ),
                                width: 95,
                                height: 70,
                                decoration: BoxDecoration(
                                  color: Color(0xFFCF687D),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Image.asset('assets/trouser.png'),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                "Trousers",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                  top: 5,
                                ),
                                width: 95,
                                height: 70,
                                decoration: BoxDecoration(
                                  color: Color(0xFF413535).withOpacity(0.77),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Image.asset('assets/shirts.png'),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                "Shirt",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                  top: 5,
                                ),
                                width: 95,
                                height: 70,
                                decoration: BoxDecoration(
                                  color: Color(0xFFE7E7E7),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Image.asset('assets/dress.png'),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                "Dresses",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                  top: 5,
                                ),
                                width: 95,
                                height: 70,
                                decoration: BoxDecoration(
                                  color: Color(0xFF413535).withOpacity(0.77),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Image.asset('assets/shirts.png'),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                "Shirt",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10, 320, 0, 0),
            child: Text(
              "Popular Tailor",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10, 340, 0, 0),
            width: 375,
            child: ListView(
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: 375,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            left: 10,
                            top: 5,
                          ),
                          width: 140,
                          height: 140,
                          decoration: BoxDecoration(
                            color: Color(0xFFDDE1FF),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Image.asset('assets/shirts.png'),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            top: 10,
                          ),
                          child: Column(
                            children: [
                              Text(
                                "Ruslan Tailor",
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                      ),
                                    ],
                                  ),
                                  Text("5.0  (403)"),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    color: Colors.red,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text("900 m")
                                ],
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child:
                                    Text("Jl. Kranggan No.1, \nRT.001/RW.007"),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: 375,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            left: 10,
                            top: 5,
                          ),
                          width: 140,
                          height: 140,
                          decoration: BoxDecoration(
                            color: Color(0xFFFF9F92),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Image.asset('assets/dress.png'),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            top: 10,
                          ),
                          child: Column(
                            children: [
                              Text(
                                "Rifa Tailor",
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                      ),
                                    ],
                                  ),
                                  Text("5.0  (300)"),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    color: Colors.red,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text("500 m")
                                ],
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child:
                                    Text("Jl. Harapan Indah, \nRT.010/RW.017"),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: 375,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            left: 10,
                            top: 5,
                          ),
                          width: 140,
                          height: 140,
                          decoration: BoxDecoration(
                            color: Color(0xFFE7E7E7),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Image.asset('assets/trouser.png'),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            top: 10,
                          ),
                          child: Column(
                            children: [
                              Text(
                                "Grow up Tailor",
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.grey,
                                      ),
                                    ],
                                  ),
                                  Text("4.0  (99)"),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    color: Colors.red,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text("1000 m")
                                ],
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text("Jl. Menara Republika Indonesia"),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 630),
              width: 300,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white.withOpacity(0.5),
              ),
              child: Container(
                margin: EdgeInsets.only(
                  left: 20,
                ),
                child: Row(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.home_outlined,
                            color: Colors.blue,
                            size: 35,
                          ),
                          onPressed: () {},
                        ),
                        SizedBox(
                          width: 55,
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.shopping_bag_outlined,
                            color: Colors.black,
                            size: 35,
                          ),
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => TakeOrder(),
                              ),
                            );
                          },
                        ),
                        SizedBox(
                          width: 55,
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.person_2_outlined,
                            color: Colors.black,
                            size: 35,
                          ),
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => UserProfile(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red,
              ),
              margin: EdgeInsets.fromLTRB(170, 660, 0, 0),
              child: Center(
                child: Text(
                  '1',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
