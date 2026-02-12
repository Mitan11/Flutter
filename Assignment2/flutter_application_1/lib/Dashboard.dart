import 'package:flutter/material.dart';
import 'package:flutter_application_1/AppScaffold.dart';

class Dashboard extends StatefulWidget {
  final String email;
  const Dashboard({super.key, required this.email});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "Dashboard",
      child: Center(
        child: Text(
          "Welcome to the Dashboard, ${widget.email}!",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
