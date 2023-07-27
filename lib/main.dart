import 'package:flutter/material.dart';
import 'package:go_jahit/pages/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  void _navigateToHome() {
    Future.delayed(
        Duration(
          seconds: 4,
        ), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => Login(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/bg.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Image.asset('assets/logo.png'),
      ),
    ));
  }
}
