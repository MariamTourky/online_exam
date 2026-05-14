import 'package:flutter/material.dart';
import 'package:online_exam/config/theme/app_text_styles.dart';
import 'package:online_exam/config/theme/app_theme.dart';
import 'package:go_router/go_router.dart';
import 'package:online_exam/config/routes/route_names.dart';
import 'package:online_exam/features/results/data/models/result_model.dart';

class ResultsScreen extends StatelessWidget {
  final ResultModel result;

  const ResultsScreen({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    final percentage = (result.correctAnswers / result.totalQuestions) * 100;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => context.go(RouteNames.home),
        ),
        title: Text(
          "Exam score",
          style: AppTextStyles.medium20Black.copyWith(fontSize: 18),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            const Text(
              "Your score",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      height: 150,
                      width: 150,
                      child: CircularProgressIndicator(
                        value: result.correctAnswers / result.totalQuestions,
                        strokeWidth: 10,
                        color: AppTheme.blue,
                        backgroundColor: Colors.red.shade400,
                      ),
                    ),
                    Text(
                      "${percentage.toInt()}%",
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 40),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildStatRow(
                      "Correct",
                      result.correctAnswers,
                      AppTheme.blue,
                    ),
                    const SizedBox(height: 16),
                    _buildStatRow("Incorrect", result.wrongAnswers, Colors.red),
                  ],
                ),
              ],
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () {
                  // TODO: Implement show results logic if needed
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                ),
                child: const Text(
                  "Show results",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: OutlinedButton(
                onPressed: () {
                  context.go(RouteNames.subjects);
                },
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: AppTheme.blue),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                ),
                child: const Text(
                  "Start again",
                  style: TextStyle(color: AppTheme.blue, fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: 48),
          ],
        ),
      ),
    );
  }

  Widget _buildStatRow(String label, int value, Color color) {
    return Row(
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: color,
          ),
        ),
        const SizedBox(width: 12),
        Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: color),
          ),
          alignment: Alignment.center,
          child: Text(
            value.toString(),
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}
