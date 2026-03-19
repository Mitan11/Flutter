import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/quiz_provider.dart';
import 'home_screen.dart';
import 'category_screen.dart';
import 'leaderboard_screen.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final quiz = context.watch<QuizProvider>();
    final score = quiz.score;
    final total = quiz.totalQuestions;
    final percent = total > 0 ? score / total : 0.0;

    final (emoji, msg) = percent == 1.0
        ? ('🏆', 'Perfect Score!')
        : percent >= 0.6
            ? ('🎉', 'Great Job!')
            : percent >= 0.4
                ? ('👍', 'Good Effort!')
                : ('💪', 'Keep Practicing!');

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TweenAnimationBuilder<double>(
                tween: Tween(begin: 0, end: 1),
                duration: const Duration(milliseconds: 600),
                curve: Curves.elasticOut,
                builder: (_, val, child) =>
                    Transform.scale(scale: val, child: child),
                child: Text(emoji, style: const TextStyle(fontSize: 80)),
              ),
              const SizedBox(height: 12),
              Text(msg,
                  style: const TextStyle(
                      fontSize: 28, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text('Category: ${quiz.currentCategory}',
                  style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 32),
              _ScoreRing(score: score, total: total),
              const SizedBox(height: 40),
              _Btn(
                icon: Icons.replay_rounded,
                label: 'Play Again',
                onTap: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const CategoryScreen()),
                ),
              ),
              const SizedBox(height: 12),
              _Btn(
                icon: Icons.leaderboard_rounded,
                label: 'Leaderboard',
                outlined: true,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const LeaderboardScreen()),
                ),
              ),
              const SizedBox(height: 12),
              _Btn(
                icon: Icons.home_rounded,
                label: 'Home',
                outlined: true,
                onTap: () => Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const HomeScreen()),
                  (_) => false,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ScoreRing extends StatelessWidget {
  final int score;
  final int total;
  const _ScoreRing({required this.score, required this.total});

  @override
  Widget build(BuildContext context) {
    final pct = total > 0 ? score / total : 0.0;
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: pct),
      duration: const Duration(milliseconds: 1300),
      curve: Curves.easeOutCubic,
      builder: (_, val, __) => SizedBox(
        width: 180,
        height: 180,
        child: Stack(
          fit: StackFit.expand,
          children: [
            CircularProgressIndicator(
              value: val,
              strokeWidth: 14,
              backgroundColor: Colors.grey.shade200,
              valueColor: AlwaysStoppedAnimation<Color>(
                val >= 0.6
                    ? Colors.green.shade400
                    : val >= 0.4
                        ? Colors.orange.shade400
                        : Colors.red.shade400,
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('$score/$total',
                      style: const TextStyle(
                          fontSize: 32, fontWeight: FontWeight.bold)),
                  Text('${(val * 100).toInt()}%',
                      style: TextStyle(
                          fontSize: 15, color: Colors.grey.shade600)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Btn extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool outlined;
  const _Btn(
      {required this.icon,
      required this.label,
      required this.onTap,
      this.outlined = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: outlined
          ? OutlinedButton.icon(
              icon: Icon(icon),
              label: Text(label),
              onPressed: onTap,
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
              ),
            )
          : ElevatedButton.icon(
              icon: Icon(icon),
              label: Text(label,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              onPressed: onTap,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
              ),
            ),
    );
  }
}