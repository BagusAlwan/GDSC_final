import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:teamgdsc/pages/homepage.dart';
import 'package:teamgdsc/pages/registerpage.dart';
import 'package:teamgdsc/service/auth_service.dart';
import 'package:teamgdsc/service/datavase_service.dart';
import 'package:teamgdsc/widgets/widget.dart';

import '../helper/helper_function.dart';

class LoggingInPage extends StatefulWidget {
  const LoggingInPage({super.key});

  @override
  State<LoggingInPage> createState() => _LoggingInPageState();
}

class _LoggingInPageState extends State<LoggingInPage> {
  bool _isLoading = false;
  final formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  AuthService authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE2E2E2),
      appBar: AppBar(
        backgroundColor: Color(0xffE2E2E2),
        elevation: 0.0,
        leading: BackButton(color: Colors.white),
        toolbarHeight: 45,
      ),
      body: _isLoading ? Center(child: CircularProgressIndicator(color: Color(0xffD16EFF),),): Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              SizedBox(height: 36,),
              const Text(
                "Welcome back!",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                ),
              SizedBox(height: 25,),
              const Text(
                "We along with your studymates have missed you!",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Color(0xff545454)),
                ),
              SizedBox(height: 90,),
              Container(
                width: 328,
                height: 44,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,     
                ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "E-mail",
                      labelStyle: TextStyle(color: Color(0xffD16EFF), fontSize: 16, fontWeight: FontWeight.w500),
                      border: InputBorder.none,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffD16EFF), width: 2),
                          borderRadius: BorderRadius.circular(12)
                       ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffD16EFF), width: 2),
                          borderRadius: BorderRadius.circular(12)
                        ),
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffD16EFF), width: 2),
                          borderRadius: BorderRadius.circular(12)
                        ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        email = value;
                        print(email);
                      });
                    },
                    validator: (value) {
                       return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value!)? null : "Please enter a valid email";
                    },
                  ),
                ),  
              SizedBox(height: 31,),
              Container(
                width: 328,
                height: 44,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,     
                ),
                  child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Password",
                      labelStyle: TextStyle(color: Color(0xffD16EFF), fontSize: 16, fontWeight: FontWeight.w500),
                      border: InputBorder.none,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffD16EFF), width: 2),
                          borderRadius: BorderRadius.circular(12)
                       ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffD16EFF), width: 2),
                          borderRadius: BorderRadius.circular(12)
                        ),
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffD16EFF), width: 2),
                          borderRadius: BorderRadius.circular(12)
                        ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        password = value;
                        print(email);
                      });
                    },
                    validator: (val) {
                            if (val!.length < 8) {
                              return "Password must be at least 8 characters";
                            } else {
                              return null;
                            }
                          },
                  ),
                ), 
              SizedBox(height: 20,),
              Text(
                "Forgot password?",
                style: TextStyle(color: Color(0xff83ADFF), fontSize: 12, fontWeight: FontWeight.w700, decoration: TextDecoration.underline),
              ),
              SizedBox(height: 50,),
              GestureDetector(
                onTap: () {
                  login();
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
                            "Log in",
                            style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
              ),
              SizedBox(height: 34,),
              Text.rich(
                TextSpan(
                  text: "if you do not have an account yet, then ",
                  style: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.w400),
                  children: <TextSpan>[
                    TextSpan(
                      text: "sign up here.",
                      style: TextStyle(color: Color(0xff83ADFF), fontSize: 12, fontWeight: FontWeight.w700, decoration: TextDecoration.underline),
                      recognizer: TapGestureRecognizer()..onTap =() {
                        Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const RegisterPage()),
                      );
                      }
                    )
                  ]
                )
              )
            ],
          ),
        ),
      ),
      
    );
  }

  login() async {
    if(formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      await authService.loginWithEmailAndPassword(email, password).then(((value) async {
        if(value == true) {
          QuerySnapshot snapshot = await DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid).gettingUserData(email);
          //saving the value to our shareed preferences
          await HelperFunctions.saveUserLoggedInStatus(true);
          await HelperFunctions.saveUserEmailSF(email);
          Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
        }else{
          showSnackbar(context, Colors.red, value);
          setState(() {
            _isLoading = false;
          });
        }
      }));
    }
  }
}