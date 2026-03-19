import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: ElevatedButton(onPressed: (){
        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder)=>HomeScreen()));
        Navigator.pushReplacementNamed(context, "/home");
    }, child: Text("Get Started")));
  }
}