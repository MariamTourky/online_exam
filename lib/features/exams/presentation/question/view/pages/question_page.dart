import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/features/exams/presentation/exam/view/screens/exam_screen.dart';
import 'package:online_exam/features/exams/presentation/question/view_model/cubit/question_cubit.dart';

class QuestionPage extends StatelessWidget {
  final String examId;
  const QuestionPage({super.key,required this.examId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuestionCubit(),
      child: const ExamScreen(),
    );
  }
}
