import 'package:flutter/material.dart';
import 'package:go_jahit/pages/userDashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:go_jahit/pages/userProfile.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  User? user;
  Map<String, dynamic>? _userData;
  TextEditingController nama = TextEditingController();
  TextEditingController telp = TextEditingController();
  TextEditingController jk = TextEditingController();
  TextEditingController alamat = TextEditingController();

  @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      _fetchUserDetails();
    }
  }

  Future<void> _fetchUserDetails() async {
    try {
      DocumentSnapshot<Map<String, dynamic>> userDocSnapshot =
          await FirebaseFirestore.instance
              .collection('users')
              .doc(user!.uid)
              .get();

      if (userDocSnapshot.exists) {
        setState(() {
          _userData = userDocSnapshot.data();
          nama.text = _userData!['nama'] ?? '';
          telp.text = _userData!['telp'] ?? '';
          jk.text = _userData!['jk'] ?? '';
          alamat.text = _userData!['alamat'] ?? '';
        });
      } else {
        print('Dokumen pengguna tidak ditemukan');
      }
    } catch (e) {
      print('Terjadi kesalahan saat mengambil detail pengguna: $e');
    }
  }

  Future<void> _updateUserDetail() async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user!.uid)
          .update({
        'nama': nama.text.trim(),
        'telp': telp.text.trim(),
        'jk': jk.text.trim(),
        'alamat': alamat.text.trim(),
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error saat memperbaharui: $e')));
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
          Center(
            child: Container(
              margin: EdgeInsets.only(
                bottom: 600,
              ),
              child: Image.asset('assets/logo.png'),
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(bottom: 50),
              height: 500,
              width: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: _userData != null
                  ? ListView(
                      children: [
                        Center(
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                              width: 65,
                              height: 65,
                              decoration: BoxDecoration(
                                color: Color(0xFFE8DBDB),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Image.asset('assets/personProfile.png'),
                            ),
                          ),
                        ),
                        ListTile(
                          leading: Icon(Icons.person),
                          title: TextFormField(
                            controller: nama,
                            decoration: InputDecoration(
                              hintText: '${_userData!['nama']}',
                            ),
                          ),
                        ),
                        ListTile(
                          leading: Icon(Icons.phone),
                          title: TextFormField(
                            controller: telp,
                            decoration: InputDecoration(
                              hintText: "${_userData!['telp']}",
                            ),
                          ),
                        ),
                        ListTile(
                          leading: Icon(Icons.email),
                          title:
                              Text(FirebaseAuth.instance.currentUser!.email!),
                        ),
                        ListTile(
                          leading: Icon(Icons.male),
                          title: TextFormField(
                            controller: jk,
                            decoration: InputDecoration(
                              hintText: '${_userData!['jk']}',
                            ),
                          ),
                        ),
                        ListTile(
                          leading: Icon(Icons.location_city),
                          title: TextFormField(
                            controller: alamat,
                            decoration: InputDecoration(
                              hintText: '${_userData!['alamatsimpel']}',
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                _updateUserDetail();
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (context) => UserProfile(),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                primary: Colors.green,
                                minimumSize: Size(100, 50),
                              ),
                              child: Text("Save"),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (context) => UserProfile(),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                primary: Colors.red,
                                minimumSize: Size(100, 50),
                              ),
                              child: Text("Cancel"),
                            ),
                          ],
                        )
                      ],
                    )
                  : Center(
                      child: CircularProgressIndicator(),
                    ),
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
                            color: Colors.black,
                            size: 35,
                          ),
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => UserDashboard(),
                              ),
                            );
                          },
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
                          onPressed: () {},
                        ),
                        SizedBox(
                          width: 55,
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.person_2_outlined,
                            color: Colors.blue,
                            size: 35,
                          ),
                          onPressed: () {},
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
