import 'package:flutter/material.dart';
import 'package:flutter_application_1/AddBook.dart';
import 'package:flutter_application_1/AppScaffold.dart';
import 'package:flutter_application_1/Books.dart';
import 'package:flutter_application_1/ListBooks.dart';

class Question5 extends StatefulWidget {
  const Question5({super.key});

  @override
  State<Question5> createState() => _Question5State();
}

class _Question5State extends State<Question5> {
  List<Map<String, String>> book = Books().displayBooks();
  Books books = Books();
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "Question 5",
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddBook(books: books,)),
                    );
                  },
                  child: Text("Add Book"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Listbooks(books: books,)),
                    );
                  },
                  child: Text("View Books"),
                ),
              ],
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
