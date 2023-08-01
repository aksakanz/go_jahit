import 'package:flutter/material.dart';
import 'package:go_jahit/pages/userDashboard.dart';
import 'package:go_jahit/pages/userProfile.dart';

class TakeOrder extends StatefulWidget {
  const TakeOrder({super.key});

  @override
  State<TakeOrder> createState() => _TakeOrderState();
}

class _TakeOrderState extends State<TakeOrder> {
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
                      color: Color.fromARGB(255, 126, 113, 2),
                    ),
                    title: Text(
                      "Sedang Dikerjakan",
                      style: TextStyle(
                        color: Color.fromARGB(255, 126, 113, 2),
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
