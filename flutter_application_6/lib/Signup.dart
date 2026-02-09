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
  String? category;
  bool hobbyDance = false;
  bool hobbySinging = false;
  String? selectedCity;

  final List<String> cities = [
    "New York",
    "Los Angeles",
    "Chicago",
    "Houston",
    "Phoenix",
  ];

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Form(
          key: formKey, // ✅ FIX
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text("Register Here", style: TextStyle(fontSize: 20)),
                const SizedBox(height: 20),

                // Email
                const Align(
                    alignment: Alignment.centerLeft, child: Text("Email")),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter Email",
                  ),
                ),

                const SizedBox(height: 20),

                // Password
                const Align(
                    alignment: Alignment.centerLeft, child: Text("Password")),
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter Password",
                  ),
                ),

                const SizedBox(height: 20),

                // Remark
                const Align(
                    alignment: Alignment.centerLeft, child: Text("Remark")),
                TextFormField(
                  maxLines: 5,
                  maxLength: 200,
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                ),

                const SizedBox(height: 20),

                // Gender
                RadioListTile(
                  title: const Text("Male"),
                  value: "Male",
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() => gender = value);
                  },
                ),
                RadioListTile(
                  title: const Text("Female"),
                  value: "Female",
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() => gender = value);
                  },
                ),

                const SizedBox(height: 20),

                // Category
                RadioListTile(
                  title: const Text("General"),
                  value: "General",
                  groupValue: category,
                  onChanged: (value) {
                    setState(() => category = value);
                  },
                ),
                RadioListTile(
                  title: const Text("OBC"),
                  subtitle: const Text("subtitle1"),
                  value: "OBC",
                  groupValue: category,
                  onChanged: (value) {
                    setState(() => category = value);
                  },
                ),

                const SizedBox(height: 20),

                // Hobbies
                CheckboxListTile(
                  title: const Text("Dance"),
                  value: hobbyDance,
                  onChanged: (value) {
                    setState(() => hobbyDance = value!);
                  },
                ),
                CheckboxListTile(
                  title: const Text("Singing"),
                  value: hobbySinging,
                  onChanged: (value) {
                    setState(() => hobbySinging = value!);
                  },
                ),

                const SizedBox(height: 20),

                // City Dropdown
                DropdownButtonFormField<String>(
                  value: selectedCity,
                  hint: const Text("Choose City"),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  items: cities.map((city) {
                    return DropdownMenuItem<String>(
                      value: city,
                      child: Text(city),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedCity = value;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
