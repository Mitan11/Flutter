import 'package:flutter/material.dart';

class WidgetsButton extends StatelessWidget {
  const WidgetsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {},
          child: Text("Press Me"),
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            backgroundColor: Colors.amber,
            foregroundColor: Colors.black,
            elevation: 10,
            side: BorderSide(
              color: Colors.red,
              width: 2,
              style: BorderStyle.solid,
            ),
            minimumSize: Size(150, 50),
            // fixedSize: Size(200, 50 ),
          ),
        ),

        ElevatedButton.icon(
          onPressed: () {},
          label: Text("Icon Button"),
          icon: Icon(Icons.add),
          style: ElevatedButton.styleFrom(
            iconColor: Colors.white,
            backgroundColor: Colors.green,
            iconAlignment: IconAlignment.end,
            iconSize: 10,
          ),
        ),
        IconButton(onPressed: () {}, icon: Icon(Icons.add)),
      ],
    );
  }
}
