import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/core/di/config/di.dart';
import 'package:online_exam/features/exams/presentation/view/screens/exam_screen.dart';
import 'package:online_exam/features/exams/presentation/view_model/cubit/exams_cubit.dart';

import 'package:online_exam/features/exams/presentation/view_model/cubit/exam_intent.dart';

class ExamPage extends StatelessWidget {
  final String? subjectId;
  const ExamPage({super.key, this.subjectId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cubit = getIt<ExamsCubit>();
        if (subjectId != null) {
          cubit.doIntent(GetAllExamsOnSubjectIntent(subjectId!));
        }
        return cubit;
      },
      child: const ExamScreen(),
    );
  }
}
