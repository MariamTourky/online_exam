import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:online_exam/config/routes/route_names.dart';
import 'package:online_exam/config/theme/app_text_styles.dart';
import 'package:online_exam/features/exams/domain/entities/exam_model.dart';
import 'package:online_exam/features/exams/presentation/exam/view_model/cubit/exams_cubit.dart';

class ExamDescription extends StatelessWidget {
  final String subjectId;
  final ExamModel exam;
  const ExamDescription({
    super.key,
    required this.subjectId,
    required this.exam,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ExamsCubit, ExamsState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 70,
            title: Text(exam.title!, style: AppTextStyles.medium20Black),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => context.pop(),
            ),
          ),
          body: Column(
            children: [
              Text('Instuctions'),
              Text(
                'Lorem ipsum dolor sit amet consectetur. Vestibulum sed est sed magna egestas gravida. Aliquam in tortor eu sem rhoncus pretium sit amet sed dolor.',
                style: AppTextStyles.baseMedium16,
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  context.push(RouteNames.question, extra: subjectId);
                },
                child: const Text('start exam'),
              ),
            ],
          ),
        );
      },
    );
  }
}
