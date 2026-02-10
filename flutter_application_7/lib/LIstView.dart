import 'package:flutter/material.dart';
import 'package:flutter_application_7/AppScaffold.dart';

class LIstView extends StatefulWidget {
  const LIstView({super.key});

  @override
  State<LIstView> createState() => _LIstViewState();
}

class _LIstViewState extends State<LIstView> {
  List<String> name = ["cwce", "ecwew", "dewcwec"];
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: -100,
            child: Container(
              width: 200,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.amber,
                shape: BoxShape.circle,
              ),
            ),
          ),
          // Simple List View
          // ListView(children: name.map((e) => Text(e)).toList()),

          // List can also be created without stack and positioned widget
          // List View Bilder
          // ListView.builder(
          //   itemCount: name.length,
          //   itemBuilder: (context, index) {
          //     return ListTile(
          //       title: Text(name[index]),
          //       leading: Icon(Icons.check),
          //       trailing: CircleAvatar(
          //         backgroundColor: Colors.blue,
          //         child: Text(name[index].substring(0, 1).toUpperCase()),
          //       ),
          //     );
          //   },
          // ),

          // List View Spaerator
          ListView.separated(
            itemCount: name.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(name[index]),
                leading: Icon(Icons.check),
                trailing: CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Text(name[index].substring(0, 1).toUpperCase()),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return Divider();
            },
          ),
        ],
      ),
    );
  }
}
