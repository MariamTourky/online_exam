import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/config/constants/app_constants.dart';
import 'package:online_exam/config/theme/app_text_styles.dart';
import 'package:online_exam/core/utils/show_snak_bar.dart';
import 'package:online_exam/features/subjects/presentation/cubit/cubit/subject_cubit.dart';
import 'package:online_exam/features/subjects/presentation/cubit/cubit/subject_intent.dart';

class SubjectScreen extends StatefulWidget {
  const SubjectScreen({super.key});

  @override
  State<SubjectScreen> createState() => _SubjectScreenState();
}

class _SubjectScreenState extends State<SubjectScreen> {
  @override
  void initState() {
    super.initState();
    context.read<SubjectCubit>().doIntent(GetAllSubjectsIntent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        surfaceTintColor: Colors.transparent,
        title: const Text(
          AppConstants.subjects,
          style: AppTextStyles.medium20Black,
        ),
      ),
      body: BlocBuilder<SubjectCubit, SubjectState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.error != null) {
            showAppSnackbar(context, state.error!, isError: true);
          }
          if (state.subjects.isEmpty) {
            return const Center(child: Text("No subjects available"));
          }
          return ListView.builder(
            itemCount: state.subjects.length,
            padding: const EdgeInsets.all(16),
            itemBuilder: (context, index) {
              final subject = state.subjects[index];
              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                child: ListTile(
                  leading: subject.icon != null
                      ? Image.network(
                          subject.icon!,
                          width: 40,
                          height: 40,
                          errorBuilder: (context, error, stackTrace) =>
                              const Icon(Icons.book),
                        )
                      : const Icon(Icons.book),
                  title: Text(subject.name),
                  subtitle: Text("ID: ${subject.id}"),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
