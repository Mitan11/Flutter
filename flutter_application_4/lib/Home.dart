import 'package:flutter/material.dart';
import 'package:flutter_application_4/TextField.dart';
import 'package:flutter_application_4/Widgets.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,

        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {},
        //   // child: Text("Add"), //We can use Icon also but one of them should be used
        //   child: Icon(Icons.add),
        //   tooltip: "Add",
        //   backgroundColor: Colors.blue,
        //   foregroundColor: Colors.white,
        // ),

        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          label: Text("Add"),
          icon: Icon(Icons.add),
        ),

        appBar: AppBar(title: Text("Home")),
        body: Column(children: [Text("data"),WidgetsButton(),TextFieldWidget()]),
      ),
    );
  }
}
