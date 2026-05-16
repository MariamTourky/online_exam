import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/config/constants/app_assets.dart';
import 'package:online_exam/config/theme/app_text_styles.dart';
import 'package:online_exam/config/theme/app_theme.dart';
import 'package:go_router/go_router.dart';
import 'package:online_exam/config/routes/route_names.dart';
import 'package:online_exam/features/results/domain/entities/result_entity.dart';
import 'package:online_exam/features/results/presentation/cubit/result_intent.dart';
import 'package:online_exam/features/results/presentation/cubit/results_cubit.dart';

class ResultsScreen extends StatefulWidget {
  const ResultsScreen({super.key});

  @override
  State<ResultsScreen> createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ResultsCubit>().doIntent(LoadResultIntent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResultsCubit, ResultsState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (state.errorMessage != null) {
          return Scaffold(body: Center(child: Text(state.errorMessage!)));
        }

        final results = state.allResults;

        return Scaffold(
          backgroundColor: AppTheme.white,
          appBar: AppBar(
            backgroundColor: AppTheme.white,
            elevation: 0,
            surfaceTintColor: Colors.transparent,
            title: Text("Results", style: AppTextStyles.medium20Black),
            centerTitle: false,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: AppTheme.black),
              onPressed: () => context.go(RouteNames.home),
            ),
          ),
          body: results.isEmpty
              ? const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.assignment_outlined,
                        size: 64,
                        color: AppTheme.lightGray,
                      ),
                      SizedBox(height: 16),
                      Text(
                        'No results yet',
                        style: TextStyle(
                          fontSize: 18,
                          color: AppTheme.lightGray,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Complete an exam to see your results here',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppTheme.lightGray,
                        ),
                      ),
                    ],
                  ),
                )
              : _buildResultsList(context, results),
        );
      },
    );
  }

  Widget _buildResultsList(BuildContext context, List<ResultEntity> results) {
    // Group results by subject
    final grouped = <String, List<ResultEntity>>{};
    for (final result in results) {
      final subject = result.examTitle;
      grouped.putIfAbsent(subject, () => []);
      grouped[subject]!.add(result);
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      itemCount: grouped.keys.length,
      itemBuilder: (context, index) {
        final subject = grouped.keys.elementAt(index);
        final subjectResults = grouped[subject]!;
        return _buildSubjectSection(context, subject, subjectResults);
      },
    );
  }

  Widget _buildSubjectSection(
    BuildContext context,
    String subject,
    List<ResultEntity> results,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Text(
          subject,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppTheme.black,
          ),
        ),
        const SizedBox(height: 12),
        ...results.map((result) => _buildResultCard(context, result)),
      ],
    );
  }

  Widget _buildResultCard(BuildContext context, ResultEntity result) {
    final percentage = result.totalQuestions > 0
        ? (result.correctAnswers / result.totalQuestions * 100).toInt()
        : 0;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppTheme.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.blue.withAlpha(40)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(10),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: AppTheme.transparent,
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {
            // Navigate to answers review
            if (result.answeredQuestions != null &&
                result.answeredQuestions!.isNotEmpty) {
              context.push(RouteNames.answers, extra: result);
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                // Subject icon
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: AppTheme.blue.withAlpha(20),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Image.asset(AppAssets.examCard),
                ),
                const SizedBox(width: 12),
                // Exam info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              result.examTitle,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: AppTheme.black,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          if (result.duration != null)
                            Text(
                              "${result.duration} Minutes",
                              style: const TextStyle(
                                fontSize: 12,
                                color: AppTheme.blue,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "${result.totalQuestions} Questions",
                        style: const TextStyle(
                          fontSize: 13,
                          color: AppTheme.lightGray,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          _buildScoreBadge(percentage),
                          const SizedBox(width: 8),
                          Text(
                            "${result.correctAnswers} correct answers",
                            style: const TextStyle(
                              fontSize: 12,
                              color: AppTheme.green,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildScoreBadge(int percentage) {
    final color = percentage >= 70
        ? AppTheme.green
        : percentage >= 40
        ? AppTheme.yellow
        : AppTheme.red;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withAlpha(25),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        "$percentage%",
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: color,
        ),
      ),
    );
  }
}
