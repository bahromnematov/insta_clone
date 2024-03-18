import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:insta_clone/pages/home_page.dart';
import 'package:insta_clone/pages/signup_page.dart';

class SigninPage extends StatefulWidget {
  static final String id = "signin_page";

  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  var isLoading = false;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  _doSignIn() {
    String email = emailController.text.toString().trim();
    String password = passwordController.text.toString().trim();
    if (email.isEmpty || password.isEmpty) return;
    Navigator.pushReplacementNamed(context, HomePage.id);
    setState(() {
      isLoading = true;
    });
  }

  _callSignUpPage() {
    Navigator.pushReplacementNamed(context, SignupPage.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
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
                    const Text(
                      "Instagram",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 45,
                          fontFamily: "Billabong"),
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
                            hintStyle:
                                TextStyle(fontSize: 17, color: Colors.white54)),
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
                        decoration: const InputDecoration(
                            hintText: "Password",
                            border: InputBorder.none,
                            hintStyle:
                                TextStyle(fontSize: 17, color: Colors.white54)),
                      ),
                    ),

                    //#signin
                    GestureDetector(
                      onTap: () {
                        _doSignIn();
                      },
                      child: Container(
                          margin: EdgeInsets.only(top: 10),
                          height: 50,
                          padding: EdgeInsets.only(left: 10, right: 10),
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(7)),
                          child: const Center(
                            child: Text(
                              "Sign In",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 17),
                            ),
                          )),
                    ),
                  ],
                )),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don`t have an account?",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                          onTap: () {
                            _callSignUpPage();
                          },
                          child: const Text(
                            "Sign Up",
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
        ),
      ),
    );
  }
}
