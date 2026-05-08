import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/features/exams/presentation/view_model/cubit/exams_cubit.dart';

class  ExamScreen extends StatelessWidget {
  const ExamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ExamsCubit>();
    return Scaffold(
      appBar: AppBar(),
      body: CustomScrollView(),
    );
  }
}