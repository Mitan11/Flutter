import 'package:flutter/material.dart';
import 'package:flutter_application_1/AppScaffold.dart';
import 'package:flutter_application_1/Books.dart';

class Listbooks extends StatefulWidget {
  final Books books;
  const Listbooks({super.key, required this.books});

  @override
  State<Listbooks> createState() => _ListbooksState();
}

class _ListbooksState extends State<Listbooks> {
  List<Map<String, String>> book = Books().displayBooks();

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "View Books",
      child: Stack(
        children: [
          ListView.builder(
            itemCount: widget.books.displayBooks().length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(widget.books.displayBooks()[index]["title"] ?? ""),
                subtitle: Text(widget.books.displayBooks()[index]["author"] ?? ""),
              );
            },
          ),
        ],
      ),
    );
  }
}
