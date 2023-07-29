import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dashboard.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Greeting(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Greeting extends StatefulWidget {
  const Greeting({super.key});

  @override
  State<Greeting> createState() => _GreetingState();
}

class _GreetingState extends State<Greeting> {
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Image.asset('assets/logo.png'),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Memberikan solusi untuk menjahit secara Online dengan mudah dan cepat!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => _selectRole(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    primary: Colors.green,
                    minimumSize: Size(200, 50),
                  ),
                  child: Text("Next"),
                ),
              ],
            )));
  }
}

class _selectRole extends StatefulWidget {
  const _selectRole({super.key});

  @override
  State<_selectRole> createState() => __selectRoleState();
}

class __selectRoleState extends State<_selectRole> {
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
        Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => _userAuthMethod(),
                  ),
                );
              },
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(50, 50, 50, 0),
                    height: 200,
                    width: 400,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xFFB6E4B5),
                    ),
                    child: Image.asset('assets/userLogo.png'),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(70, 230, 50, 0),
                    height: 65,
                    width: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text("Pengguna"),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Pilih ini jika ingin mencari penjahit")
                      ],
                    ),
                  )
                ],
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => _tailorAuthMethod(),
                  ),
                );
              },
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(50, 50, 50, 0),
                    height: 200,
                    width: 400,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xFFD9E399),
                    ),
                    child: Image.asset('assets/tailorLogo.png'),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(70, 230, 50, 0),
                    height: 65,
                    width: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text("Penjahit"),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Pilih ini jika ingin mendaftar penjahit")
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        )
      ],
    ));
  }
}

class _userAuthMethod extends StatefulWidget {
  const _userAuthMethod({super.key});

  @override
  State<_userAuthMethod> createState() => __userAuthMethodState();
}

class __userAuthMethodState extends State<_userAuthMethod> {
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
        Padding(
          padding: EdgeInsets.fromLTRB(10, 30, 0, 0),
          child: IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => _selectRole(),
                ),
              );
            },
            icon: Icon(Icons.chevron_left),
            color: Colors.white,
            iconSize: 40,
          ),
        ),
        Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/userLogo.png'),
            SizedBox(
              height: 20,
            ),
            Image.asset('assets/logo.png'),
            SizedBox(
              height: 10,
            ),
            Text(
              "Pengguna",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => _singinMethod(),
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
                  child: Text("Sign in"),
                ),
                SizedBox(
                  width: 40,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => _signUpMethodUser(),
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
                  child: Text("Sign up"),
                ),
              ],
            )
          ],
        ))
      ],
    ));
  }
}

class _tailorAuthMethod extends StatefulWidget {
  const _tailorAuthMethod({super.key});

  @override
  State<_tailorAuthMethod> createState() => __tailorAuthMethodState();
}

class __tailorAuthMethodState extends State<_tailorAuthMethod> {
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
        Padding(
          padding: EdgeInsets.fromLTRB(10, 30, 0, 0),
          child: IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => _selectRole(),
                ),
              );
            },
            icon: Icon(Icons.chevron_left),
            color: Colors.white,
            iconSize: 40,
          ),
        ),
        Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/tailorLogo.png'),
            SizedBox(
              height: 20,
            ),
            Image.asset('assets/logo.png'),
            SizedBox(
              height: 10,
            ),
            Text(
              "Pengguna",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => _singinMethod(),
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
                  child: Text("Sign in"),
                ),
                SizedBox(
                  width: 40,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => _signUpMethodUser(),
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
                  child: Text("Sign up"),
                ),
              ],
            )
          ],
        ))
      ],
    ));
  }
}

class _singinMethod extends StatefulWidget {
  const _singinMethod({super.key});

  @override
  State<_singinMethod> createState() => __singinMethodState();
}

class __singinMethodState extends State<_singinMethod> {
  bool _obscureText = true;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController emailLogin = TextEditingController();
  TextEditingController passLogin = TextEditingController();

  Future<void> login() async {
    try {
      String email = emailLogin.text;
      String password = passLogin.text;
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailLogin.text,
        password: passLogin.text,
      );
      User? user = userCredential.user;
      if (user != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Dashboard(user: user),
          ),
        );
        await user.displayName;
      }
    } catch (e) {}
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
        Padding(
          padding: EdgeInsets.fromLTRB(10, 30, 0, 0),
          child: IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => _selectRole(),
                ),
              );
            },
            icon: Icon(Icons.chevron_left),
            color: Colors.white,
            iconSize: 40,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  Image.asset('assets/logo.png'),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Pengguna",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Email address",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 19,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: emailLogin,
                    decoration: InputDecoration(
                      hintText: 'example@email.com',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    cursorColor: Colors.black,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Password",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 19,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: passLogin,
                    obscureText: _obscureText,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        suffixIcon: IconButton(
                          icon: _obscureText
                              ? Icon(Icons.visibility_off)
                              : Icon(Icons.visibility),
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        )),
                    cursorColor: Colors.black,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Center(
                    child: Container(
                      width: 400,
                      child: ElevatedButton(
                        onPressed: () {
                          if (emailLogin.text.isNotEmpty &&
                              passLogin.text.length > 6) {
                            login();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          primary: Colors.green,
                          minimumSize: Size(100, 50),
                        ),
                        child: Text("Login"),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have account?",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              "Sign up",
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 20,
                              ),
                            ))
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ],
    ));
  }
}

class _signUpMethodUser extends StatefulWidget {
  const _signUpMethodUser({super.key});

  @override
  State<_signUpMethodUser> createState() => _signUpMethodUserState();
}

class _signUpMethodUserState extends State<_signUpMethodUser> {
  bool _obscureText = true;
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  TextEditingController _nameRegist = TextEditingController();
  TextEditingController _emailRegist = TextEditingController();
  TextEditingController _passRegist = TextEditingController();

  void _regist() async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: _emailRegist.text,
        password: _passRegist.text,
      );
      if (userCredential.user != null) {
        await _firestore.collection('users').doc(userCredential.user!.uid).set({
          'nama': _nameRegist.text,
          'email': _emailRegist.text,
          'password': _passRegist.text,
          'role': 'user',
        });
      }
    } catch (e) {
      print("Error saat mendaftar : ${e.toString()}");
    }
  }

  @override
  Widget build(BuildContext context) {
    FirebaseAuth _auth = FirebaseAuth.instance;

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
        Padding(
          padding: EdgeInsets.fromLTRB(10, 30, 0, 0),
          child: IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => _selectRole(),
                ),
              );
            },
            icon: Icon(Icons.chevron_left),
            color: Colors.white,
            iconSize: 40,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  Image.asset('assets/logo.png'),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Pengguna",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Name",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 19,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _nameRegist,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: 'Your name',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    cursorColor: Colors.black,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Email address",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 19,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _emailRegist,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'example@email.com',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    cursorColor: Colors.black,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Password",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 19,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _passRegist,
                    obscureText: _obscureText,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        suffixIcon: IconButton(
                          icon: _obscureText
                              ? Icon(Icons.visibility_off)
                              : Icon(Icons.visibility),
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        )),
                    cursorColor: Colors.black,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Center(
                    child: Container(
                      width: 400,
                      child: ElevatedButton(
                        onPressed: () {
                          _regist();
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          primary: Colors.green,
                          minimumSize: Size(100, 50),
                        ),
                        child: Text("Sign up"),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    ));
  }
}
