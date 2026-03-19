import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';
import 'category_screen.dart';
import 'leaderboard_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final themeProvider = context.watch<ThemeProvider>();
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: isDark
                ? [Colors.indigo.shade900, Colors.purple.shade900]
                : [Colors.indigo.shade500, Colors.purple.shade400],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: IconButton(
                    icon: Icon(
                      themeProvider.isDark
                          ? Icons.wb_sunny_rounded
                          : Icons.nightlight_round,
                      color: Colors.white,
                    ),
                    onPressed: themeProvider.toggle,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.quiz_rounded, size: 90, color: Colors.white),
                    const SizedBox(height: 16),
                    const Text(
                      'Quiz Master',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 2,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Test your knowledge!',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white.withOpacity(0.85),
                      ),
                    ),
                    const SizedBox(height: 60),
                    _HomeButton(
                      icon: Icons.play_arrow_rounded,
                      label: 'Start Quiz',
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const CategoryScreen()),
                      ),
                    ),
                    const SizedBox(height: 16),
                    _HomeButton(
                      icon: Icons.leaderboard_rounded,
                      label: 'Leaderboard',
                      outlined: true,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const LeaderboardScreen()),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HomeButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool outlined;

  const _HomeButton({
    required this.icon,
    required this.label,
    required this.onTap,
    this.outlined = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: SizedBox(
        width: double.infinity,
        child: outlined
            ? OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  side: const BorderSide(color: Colors.white, width: 2),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                icon: Icon(icon),
                label: Text(label, style: const TextStyle(fontSize: 17)),
                onPressed: onTap,
              )
            : ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.indigo.shade700,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                icon: Icon(icon),
                label: Text(label,
                    style: const TextStyle(
                        fontSize: 17, fontWeight: FontWeight.bold)),
                onPressed: onTap,
              ),
      ),
    );
  }
}