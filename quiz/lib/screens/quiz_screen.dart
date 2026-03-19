import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:audioplayers/audioplayers.dart';
import '../providers/quiz_provider.dart';
import 'result_screen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen>
    with SingleTickerProviderStateMixin {
  static const int _totalTime = 15;

  int _timeLeft = _totalTime;
  Timer? _timer;
  int? _selectedIndex;
  bool _answered = false;
  int _trackedIndex = 0;

  late AnimationController _slideController;
  late Animation<Offset> _slideAnim;
  QuizProvider? _quiz;
  bool _listenerAttached = false;

  final AudioPlayer _audio = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _slideController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 380),
    );
    _slideAnim = Tween<Offset>(begin: const Offset(0.25, 0), end: Offset.zero)
        .animate(
          CurvedAnimation(parent: _slideController, curve: Curves.easeOutCubic),
        );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final quiz = context.read<QuizProvider>();
      _quiz = quiz;
      _trackedIndex = quiz.currentIndex;
      quiz.addListener(_onQuizChanged);
      _listenerAttached = true;
      _startTimer();
      _slideController.forward();
    });
  }

  @override
  void dispose() {
    if (_listenerAttached) {
      _quiz?.removeListener(_onQuizChanged);
    }
    _timer?.cancel();
    _slideController.dispose();
    _audio.dispose();
    super.dispose();
  }

  void _onQuizChanged() {
    if (!mounted) return;
    final quiz = context.read<QuizProvider>();
    if (quiz.isFinished) {
      _timer?.cancel();
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (_, a1, a2) => const ResultScreen(),
          transitionsBuilder: (_, a1, a2, child) =>
              FadeTransition(opacity: a1, child: child),
          transitionDuration: const Duration(milliseconds: 400),
        ),
      );
    } else if (quiz.currentIndex != _trackedIndex) {
      setState(() {
        _trackedIndex = quiz.currentIndex;
        _answered = false;
        _selectedIndex = null;
        _timeLeft = _totalTime;
      });
      _startTimer();
      _slideController.reset();
      _slideController.forward();
    }
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (!mounted) {
        t.cancel();
        return;
      }
      setState(() => _timeLeft--);
      if (_timeLeft <= 0) {
        t.cancel();
        _onTimeUp();
      }
    });
  }

  void _onTimeUp() {
    if (_answered || !mounted) return;
    _playSound(false);
    setState(() {
      _answered = true;
      _selectedIndex = -1;
    });
    Future.delayed(const Duration(milliseconds: 1000), () {
      if (!mounted) return;
      context.read<QuizProvider>().answer(-1);
    });
  }

  void _handleAnswer(int index) {
    if (_answered) return;
    _timer?.cancel();
    final quiz = context.read<QuizProvider>();
    final isCorrect = index == quiz.currentQuestion.correctIndex;
    _playSound(isCorrect);
    setState(() {
      _answered = true;
      _selectedIndex = index;
    });
    Future.delayed(const Duration(milliseconds: 900), () {
      if (!mounted) return;
      context.read<QuizProvider>().answer(index);
    });
  }

  void _playSound(bool correct) async {
    try {
      await _audio.stop();
      await _audio.play(
        UrlSource(
          correct
              ? 'https://assets.mixkit.co/active_storage/sfx/2018/2018.wav'
              : 'https://assets.mixkit.co/active_storage/sfx/270/270.wav',
        ),
      );
    } catch (_) {}
  }

  Color _optionBg(int index, int correct, bool isDark) {
    if (!_answered) return isDark ? const Color(0xFF2A2A3A) : Colors.white;
    if (index == correct) return Colors.green.shade400;
    if (index == _selectedIndex) return Colors.red.shade400;
    return isDark ? const Color(0xFF2A2A3A) : Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    final quiz = context.watch<QuizProvider>();
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    if (quiz.isFinished) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final question = quiz.currentQuestion;
    final progress = (quiz.currentIndex + 1) / quiz.totalQuestions;
    final timerRatio = (_timeLeft / _totalTime).clamp(0.0, 1.0);
    final timerColor = timerRatio > 0.5
        ? Colors.green.shade400
        : timerRatio > 0.25
        ? Colors.orange.shade400
        : Colors.red.shade400;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // ── Top bar ──
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 16, 0),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.close_rounded),
                    onPressed: () => Navigator.pop(context),
                  ),
                  Expanded(
                    child: TweenAnimationBuilder<double>(
                      tween: Tween(begin: 0, end: progress),
                      duration: const Duration(milliseconds: 600),
                      curve: Curves.easeOutCubic,
                      builder: (_, val, __) => ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: LinearProgressIndicator(
                          value: val,
                          minHeight: 10,
                          backgroundColor: isDark
                              ? Colors.white12
                              : Colors.indigo.shade100,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.indigo.shade400,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    '${quiz.currentIndex + 1}/${quiz.totalQuestions}',
                    style: theme.textTheme.labelLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
                child: Column(
                  children: [
                    // ── Circular countdown timer ──
                    SizedBox(
                      width: 88,
                      height: 88,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          CircularProgressIndicator(
                            value: timerRatio,
                            strokeWidth: 8,
                            backgroundColor: isDark
                                ? Colors.white12
                                : Colors.grey.shade200,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              timerColor,
                            ),
                          ),
                          Center(
                            child: Text(
                              '$_timeLeft',
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                color: timerColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 14),

                    // ── Score chip ──
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.star_rounded,
                          color: Colors.amber,
                          size: 20,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'Score: ${quiz.score}',
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 18),

                    // ── Question card ──
                    SlideTransition(
                      position: _slideAnim,
                      child: FadeTransition(
                        opacity: _slideController,
                        child: Card(
                          elevation: 8,
                          shadowColor: Colors.indigo.withOpacity(0.15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              children: [
                                if (question.image != null) ...[
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.network(
                                      question.image!,
                                      height: 160,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                      errorBuilder: (_, __, ___) =>
                                          const SizedBox(),
                                    ),
                                  ),
                                  const SizedBox(height: 14),
                                ],
                                Text(
                                  question.question,
                                  textAlign: TextAlign.center,
                                  style: theme.textTheme.titleLarge?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    height: 1.35,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // ── Answer options ──
                    ...List.generate(question.options.length, (index) {
                      final bg = _optionBg(
                        index,
                        question.correctIndex,
                        isDark,
                      );
                      final revealed =
                          _answered && index == question.correctIndex;
                      final wrongSel =
                          _answered && index == _selectedIndex && !revealed;
                      final textColor = (_answered && (revealed || wrongSel))
                          ? Colors.white
                          : theme.textTheme.bodyLarge?.color;

                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 350),
                        width: double.infinity,
                        margin: const EdgeInsets.only(bottom: 12),
                        decoration: BoxDecoration(
                          color: bg,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: !_answered
                                ? (isDark
                                      ? Colors.white24
                                      : Colors.indigo.shade100)
                                : Colors.transparent,
                            width: 1.5,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.06),
                              blurRadius: 8,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Material(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(16),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(16),
                            onTap: _answered
                                ? null
                                : () => _handleAnswer(index),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 16,
                                horizontal: 16,
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    width: 34,
                                    height: 34,
                                    decoration: BoxDecoration(
                                      color: Colors.indigo.withOpacity(
                                        (_answered && (revealed || wrongSel))
                                            ? 0.25
                                            : 0.1,
                                      ),
                                      borderRadius: BorderRadius.circular(9),
                                    ),
                                    child: Center(
                                      child: Text(
                                        String.fromCharCode(65 + index),
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: textColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Text(
                                      question.options[index],
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: textColor,
                                      ),
                                    ),
                                  ),
                                  if (revealed)
                                    const Icon(
                                      Icons.check_circle_rounded,
                                      color: Colors.white,
                                      size: 22,
                                    ),
                                  if (wrongSel)
                                    const Icon(
                                      Icons.cancel_rounded,
                                      color: Colors.white,
                                      size: 22,
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
