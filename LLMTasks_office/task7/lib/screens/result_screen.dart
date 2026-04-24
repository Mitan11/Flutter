import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final int finalScore;
  final int totalQuestions;
  final List<Map<String, dynamic>> questions;

  const ResultScreen({
    super.key,
    required this.finalScore,
    required this.totalQuestions,
    required this.questions,
  });

  // Calculate the percentage score
  double get percentage => (finalScore / totalQuestions) * 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Quiz Result")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Your Score: $finalScore/$totalQuestions",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "Percentage: ${percentage.toStringAsFixed(2)}%",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: questions.length,
                itemBuilder: (context, index) {
                  bool isCorrect = questions[index]["selected"] == questions[index]["answer"];
                  return Card(
                    color: isCorrect ? Colors.green[100] : Colors.red[100],
                    child: ListTile(
                      title: Text(questions[index]["question"]),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Your Answer: ${questions[index]["selected"]}"),
                          Text("Correct Answer: ${questions[index]["answer"]}"),
                          Text(isCorrect ? "Result: Correct" : "Result: Incorrect"),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Go back to Quiz Screen
              },
              child: Text("Retake Quiz"),
            ),
          ],
        ),
      ),
    );
  }
}


