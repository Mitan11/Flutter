import 'package:flutter/material.dart';
import 'package:flutter_application_1/AppScaffold.dart';
import 'package:flutter_application_1/Books.dart';
import 'package:flutter_application_1/ListBooks.dart';

class AddBook extends StatefulWidget {
  final Books books;
  const AddBook({super.key, required this.books});

  @override
  State<AddBook> createState() => _AddBookState();
}

class _AddBookState extends State<AddBook> {
  TextEditingController titleController = TextEditingController();
  TextEditingController authorController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "Add Book",
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("Title", style: TextStyle(fontWeight: FontWeight.bold)),
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                hintText: "Enter book title",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Text("Author", style: TextStyle(fontWeight: FontWeight.bold)),
            TextField(
              controller: authorController,
              decoration: InputDecoration(
                hintText: "Enter author name",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (titleController.text.isEmpty ||
                    authorController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Please fill in all fields")),
                  );
                  return;
                }
                widget.books.addBook(
                  titleController.text,
                  authorController.text,
                );
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Listbooks(books: widget.books),
                  ),
                );
              },
              child: Text("Add Book"),
            ),
          ],
        ),
      ),
    );
  }
}
