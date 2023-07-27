import 'package:flutter/material.dart';

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
                builder: (context) => _userAuthMethod(),
              ),
            );
          },
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(50, 350, 50, 0),
                height: 200,
                width: 400,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xFFD9E399),
                ),
                child: Image.asset('assets/tailorLogo.png'),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(70, 530, 50, 0),
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
                    print('asdasd');
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
                  onPressed: () {},
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
                  onPressed: () {},
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
                  onPressed: () {},
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
                  onPressed: () {},
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
                  onPressed: () {},
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
