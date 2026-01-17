import 'package:flutter/material.dart';

class ImageWid extends StatelessWidget {
  const ImageWid({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Image.network('https://images.unsplash.com/photo-1495360010541-f48722b34f7d?w=700&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8Y2F0fGVufDB8fDB8fHww'),
        // Text(
        //   'This is an image from the internet',
        //   style: TextStyle(fontSize: 16),
        // ),
        Image.asset('assets/images/avatar.png'),
      ],
    );
  }
}
