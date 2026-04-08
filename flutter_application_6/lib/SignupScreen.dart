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
                  alignment: Alignment.centerLeft,
                  child: Text("Email"),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter Email",
                  ),
                ),

                const SizedBox(height: 20),

                // Password
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Password"),
                ),
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
                  alignment: Alignment.centerLeft,
                  child: Text("Remark"),
                ),
                TextFormField(
                  maxLines: 5,
                  maxLength: 200,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 20),

                // Gender
                RadioMenuButton(
                  value: "Female",
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value;
                    });
                  },
                  child: Text("Female"),
                ),

                RadioMenuButton(
                  value: "Male",
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value;
                    });
                  },
                  child: Text("Male"),
                ),

                const SizedBox(height: 20),

                // Category
                RadioGroup(
                  groupValue: category,
                  onChanged: (value) {
                    setState(() {
                      category = value;
                    });
                  },
                  child: Column(
                    children: [
                      RadioListTile(value: "General", title: Text("General")),
                      RadioListTile(
                        value: "OBC",
                        title: Text("OBC"),
                        subtitle: Text("subtitle1"),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // Hobbies
                Row(
                  children: [
                    Checkbox(
                      value: hobbyDance,
                      onChanged: (value) {
                        setState(() {
                          hobbyDance = value!;
                        });
                      },
                    ),
                    const Text("Dance"),

                    CheckboxMenuButton(
                      value: hobbySinging,
                      onChanged: (value) {
                        setState(() {
                          hobbySinging = value!;
                        });
                      },
                      child: const Text("Singing"),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                DropdownButtonFormField(
                hint:Text("Choose City"),
                decoration: InputDecoration(border: OutlineInputBorder()),
                items: [
                DropdownMenuItem( value:"Pune",child: Text("Pune")),
                DropdownMenuItem(value:"Ahmedabad",child: Text("Ahmedabad")),
                DropdownMenuItem(value:"Jaipur",child: Text("Jaipur")),
                DropdownMenuItem(value:"Mumbai",child: Text("Mumbai")),
                DropdownMenuItem(value:"Surat",child: Text("Surat")),
              ], 
              onChanged:(value){setState(() {
                selectedCity=value.toString();
              });}),

                // City Dropdown
                DropdownButtonFormField<String>(
                  initialValue: selectedCity,
                  hint: const Text("Choose City"),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  items: cities.map((city) {
                    return DropdownMenuItem(
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
