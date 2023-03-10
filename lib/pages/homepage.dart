import 'package:flutter/material.dart';
import 'package:teamgdsc/pages/loginpage.dart';
import 'package:teamgdsc/service/auth_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AuthService authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child:
          ElevatedButton(child: Text("LogOut"), onPressed: () {
            authService.signOut();
            Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
          },)
        ),
    );
  }
}