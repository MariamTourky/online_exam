import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:online_exam/features/exams/presentation/question/view_model/cubit/question_cubit.dart';
import 'package:online_exam/features/exams/presentation/question/view_model/cubit/question_intent.dart';
import 'package:percent_indicator/percent_indicator.dart';

class QuestionScreen extends StatelessWidget {
  const QuestionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
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
                          color: Colors.blue,
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
                              groupValue: null,
                              onChanged: (value) {
                                context.read<QuestionCubit>().doIntent(
                                  SubmitAnswerIntent(
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
