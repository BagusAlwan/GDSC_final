import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:teamgdsc/helper/helper_function.dart';
import 'package:teamgdsc/pages/homepage.dart';
import 'package:teamgdsc/pages/logginginpage.dart';
import 'package:teamgdsc/service/auth_service.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
      body: _isLoading ? Center(child: CircularProgressIndicator(color: Color(0xffD16EFF),)) : Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 36),
              child: Text(
                "Welcome to lorem ipsum!",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700, ),
              ),
              
            ),
            SizedBox(height: 26,),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Text(
                "Join a community of more than oone people and find study partners for each other!",
                style: TextStyle(color: Color(0xff545454), fontSize: 16, fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(height: 84,),
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
                  SizedBox(height: 21,),
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
                SizedBox(height: 25,),
                Padding(
              padding: const EdgeInsets.only(left: 16, right: 53),
              child: Text(
                "Your password should contain at least 8 characters including at least 1 uppercase and 1 symbol.",
                style: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(height: 26,),
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
                      labelText: "Confirm password // blum ada function",
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
                GestureDetector(
                onTap: () {
                  register();
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
                            "Continue",
                            style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
              ),
              SizedBox(height: 35),
              Text.rich(
                TextSpan(
                  text: "if you do not have an account yet, then ",
                  style: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.w400),
                  children: <TextSpan>[
                    TextSpan(
                      text: "log in here.",
                      style: TextStyle(color: Color(0xff83ADFF), fontSize: 12, fontWeight: FontWeight.w700, decoration: TextDecoration.underline),
                      recognizer: TapGestureRecognizer()..onTap =() {
                        Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LoggingInPage()),
                      );
                      }
                    )
                  ]
                )
              )
          ],
        ),
      )
    );
  }
  register () async {
    if(formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      await authService.regiserUserWithEmailAndPassword(email, password).then(((value) async {
        if(value == true) {
          //saving the shared preference state
          await HelperFunctions.saveUserLoggedInStatus(true);
          await HelperFunctions.saveUserEmailSF(email);
          Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
        }else{
          setState(() {
            _isLoading = false;
          });
        }
      }));
    }
  }
}