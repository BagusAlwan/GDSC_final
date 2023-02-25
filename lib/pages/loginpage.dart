import 'package:flutter/material.dart';
import 'package:teamgdsc/pages/logginginpage.dart';
import 'package:teamgdsc/pages/registerpage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE2E2E2),
      body:Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80) ,
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 9),
                    child: const Text(
                      "[APP NAME/LOGO]",
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                      ),
                  ),
                  
                ),
                SizedBox(height:  40 ,),
                const Text(
                  "Description yadda yadda",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),
                SizedBox(height: 30,),
                Container(
                  width: 245,
                  height: 245,
                  decoration: BoxDecoration(
                    color: Color(0xffD9D9D9)
                  ),
                  child: Center(
                    child: Text(
                      "Business style image and stuff",
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                  ),
                ),
                SizedBox(height: 19,),
                GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const RegisterPage()),
                      );
                  },
                  child: Container(
                    width: 328,
                    height: 44,
                    decoration: BoxDecoration(
                      color: Color(0xffAE5CD4),
                      borderRadius: BorderRadius.circular(12)
                    ),
                    child: Center(
                      child: Text(
                        "Join the Community",
                        style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 22,),
                GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LoggingInPage()),
                      );
                  },
                  child: Container(
                    width: 328,
                    height: 44,
                    decoration: BoxDecoration(
                      color: Color(0xff6D90D4),
                      borderRadius: BorderRadius.circular(12)
                    ),
                    child: Center(
                      child: Text(
                        "Log in",
                        style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 31,),
                Center(
                  child: Text(
                    "or",
                    style: TextStyle(color: Color(0xff6F6F6F), fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(height: 35,),
                Container(
                  width: 328,
                  height: 44,
                  decoration: BoxDecoration(
                    color: Color(0xff6D90D4),
                    borderRadius: BorderRadius.circular(12)
                  ),
                  child: Center(
                    child: Text(
                      "Continue with Google",
                      style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ],
            ), 
          ), ),
    );
  }
}