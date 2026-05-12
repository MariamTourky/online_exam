import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:online_exam/config/constants/app_assets.dart';
import 'package:online_exam/config/routes/route_names.dart';
import 'package:online_exam/config/theme/app_text_styles.dart';
import 'package:online_exam/config/theme/app_theme.dart';
import 'package:online_exam/features/exams/domain/entities/exam_model.dart';

class ExamDescription extends StatelessWidget {
  final String subjectId;
  final ExamModel exam;
  const ExamDescription({
    super.key,
    required this.subjectId,
    required this.exam,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 70,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(mediaQuery.size.height * 0.2),
          child: Column(
            children: [
              Container(
                height: mediaQuery.size.height * 0.2,
                color: Colors.white,
                padding: EdgeInsets.all(mediaQuery.size.width * 0.02),
                margin: EdgeInsets.all(mediaQuery.size.width * 0.02),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(AppAssets.examCard),
                        const SizedBox(width: 8),
                        Text(
                          '${exam.title!} Exam',
                          style: AppTextStyles.medium20Black,
                        ),
                        const Spacer(),
                        Text(
                          '${exam.duration} mins',
                          style: const TextStyle(color: AppTheme.primaryBlue),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Text(
                          'High Level | ${exam.numberOfQuestions} Questions',
                          style: AppTextStyles.baseRegularBlack,
                        ),
                      ],
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.grey.withOpacity(0.2),
                        indent: 10,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        alignment: Alignment.topLeft,
        padding: EdgeInsets.all(mediaQuery.size.width * 0.02),
        margin: EdgeInsets.all(mediaQuery.size.width * 0.02),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Instuctions', style: AppTextStyles.baseRegularBlack),
            SizedBox(height: mediaQuery.size.height * 0.05),
            ..._getInstructions().map(
              (instruction) => Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: _buildBulletPoint(instruction),
              ),
            ),
            SizedBox(height: mediaQuery.size.height * 0.05),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  context.push(RouteNames.question, extra: exam);
                },
                child: const Text(
                  'Start exam',
                  style: TextStyle(color: AppTheme.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<String> _getInstructions() {
    final List<String> instructions = [
      'Read all questions carefully before answering.',
      'Each question has only one correct answer.',
      'Do not leave the exam screen during the test.',
      'Make sure to submit your answers before time ends.',
    ];

    return instructions.where((i) => i.isNotEmpty).toList();
  }

  Widget _buildBulletPoint(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 6),
          child: CircleAvatar(radius: 3, backgroundColor: AppTheme.primaryBlue),
        ),
        const SizedBox(width: 10),
        Expanded(child: Text(text, style: AppTextStyles.baseRegularBlack)),
      ],
    );
  }
}
