import 'package:flutter/material.dart';

class AppScaffold extends StatefulWidget {
  final Widget  child; 
  final String title;
  const AppScaffold({super.key, required this.child, this.title = "Default Title"});
  @override
  State<AppScaffold> createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: widget.child,
    );
  }
}