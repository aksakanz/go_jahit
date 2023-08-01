import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_jahit/pages/tailorDashboard.dart';
import 'package:go_jahit/pages/userDashboard.dart';

import 'login.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<Map<String, dynamic>> getUserData(String uid) async {
    try {
      DocumentSnapshot snapshot =
          await _firestore.collection('users').doc(uid).get();
      return snapshot.data() as Map<String, dynamic>;
    } catch (e) {
      print("Error saat fetch user data: ${e.toString()}");
      return {};
    }
  }
}

class Dashboard extends StatefulWidget {
  final User? user;

  const Dashboard({
    super.key,
    required this.user,
  });

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String role = '';
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    AuthService().getUserData(widget.user!.uid).then((userData) {
      setState(() {
        role = userData['role'] ?? '';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (role == 'user') {
      return UserDashboard();
    } else {
      return TailorDashboard();
    }
  }
}
