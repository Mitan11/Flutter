class Books {
  String? title;
  String? author;

  static List<Map<String, String>> bookList = [{
    "title": "Flutter for Beginners",
    "author": "John Doe"
  }, {
    "title": "Dart in Action",
    "author": "Jane Smith"
  }];

  // Books({required this.title, required this.author});

  void addBook(String title, String author) {
    bookList.add({"title": title, "author": author});
  }

  List<Map<String, String>> displayBooks() {
    return bookList;
  }
}
