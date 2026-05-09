import 'package:flutter/material.dart';
import 'package:online_exam/features/exams/presentation/question/view/screens/question_screen.dart';

class QuestionPage extends StatelessWidget {
  final String examId;
  const QuestionPage({super.key, required this.examId});

  @override
  Widget build(BuildContext context) {
    return const QuestionScreen();
  }
}
