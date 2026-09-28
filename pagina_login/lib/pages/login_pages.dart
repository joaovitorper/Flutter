import 'package:flutter/material.dart';

class LoginPages extends StatefulWidget {
  const new({super.key});

  @override
  State<LoginPages> createState() => _LoginPagesState();
}

class _LoginPagesState extends State<LoginPages> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 211, 215, 250),
        body: Container(
          width: 200,
          height: 200,
          color: Color.fromARGB(255, 51, 90, 139),
          
        ),
      ),
    );
  }
}