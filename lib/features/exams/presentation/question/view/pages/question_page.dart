import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/core/di/config/di.dart';
import 'package:online_exam/features/exams/domain/entities/exam_model.dart';
import 'package:online_exam/features/exams/presentation/question/view/screens/question_screen.dart';
import 'package:online_exam/features/exams/presentation/question/view_model/cubit/question_cubit.dart';
import 'package:online_exam/features/exams/presentation/question/view_model/cubit/question_intent.dart';

class QuestionPage extends StatelessWidget {
  final ExamModel exam;
  const QuestionPage({super.key, required this.exam});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<QuestionCubit>()
            ..doIntent(LoadExamIntent(examId: exam.id ?? "", exam: exam)),
      child: const QuestionScreen(),
    );
  }
}
