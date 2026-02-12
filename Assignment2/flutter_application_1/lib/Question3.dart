import 'package:flutter/material.dart';

class Question3 extends StatefulWidget {
  const Question3({super.key});

  @override
  State<Question3> createState() => _Question3State();
}

class _Question3State extends State<Question3> {
  List<String> items = List.generate(10, (index) => "Item ${index + 1}");
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            items.add("Item ${items.length + 1}");
          });
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (!_scrollController.hasClients) {
              return;
            }
            _scrollController.jumpTo(
              _scrollController.position.maxScrollExtent,
            );
          });
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text("Question 3"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          ListView.builder(
            controller: _scrollController,
            itemCount: items.length,
            itemBuilder: (context, index) {
              return ListTile(title: Text(items[index]));
            },
          ),
        ],
      ),
    );
  }
}
