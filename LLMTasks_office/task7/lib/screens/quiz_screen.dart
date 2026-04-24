import 'package:flutter/material.dart';
import 'package:task7/screens/result_screen.dart';
class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<Map<String, dynamic>> questions = [
    {
      "question": "Capital of France?",
      "options": ["Berlin", "Paris", "Rome"],
      "answer": "Paris",
      "selected": ""
    },
    {
      "question": "5 + 3 = ?",
      "options": ["6", "8", "10"],
      "answer": "8",
      "selected": ""
    },
  ];

  int score = 0;

  // Calculate score after checking all answers
  void calculateScore() {
    score = 0; // Reset score before recalculating
    for (var q in questions) {
      if (q["selected"] == q["answer"]) {
        score++; // Increment if answer is correct
      }
    }
  }

  // Validate that all questions have been answered
  bool validateAnswers() {
    for (var q in questions) {
      if (q["selected"] == "") {
        return false; // If any question is unanswered, return false
      }
    }
    return true; // All questions answered
  }

  // Navigate to ResultScreen if validation passes
  void goToResult() {
    if (validateAnswers()) {
      calculateScore(); // Only calculate score if answers are valid
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(
            finalScore: score,
            totalQuestions: questions.length,
            questions: questions,
          ),
        ),
      );
    } else {
      // Show error message if not all questions are answered
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please answer all questions!")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Mini Quiz")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: questions.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5,
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(
                            questions[index]["question"],
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        ...questions[index]["options"].map<Widget>((option) {
                          return RadioListTile(
                            title: Text(option),
                            value: option,
                            groupValue: questions[index]["selected"],
                            onChanged: (value) {
                              setState(() {
                                questions[index]["selected"] = value; // Update selected answer
                              });
                            },
                          );
                        }).toList(),
                      ],
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: goToResult, // Trigger result calculation and navigation
              child: Text("Submit Quiz"),
            ),
          ],
        ),
      ),
    );
  }
}