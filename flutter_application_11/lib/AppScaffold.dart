import 'package:flutter/material.dart';
import 'package:flutter_application_11/MyHomePage.dart';

class AppScaffold extends StatefulWidget {
  const AppScaffold({super.key});

  @override
  State<AppScaffold> createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("MY app"),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home), text: "Home"),
              Tab(icon: Icon(Icons.search), text: "Search"),
              Tab(icon: Icon(Icons.person), text: "Account"),
              Tab(icon: Icon(Icons.message), text: "Messages"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            const MyHomePage(),
            Column(
              children: [
                TextField(
                  decoration: InputDecoration(border: OutlineInputBorder()),
                ),
                ElevatedButton(onPressed: () {}, child: Text("Search")),
              ],
            ),
            Text("User Account"),
            Text("Messages"),
          ],
        ),
      ),
    );
  }
}
