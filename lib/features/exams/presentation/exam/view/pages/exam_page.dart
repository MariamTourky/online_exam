import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/core/di/config/di.dart';
import 'package:online_exam/features/exams/presentation/exam/view/screens/exam_screen.dart';
import 'package:online_exam/features/exams/presentation/exam/view_model/cubit/exams_cubit.dart';

class ExamPage extends StatelessWidget {
  final String? subjectId;
  const ExamPage({super.key, this.subjectId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cubit = getIt<ExamsCubit>();
        return cubit;
      },
      child: const ExamScreen(),
    );
  }
}
