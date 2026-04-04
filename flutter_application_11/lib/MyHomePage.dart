import 'package:flutter/material.dart';
import 'package:flutter_application_11/LoginForm.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LoginForm(),
      ],
    );
  }
}