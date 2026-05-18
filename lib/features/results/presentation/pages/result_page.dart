import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/core/di/config/di.dart';
import 'package:online_exam/features/results/presentation/cubit/result_intent.dart';
import 'package:online_exam/features/results/presentation/cubit/results_cubit.dart';
import 'package:online_exam/features/results/presentation/pages/results_screen.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key, this.subjectId});
  final String? subjectId;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ResultsCubit>()..doIntent(LoadResultIntent()),
      child: const ResultsScreen(),
    );
  }
}
