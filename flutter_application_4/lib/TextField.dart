import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({super.key});

  @override
  State<TextFieldWidget> createState() => _TextFieldState();
}

class _TextFieldState extends State<TextFieldWidget> {

  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Name"),
        TextField(
          controller: _controller,
          obscureText: true,
          obscuringCharacter: "*",
          decoration: InputDecoration(
            hintText: "Enter your name",
            labelText: "Name",
            helperText: "Your full name",
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.person),
            // suffix: Icon(Icons.check_circle),
            suffix: IconButton(onPressed: (){
              _controller.clear();
            }, icon: Icon(Icons.clear))
          ),
        ),
      ],
    );
  }
}
