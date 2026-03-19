import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/questions.dart';
import '../providers/quiz_provider.dart';
import 'quiz_screen.dart';

const _icons = <String, IconData>{
  'Science': Icons.science_rounded,
  'Technology': Icons.computer_rounded,
  'Sports': Icons.sports_soccer_rounded,
};

const _gradients = <String, List<Color>>{
  'Science': [Color(0xFF43CEA2), Color(0xFF185A9D)],
  'Technology': [Color(0xFF667EEA), Color(0xFF764BA2)],
  'Sports': [Color(0xFFFF6B6B), Color(0xFFFF8E53)],
};

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = quizCategories.keys.toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose Category'),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: categories.length,
        itemBuilder: (context, i) {
          final cat = categories[i];
          final colors = _gradients[cat] ??
              [Colors.indigo.shade400, Colors.purple.shade400];
          return _CategoryCard(
            category: cat,
            colors: colors,
            icon: _icons[cat] ?? Icons.quiz_rounded,
            questionCount: quizCategories[cat]!.length,
            onTap: () {
              context.read<QuizProvider>().loadQuestions(
                    quizCategories[cat]!,
                    cat,
                  );
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const QuizScreen()),
              );
            },
          );
        },
      ),
    );
  }
}

class _CategoryCard extends StatelessWidget {
  final String category;
  final List<Color> colors;
  final IconData icon;
  final int questionCount;
  final VoidCallback onTap;

  const _CategoryCard({
    required this.category,
    required this.colors,
    required this.icon,
    required this.questionCount,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 110,
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: colors),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: colors[0].withOpacity(0.4),
              blurRadius: 14,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Container(
                width: 62,
                height: 62,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(icon, color: Colors.white, size: 34),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      category,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '$questionCount Questions',
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.85), fontSize: 14),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios_rounded,
                  color: Colors.white, size: 20),
            ],
          ),
        ),
      ),
    );
  }
}