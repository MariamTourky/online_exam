import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/core/di/config/di.dart';
import 'package:online_exam/features/subjects/presentation/view_model/cubit/subject_cubit.dart';
import 'package:online_exam/features/subjects/presentation/views/screens/subject_screen.dart';

class SubjectsPage extends StatelessWidget {
  const SubjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SubjectCubit>(),
      child: const SubjectScreen(),
    );
  }
}
