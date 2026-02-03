import 'package:flutter/material.dart';
import 'package:flutter_application_6/AppScaffold.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final formKey = GlobalKey<FormState>();
  String? gender;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Form(
          child: Column(
            spacing: 20,
            children: [
              Text("Register Here"),
              Align(alignment: Alignment.centerLeft, child: Text("Email")),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter Email",
                ),
              ),
              Align(alignment: Alignment.centerLeft, child: Text("Password")),
              TextFormField(
                // obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter Password",
                ),
              ),
              Align(alignment: Alignment.centerLeft, child: Text("Remark")),
              TextFormField(
                maxLines: 5,
                maxLength: 200,
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),

              Row(
                children: [
                  Radio(
                    value: "Male",
                    groupValue: gender,
                    onChanged: (value) {
                      setState(() {
                        gender = value;
                      });
                    },
                  ),
                  Text("Male"),
                  Radio(
                    value: "Female",
                    groupValue: gender,
                    onChanged: (value) {
                      setState(() {
                        gender = value;
                      });
                    },
                  ),
                  Text("Female"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
