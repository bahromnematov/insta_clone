import 'package:flutter/material.dart';
import 'package:insta_clone/pages/home_page.dart';
import 'package:insta_clone/pages/signin_page.dart';
import 'package:insta_clone/pages/signup_page.dart';
import 'package:insta_clone/pages/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashPage(),
      routes: {
        SplashPage.id: (context) => SplashPage(),
        SigninPage.id: (context) => SigninPage(),
        SignupPage.id: (context) => SignupPage(),
        HomePage.id: (context) => HomePage(),
      },
    );
  }
}
