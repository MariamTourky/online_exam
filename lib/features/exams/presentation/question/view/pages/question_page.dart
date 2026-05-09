import 'package:flutter/material.dart';
import 'package:online_exam/features/exams/domain/entities/exam_model.dart';
import 'package:online_exam/features/exams/presentation/question/view/screens/question_screen.dart';

class QuestionPage extends StatelessWidget {
  final ExamModel exam;
  const QuestionPage({super.key, required this.exam});

  @override
  Widget build(BuildContext context) {
    return const QuestionScreen();
  }
}
