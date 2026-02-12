import 'package:flutter/material.dart';
import 'package:flutter_application_1/AppScaffold.dart';

class Employees extends StatefulWidget {
  const Employees({super.key});

  @override
  State<Employees> createState() => _EmployeesState();
}

class _EmployeesState extends State<Employees> {
  List<Map<String, String>> employees = [
    {"name": "Alice Johnson", "position": "Software Engineer"},
    {"name": "Bob Smith", "position": "Product Manager"},
    {"name": "Charlie Davis", "position": "UX Designer"},
  ];
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "Employees",
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              "Employee List",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: double.infinity,
                  mainAxisExtent: 80,
                ),
                itemCount: employees.length,
                itemBuilder: (context, index) {
                  final employee = employees[index];
                  return ListTile(
                    onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "${employee["name"]} - ${employee["position"]}",
                        ),
                      ),
                    ),
                    leading: CircleAvatar(child: Text(employee["name"]![0])),
                    title: Text(employee["name"]!),
                    subtitle: Text(employee["position"]!),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
