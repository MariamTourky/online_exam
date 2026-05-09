import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:online_exam/config/constants/app_assets.dart';
import 'package:online_exam/config/constants/app_constants.dart';
import 'package:online_exam/config/routes/route_names.dart';
import 'package:online_exam/config/theme/app_text_styles.dart';
import 'package:online_exam/core/utils/show_snak_bar.dart';
import 'package:online_exam/features/exams/presentation/view_model/cubit/exams_cubit.dart';

class ExamScreen extends StatefulWidget {
  const ExamScreen({super.key});

  @override
  State<ExamScreen> createState() => _ExamScreenState();
}

class _ExamScreenState extends State<ExamScreen> {
  @override
  void initState() {
    super.initState();
    // Note: Exams usually require a subjectId. If no subjectId is provided (like in the bottom nav tab),
    // we might need a default or a general exams fetch.
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
        return Column(
          children: [
            AppBar(
              actions: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    context.go(RouteNames.subjects);
                  },
                ),
              ],
              title: Text(
                state.title ?? "Exams",
                style: AppTextStyles.medium20Black,
              ),
              toolbarHeight: 70,
              surfaceTintColor: Colors.transparent,
              automaticallyImplyLeading: false,
            ),
            Expanded(child: _buildBody(state)),
          ],
        );
      },
    );
  }

  Widget _buildBody(ExamsState state) {
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
            title: Text(exam.title ?? '', style: AppTextStyles.baseMedium16),
            leading: Image.asset(
              AppAssets.examCard,
              width: 40,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.assignment, color: Colors.blue),
            ),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {},
          ),
        );
      },
    );
  }
}
