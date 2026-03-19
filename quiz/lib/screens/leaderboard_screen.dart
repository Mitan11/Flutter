import 'package:flutter/material.dart';
import '../data/questions.dart';
import '../providers/quiz_provider.dart';

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = quizCategories.keys.toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Leaderboard'),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: categories.length,
        itemBuilder: (context, i) =>
            _CategoryBoard(category: categories[i]),
      ),
    );
  }
}

class _CategoryBoard extends StatefulWidget {
  final String category;
  const _CategoryBoard({required this.category});

  @override
  State<_CategoryBoard> createState() => _CategoryBoardState();
}

class _CategoryBoardState extends State<_CategoryBoard> {
  List<int> _scores = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  void _load() async {
    final scores = await QuizProvider.getLeaderboard(widget.category);
    if (mounted) setState(() { _scores = scores; _loading = false; });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final total = quizCategories[widget.category]?.length ?? 0;
    const medals = ['🥇', '🥈', '🥉'];

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.category,
              style: theme.textTheme.titleLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const Divider(height: 20),
            if (_loading)
              const Center(child: CircularProgressIndicator())
            else if (_scores.isEmpty)
              const Text('No scores yet. Play to set a record!',
                  style: TextStyle(color: Colors.grey))
            else
              ...List.generate(_scores.length, (i) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: Row(
                      children: [
                        Text(
                          i < 3 ? medals[i] : '${i + 1}.',
                          style: const TextStyle(fontSize: 20),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            'Score: ${_scores[i]} / $total',
                            style: theme.textTheme.bodyLarge?.copyWith(
                              fontWeight: i == 0
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                          ),
                        ),
                        if (i == 0)
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.amber.shade100,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              'Best',
                              style: TextStyle(
                                  color: Colors.amber.shade800,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            ),
                          ),
                      ],
                    ),
                  )),
          ],
        ),
      ),
    );
  }
}
