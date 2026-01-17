import 'package:flutter/material.dart';

class StateFull extends StatefulWidget {
  const StateFull({super.key});

  @override
  State<StateFull> createState() => _StateFullState();
}

class _StateFullState extends State<StateFull> {
  String str = "Click Me";
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(str),
      onPressed: () {
        setState(() {
          str = "Button Clicked";
        });
      },
    );
  }
}
