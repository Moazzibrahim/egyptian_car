import 'package:flutter/material.dart';
import 'package:flutter_application_1/constant/color.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'تسجيل الدخول',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: maincolor,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
        ],
      ),
    );
  }
}
