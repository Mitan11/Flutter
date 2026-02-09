import 'package:flutter/material.dart';
import 'package:flutter_application_6/AppScaffold.dart';
import 'package:flutter_application_6/SignupScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "Login Screen",
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                  hintText: 'Enter your email',
                ),
                validator: (Value) {
                  if (Value == null || Value.isEmpty) {
                    return 'Please enter some text';
                  } else if (!RegExp(
                    r'^[\w-\.]+@[\w]+.[a-zA-Z]{2,3}$',
                  ).hasMatch(Value)) {
                    return 'Invalid email format';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  hintText: "Enter your password",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  } else if (!RegExp(
                    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*[\d])(?=.*[@#$&*-+=.]).{8,20}$',
                  ).hasMatch(value)) {
                    return 'Password must be at least 6 characters long';
                  }
                  return null;
                },
                obscureText: true,
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Login Successful')),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: Text('Login'),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text("Create an Account??"),
                  SizedBox(width: 20),

                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => SignupScreen()),
                      );
                    },
                    child: Text("SignUp"),
                  ),

                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => SignupScreen()),
                      );
                    },
                    child: Text("SignUp"),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => SignupScreen()),
                      );
                    },
                    child: Text("SignUp"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
