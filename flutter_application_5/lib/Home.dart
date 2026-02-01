import 'package:flutter/material.dart';
import 'package:flutter_application_5/LoginForm.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Login Page')),
        body: const LoginForm(),
      ),
    );
  }
}
