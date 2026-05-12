import 'package:flutter/material.dart';
import 'package:online_exam/config/theme/app_text_styles.dart';
import 'package:online_exam/config/theme/app_theme.dart';
import 'package:online_exam/features/exams/domain/entities/exam_model.dart';
import 'package:online_exam/features/exams/domain/entities/qouestion_model.dart';
import 'package:go_router/go_router.dart';
import 'package:online_exam/config/routes/route_names.dart';

class ExamResults extends StatelessWidget {
  final ExamModel exam;
  final List<QuestionModel> questions;

  const ExamResults({super.key, required this.exam, required this.questions});

  @override
  Widget build(BuildContext context) {
    int score = 0;
    for (var q in questions) {
      if (q.selectedAnswer != null && q.selectedAnswer == q.correct) {
        score++;
      }
    }

    final percentage = (score / questions.length) * 100;
    final isPassed = percentage >= 60; // Assuming 60% is passing

    return Scaffold(
      appBar: AppBar(title: const Text("Results"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Container(
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: AppTheme.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: AppTheme.blue.withOpacity(0.1),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Icon(
                    isPassed
                        ? Icons.emoji_events_outlined
                        : Icons.sentiment_dissatisfied_outlined,
                    size: 80,
                    color: isPassed ? AppTheme.green : Colors.red,
                  ),
                  const SizedBox(height: 24),
                  Text(
                    isPassed ? "Congratulations!" : "Keep Trying!",
                    style: AppTextStyles.medium20Black.copyWith(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "You scored $score out of ${questions.length}",
                    style: AppTextStyles.medium20Black.copyWith(
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 32),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        height: 120,
                        width: 120,
                        child: CircularProgressIndicator(
                          value: score / questions.length,
                          strokeWidth: 12,
                          backgroundColor: Colors.grey[200],
                          color: isPassed ? AppTheme.green : Colors.red,
                        ),
                      ),
                      Text(
                        "${percentage.toInt()}%",
                        style: AppTextStyles.medium20Black.copyWith(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () {
                  context.go(RouteNames.home);
                },
                child: const Text(
                  "Back to Home",
                  style: TextStyle(color: AppTheme.white, fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
