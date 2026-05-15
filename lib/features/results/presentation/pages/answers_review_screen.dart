import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:online_exam/config/theme/app_text_styles.dart';
import 'package:online_exam/config/theme/app_theme.dart';
import 'package:online_exam/features/results/domain/entities/result_entity.dart';

class AnswersReviewScreen extends StatefulWidget {
  final ResultEntity result;

  const AnswersReviewScreen({super.key, required this.result});

  @override
  State<AnswersReviewScreen> createState() => _AnswersReviewScreenState();
}

class _AnswersReviewScreenState extends State<AnswersReviewScreen> {
  @override
  Widget build(BuildContext context) {
    final questions = widget.result.answeredQuestions ?? [];

    return Scaffold(
      backgroundColor: AppTheme.white,
      appBar: AppBar(
        backgroundColor: AppTheme.white,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppTheme.black),
          onPressed: () => context.pop(),
        ),
        title: Text("Answers", style: AppTextStyles.medium20Black),
        centerTitle: false,
      ),
      body: questions.isEmpty
          ? const Center(child: Text("No answer data available"))
          : ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              itemCount: questions.length,
              itemBuilder: (context, index) {
                final question = questions[index];
                return _buildQuestionCard(context, question, index);
              },
            ),
    );
  }

  Widget _buildQuestionCard(
    BuildContext context,
    AnsweredQuestionEntity question,
    int index,
  ) {
    final bool isFirstQuestion = index == 0;
    final bool isAnswered = question.selectedAnswerKey != null;

    return Container(
      margin: EdgeInsets.only(top: isFirstQuestion ? 0 : 16, bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Question header with dashed border for first question (matching design)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isFirstQuestion
                  ? AppTheme.blue.withAlpha(8)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(12),
              border: isFirstQuestion
                  ? Border.all(color: AppTheme.blue.withAlpha(80), width: 1.5)
                  : null,
            ),
            child: Text(
              question.questionText,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppTheme.black,
              ),
            ),
          ),
          const SizedBox(height: 12),
          // Answer options
          ...question.options.map((option) {
            return _buildAnswerOption(
              option: option,
              question: question,
              isAnswered: isAnswered,
            );
          }),
        ],
      ),
    );
  }

  Widget _buildAnswerOption({
    required AnswerOptionEntity option,
    required AnsweredQuestionEntity question,
    required bool isAnswered,
  }) {
    final bool isCorrectOption = option.key == question.correctAnswerKey;
    final bool isSelectedOption = option.key == question.selectedAnswerKey;
    final bool isWrongSelected = isSelectedOption && !isCorrectOption;

    // Determine option styling
    Color backgroundColor;
    Color borderColor;
    Color textColor;
    IconData? leadingIcon;
    Color? iconColor;

    if (isCorrectOption) {
      // This is the correct answer — always highlight green
      backgroundColor = const Color(0xFFE8F5E9);
      borderColor = AppTheme.green;
      textColor = AppTheme.black;
      leadingIcon = Icons.check_box;
      iconColor = AppTheme.green;
    } else if (isWrongSelected) {
      // User selected this but it's wrong — highlight red
      backgroundColor = const Color(0xFFFFEBEE);
      borderColor = AppTheme.red;
      textColor = AppTheme.black;
      leadingIcon = Icons.cancel;
      iconColor = AppTheme.red;
    } else {
      // Unselected / neutral option
      backgroundColor = AppTheme.white;
      borderColor = Colors.grey.shade300;
      textColor = AppTheme.black;
      leadingIcon = Icons.check_box_outline_blank;
      iconColor = Colors.grey.shade400;
    }

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor, width: 1.5),
      ),
      child: Row(
        children: [
          Icon(leadingIcon, color: iconColor, size: 22),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              option.text ?? '',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: textColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
