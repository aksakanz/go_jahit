import 'package:flutter/material.dart';
import 'package:go_jahit/pages/tailorDashboard.dart';
import 'package:go_jahit/pages/tailorProfile.dart';
import 'package:go_jahit/pages/userDashboard.dart';
import 'package:go_jahit/pages/userProfile.dart';

class ReceiveOrder extends StatefulWidget {
  const ReceiveOrder({super.key});

  @override
  State<ReceiveOrder> createState() => _ReceiveOrderState();
}

class _ReceiveOrderState extends State<ReceiveOrder> {
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
          Container(
            margin: EdgeInsets.fromLTRB(10, 100, 10, 0),
            width: 410,
            height: 500,
            color: Colors.white,
            child: Column(
              children: [
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      "Transaksi yang sedang berlangsung",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: ListTile(
                    leading: Icon(
                      Icons.receipt_long,
                      color: Colors.green,
                    ),
                    title: Text(
                      "Telah Diantar",
                      style: TextStyle(
                        color: Colors.green,
                      ),
                    ),
                    trailing: Icon(Icons.remove_red_eye_sharp),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 0),
                  child: ListTile(
                    leading: Icon(
                      Icons.receipt_long,
                      color: Colors.green,
                    ),
                    title: Text(
                      "Telah Diantar",
                      style: TextStyle(
                        color: Colors.green,
                      ),
                    ),
                    trailing: Icon(Icons.remove_red_eye_sharp),
                  ),
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
                            color: Colors.black,
                            size: 35,
                          ),
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => TailorDashboard(),
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
                            Icons.person_2_outlined,
                            color: Colors.black,
                            size: 35,
                          ),
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => TailorProfile(),
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
        ],
      ),
    );
  }
}
