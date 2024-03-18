import 'package:flutter/material.dart';

class MyLikePage extends StatefulWidget {
  const MyLikePage({super.key});

  @override
  State<MyLikePage> createState() => _MyLikePageState();
}

class _MyLikePageState extends State<MyLikePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("MyLikePage"),
      ),
    );
  }
}
