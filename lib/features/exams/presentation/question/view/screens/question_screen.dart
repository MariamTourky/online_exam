import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:online_exam/config/routes/route_names.dart';
import 'package:online_exam/config/theme/app_text_styles.dart';
import 'package:online_exam/config/theme/app_theme.dart';
import 'package:online_exam/features/exams/presentation/question/view_model/cubit/question_cubit.dart';
import 'package:online_exam/features/exams/presentation/question/view_model/cubit/question_intent.dart';

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

        actions: [
          BlocConsumer<QuestionCubit, QuestionState>(
            listener: (context, state) {},
            buildWhen: (previous, current) =>
                previous.remainingTime != current.remainingTime,
            builder: (context, state) {
              final remainingSeconds = state.remainingTime ?? 0;
              final minutes = remainingSeconds ~/ 60;
              final seconds = remainingSeconds % 60;
              final timeString =
                  "${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
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
                        timeString,
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

          return PageView.builder(
            controller: context.read<QuestionCubit>().pageController,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.questions.length,
            itemBuilder: (context, index) {
              final question = state.questions[index];
              return Card(
                color: AppTheme.white,
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
                      ...(question.answer?.map((ans) {
                            final answerText = ans.answer ?? "";
                            return RadioListTile<String>(
                              title: Text(answerText),
                              value: answerText,
                              selectedTileColor: AppTheme.blue.withAlpha(20),
                              minLeadingWidth: mediaQuery.size.width * 0.1,
                              selected: answerText == question.selectedAnswer,
                              groupValue: question.selectedAnswer,
                              onChanged: (value) {
                                String? selectedAnswer;
                                selectedAnswer = value;
                                debugPrint(selectedAnswer.toString());
                                if (value != null) {
                                  context.read<QuestionCubit>().doIntent(
                                    SelectAnswerStateIntent(
                                      questionId: question.id.toString(),
                                      answer: value,
                                    ),
                                  );
                                }
                                debugPrint(state.questions.toString());
                                debugPrint(question.selectedAnswer.toString());
                              },
                            );
                          }).toList() ??
                          []),
                      SizedBox(height: mediaQuery.size.height * 0.2),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppTheme.white,
                                side: const BorderSide(
                                  color: AppTheme.blue,
                                  width: 2,
                                ),
                              ),
                              onPressed: () {
                                context.read<QuestionCubit>().doIntent(
                                  PreviousQuestionIntent(),
                                );
                              },
                              child: const Text(
                                "Back",
                                style: TextStyle(color: AppTheme.blue),
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),

                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                if (state.currentIndex ==
                                    state.questions.length - 1) {
                                  final hasUnanswered = state.questions.any(
                                    (q) => q.selectedAnswer == null,
                                  );
                                  if (hasUnanswered) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          "Please answer all questions before submitting!",
                                        ),
                                        backgroundColor: Colors.red,
                                      ),
                                    );
                                  } else if (hasUnanswered == false) {
                                    final cubit = context.read<QuestionCubit>();
                                    showDialog(
                                      context: context,
                                      builder: (dialogContext) {
                                        return AlertDialog(
                                          title: const Text("Submit Exam"),
                                          content: const Text(
                                            "Are you sure you want to submit the exam?",
                                          ),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(dialogContext);
                                              },
                                              child: const Text("No"),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                cubit.doIntent(
                                                  SubmitExamIntent(),
                                                );
                                                Navigator.pop(dialogContext);
                                                context.go(
                                                  RouteNames.results,
                                                  extra: {
                                                    'exam': state.exam,
                                                    'questions':
                                                        state.questions,
                                                  },
                                                );
                                              },
                                              child: const Text("Yes"),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  }
                                } else {
                                  context.read<QuestionCubit>().doIntent(
                                    NextQuestionIntent(),
                                  );
                                }
                              },
                              child: Text(
                                state.currentIndex == state.questions.length - 1
                                    ? "Submit"
                                    : "Next",
                                style: const TextStyle(color: AppTheme.white),
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                        ],
                      ),
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
