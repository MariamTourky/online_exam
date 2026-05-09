import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:online_exam/config/constants/app_assets.dart';
import 'package:online_exam/config/constants/app_constants.dart';
import 'package:online_exam/config/routes/route_names.dart';
import 'package:online_exam/config/theme/app_text_styles.dart';
import 'package:online_exam/core/utils/show_snak_bar.dart';
import 'package:online_exam/features/exams/presentation/exam/view_model/cubit/exam_intent.dart';
import 'package:online_exam/features/exams/presentation/exam/view_model/cubit/exams_cubit.dart';

class ExamScreen extends StatefulWidget {
  const ExamScreen({super.key});

  @override
  State<ExamScreen> createState() => _ExamScreenState();
}

class _ExamScreenState extends State<ExamScreen> {
  @override
  void initState() {
    super.initState();
    final cubit = context.read<ExamsCubit>();
    cubit.doIntent(GetAllExamsOnSubjectIntent(cubit.state.id.toString()));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ExamsCubit, ExamsState>(
      listener: (context, state) {
        if (state.errorMessage != null) {
          showAppSnackbar(context, state.errorMessage!, isError: true);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Column(
            children: [
              AppBar(
                title: Text(
                  state.title ?? "Exams",
                  style: AppTextStyles.medium20Black,
                ),
                toolbarHeight: 70,
                surfaceTintColor: Colors.transparent,
                automaticallyImplyLeading: false,
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    context.pop();
                  },
                ),
              ),
              Expanded(child: _buildBody(state)),
            ],
          ),
        );
      },
    );
  }

  Widget _buildBody(ExamsState state) {
    double height = MediaQuery.of(context).size.height;
    if (state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (state.exams.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(AppConstants.noExamsFound),
            if (state.errorMessage != null)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  state.errorMessage!,
                  style: const TextStyle(color: Colors.red),
                  textAlign: TextAlign.center,
                ),
              ),
          ],
        ),
      );
    }
    return ListView.builder(
      itemCount: state.exams.length,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      itemBuilder: (BuildContext context, int index) {
        final exam = state.exams[index];
        return Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: Colors.grey[200]!),
          ),
          margin: const EdgeInsets.only(bottom: 12),
          child: ListTile(
            minTileHeight: height * 0.1,
            title: Text(exam.title ?? '', style: AppTextStyles.baseMedium16),
            leading: Image.asset(
              AppAssets.examCard,
              width: 40,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.assignment, color: Colors.blue),
            ),

            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${exam.numberOfQuestions} Questions",
                  style: AppTextStyles.baseRegular14,
                ),
              ],
            ),
            subtitle: Text(
              "${exam.duration} Minutes",
              style: AppTextStyles.baseMedium16.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: Colors.grey[500],
              ),
            ),
            onTap: () {
              context.push(RouteNames.question, extra: exam.id);
            },
          ),
        );
      },
    );
  }
}
