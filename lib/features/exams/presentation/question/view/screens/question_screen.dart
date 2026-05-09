
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:online_exam/config/theme/app_text_styles.dart';
import 'package:online_exam/config/theme/app_theme.dart';
import 'package:online_exam/features/exams/presentation/question/view_model/cubit/question_cubit.dart';
import 'package:online_exam/features/exams/presentation/question/view_model/cubit/question_intent.dart';
import 'package:timer_builder/timer_builder.dart';

class QuestionScreen extends StatelessWidget {
  const QuestionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        title: Text("Exam", style: AppTextStyles.medium20Black),

        // lib/features/exams/presentation/question/view/screens/question_screen.dart
        actions: [
          BlocBuilder<QuestionCubit, QuestionState>(
            builder: (context, state) {
              return TimerBuilder.periodic(
                const Duration(seconds: 1),
                builder: (context) {
                  final duration = state.exam?.duration ?? 0;
                  return Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Center(
                      child: Row(
                        children: [
                          const Icon(
                            Icons.timer_outlined,
                            color: AppTheme.green,
                            size: 20,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            "$duration:00",
                            style: AppTextStyles.medium20Black.copyWith(
                              color: AppTheme.green,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ],

        toolbarHeight: 70,
        surfaceTintColor: Colors.transparent,
        automaticallyImplyLeading: false,
      ),
      body: BlocBuilder<QuestionCubit, QuestionState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.errorMessage != null) {
            return Center(child: Text(state.errorMessage!));
          }
          if (state.questions.isEmpty) {
            return const Center(child: Text('No questions found'));
          }

          return ListView.builder(
            itemCount: state.questions.length,
            padding: const EdgeInsets.all(16),
            itemBuilder: (context, index) {
              final question = state.questions[index];
              return Card(
                margin: const EdgeInsets.only(bottom: 16),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Question ${index + 1}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppTheme.blue,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        question.question ?? "",
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 16),
                      // Assuming answer is a list of objects with an 'answer' field
                      ...(question.answer?.map((ans) {
                            final answerText = (ans is Map)
                                ? ans['answer']
                                : ans.toString();
                            return RadioListTile(
                              title: Text(answerText),
                              value: answerText,
                              selectedTileColor: AppTheme.blue.withAlpha(20),
                              minLeadingWidth: mediaQuery.size.width * 0.1,
                              selected: answerText == question.selectedAnswer,
                              groupValue: question.selectedAnswer,
                              onChanged: (value) {
                                context.read<QuestionCubit>().doIntent(
                                  SelectAnswerStateIntent(
                                    questionId: question.id.toString(),
                                    answer: value.toString(),
                                  ),
                                );
                              },
                            );
                          }).toList() ??
                          []),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
