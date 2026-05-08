import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/core/di/config/di.dart';
import 'package:online_exam/features/exams/presentation/view/screens/exam_screen.dart';
import 'package:online_exam/features/exams/presentation/view_model/cubit/exams_cubit.dart';

class ExamPage extends StatelessWidget {
  const ExamPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ExamsCubit>(),
      child: Scaffold(body: const ExamScreen(),),

      // create: (context) => ExamsCubit(),
      // child: ExamScreen(),
    );
  }
}
