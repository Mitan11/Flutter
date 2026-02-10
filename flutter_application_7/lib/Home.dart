import 'package:flutter/material.dart';
import 'package:flutter_application_7/AppScaffold.dart';
import 'package:flutter_application_7/LIstView.dart';
import 'package:flutter_application_7/TaskList.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: Column(
        children: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (builder) {
                    return LIstView();
                  },
                ),
              );
            },
            child: const Text("ListView"),
          ),

          ElevatedButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return TaskList();
            },));
          }, child:Text("Todo List")),

          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return AppScaffold(
                      title: "About",
                      child: Text("I am About"),
                    );
                  },
                ),
              );
            },
            child: Text("About"),
          ),
          
        ],
      ),
    );
  }
}
