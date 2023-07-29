import 'package:flutter/material.dart';
import 'package:go_jahit/pages/userDashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
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
              child: ListView(
                children: [
                  Center(
                    child: InkWell(
                      onTap: () {
                        print("eh kepencet");
                      },
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
                    title: Text("Nama"),
                  ),
                  ListTile(
                    leading: Icon(Icons.phone),
                    title: Text("+62 123 456 189"),
                  ),
                  ListTile(
                    leading: Icon(Icons.email),
                    title: Text(FirebaseAuth.instance.currentUser!.email!),
                  ),
                  ListTile(
                    leading: Icon(Icons.male),
                    title: Text("Unknown"),
                  ),
                  ListTile(
                    leading: Icon(Icons.location_city),
                    title: Text("Alamat"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
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
                          //Navigator.of(context).pushReplacement(
                          //  MaterialPageRoute(
                          //    builder: (context) => _singinMethod(),
                          //  ),
                          //);
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
        ],
      ),
    );
  }
}
