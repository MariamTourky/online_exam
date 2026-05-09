import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:online_exam/features/exams/presentation/exam/view_model/cubit/exam_intent.dart';
import 'package:online_exam/features/exams/presentation/exam/view_model/cubit/exams_cubit.dart';
import 'package:online_exam/features/exams/presentation/question/view_model/cubit/question_cubit.dart';
import 'package:percent_indicator/percent_indicator.dart';

class QuestionScreen extends StatelessWidget {
  const QuestionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            context.read<ExamsCubit>().doIntent(
              SelectExamIntent(
                context.watch<QuestionCubit>().state.exam?.subject ?? "",
              ),
            );
            context.pop();
          },
        ),
      ),
    );

    // bottom: PreferredSize(
    //   preferredSize: Size.fromHeight(mediaQuery.size.height * 0.1),
    //   child: MultiSegmentLinearIndicator(
    //     segments: const [
    //       {'title': 'Segment 1', 'subtitle': 'subtitle 1', 'progress': 0.8},
    //       {'title': 'Segment 2', 'subtitle': 'subtitle 2', 'progress': 1.0},
    //       {'title': 'Segment 3', 'subtitle': 'subtitle 3', 'progress': 0.2},
    //     ],
    //     completedIndicatorColor: Colors.green,
    //     activeIndicatorColor: Colors.yellow,
    //     incompletedIndicatorColor: Colors.grey,
    //     gap: 8,
    //     height: 8,
    //   ),
    // ),
    //   title: Text(context.watch<QuestionCubit>().state.exam?.title ?? ""),
    //   : PreferredSize(
    //     preferredSize: Size.fromHeight(mediaQuery.size.height * 0.1),
    //     child: Row(
    //       children: [
    //         Text(context.watch<QuestionCubit>().state.exam?.id ?? ""),
    //         Text(
    //           context
    //                   .watch<QuestionCubit>()
    //                   .state
    //                   .exam
    //                   ?.duration
    //                   .toString() ??
    //               "",
    //         ),
    //         Text(
    //           context
    //                   .watch<QuestionCubit>()
    //                   .state
    //                   .exam
    //                   ?.numberOfQuestions
    //                   .toString() ??
    //               "",
    //         ),
    //       ],
    //     ),
    //   ),
    // ),
    //   body: context.watch<QuestionCubit>().state.exam != null
    //       ? ListView.builder(
    //           itemCount: context.watch<QuestionCubit>().state.questions!.exam,
    //           itemBuilder: (context, index) {
    //             final question = context
    //                 .watch<QuestionCubit>()
    //                 .state
    //                 .questions!;
    //             return ListTile(
    //               title: Text(question.question.toString() ?? ""),
    //             );
    //           },
    //         )
    //       : const Center(child: Text('No questions found')),
    // );
  }
}
