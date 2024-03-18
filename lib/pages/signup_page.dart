import 'package:flutter/material.dart';
import 'package:insta_clone/pages/signin_page.dart';

import '../servise/utils_service.dart';

class SignupPage extends StatefulWidget {
  static final String id="signup_page";
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

var isLoading = false;
var fullnameController = TextEditingController();
var emailController = TextEditingController();
var passwordController = TextEditingController();
var cpasswordController = TextEditingController();

_doSignUp() async{
  String fullname = fullnameController.text.toString().trim();
  String email = emailController.text.toString().trim();
  String password = passwordController.text.toString().trim();
  String cpassword = cpasswordController.text.toString().trim();

  if (fullname.isEmpty || email.isEmpty || password.isEmpty) return;

  if (cpassword != password) {
    Utils.fireToast("Password and confirm password does not match");
    return;
  }
  setState(() {
    isLoading = true;
  });
}

_callSignInPage() {
  Navigator.pushReplacementNamed(context, SigninPage.id);
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromRGBO(193, 53, 132, 1),
                  Color.fromRGBO(131, 58, 180, 1),
                ]),
          ),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Instagram",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 45,
                                fontFamily: "Billabong"),
                          ),

                          //#fullname
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            height: 50,
                            padding: EdgeInsets.only(left: 10, right: 10),
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(7)),
                            child: TextField(
                              controller: fullnameController,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  hintText: "Fullname",
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                      fontSize: 17, color: Colors.white54)),
                            ),
                          ),

                          //#email
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            height: 50,
                            padding: EdgeInsets.only(left: 10, right: 10),
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(7)),
                            child: TextField(
                              controller: emailController,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  hintText: "Email",
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                      fontSize: 17, color: Colors.white54)),
                            ),
                          ),

                          //#password
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            height: 50,
                            padding: EdgeInsets.only(left: 10, right: 10),
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(7)),
                            child: TextField(
                              controller: passwordController,
                              obscureText: true,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  hintText: "Password",
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                      fontSize: 17, color: Colors.white54)),
                            ),
                          ),

                          //#cpassword
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            height: 50,
                            padding: EdgeInsets.only(left: 10, right: 10),
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(7)),
                            child: TextField(
                              controller: cpasswordController,
                              obscureText: true,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  hintText: "Confirm Password",
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                      fontSize: 17, color: Colors.white54)),
                            ),
                          ),

                          //#signin
                          GestureDetector(
                            onTap: () {
                              _doSignUp();
                            },
                            child: Container(
                                margin: EdgeInsets.only(top: 10),
                                height: 50,
                                padding: EdgeInsets.only(left: 10, right: 10),
                                decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(7)),
                                child: Center(
                                  child: Text(
                                    "Sign Up",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 17),
                                  ),
                                )),
                          ),
                        ],
                      )),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account?",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                            onTap: () {
                              _callSignInPage();
                            },
                            child: Text(
                              "Sign In",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
              isLoading
                  ? Center(
                child: CircularProgressIndicator(),
              )
                  : SizedBox.shrink(),
            ],
          )),
    );
  }
}
