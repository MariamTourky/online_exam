import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:online_exam/config/constants/app_constants.dart';
import 'package:online_exam/config/routes/route_names.dart';
import 'package:online_exam/config/theme/app_text_styles.dart';
import 'package:online_exam/config/theme/app_theme.dart';
import 'package:online_exam/features/subjects/presentation/view_model/cubit/subject_cubit.dart';
import 'package:online_exam/features/subjects/presentation/view_model/cubit/subject_intent.dart';

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
    return BlocConsumer<SubjectCubit, SubjectState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Column(
          children: [
            AppBar(
              toolbarHeight: 70,
              surfaceTintColor: Colors.transparent,
              title: const Text(
                AppConstants.survey,
                style: AppTextStyles.medium20Black,
              ),
              automaticallyImplyLeading: false,
            ),
            Expanded(child: _buildBody(state)),
          ],
        );
      },
    );
  }

  Widget _buildBody(SubjectState state) {
    double height = MediaQuery.of(context).size.height;
    if (state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    } else if (state.subjects.isEmpty) {
      return const Center(child: Text(AppConstants.noSubjectsFound));
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          SearchBar(
            hintText: AppConstants.search,
            onChanged: (value) {},
            padding: const WidgetStatePropertyAll(
              EdgeInsets.symmetric(horizontal: 16),
            ),
            elevation: const WidgetStatePropertyAll(0),
            backgroundColor: WidgetStatePropertyAll(
              AppTheme.gray.withAlpha(50),
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            AppConstants.browseBySubjects,
            style: AppTextStyles.medium20Black,
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: state.subjects.length,
              padding: const EdgeInsets.only(bottom: 16),
              itemBuilder: (context, index) {
                final subject = state.subjects[index];
                return Card(
                  elevation: 0,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(color: Colors.grey[200]!),
                  ),
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(12),
                    minTileHeight: height * 0.1,
                    leading: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.blue[50],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: subject.icon != null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                subject.icon!,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) =>
                                    const Icon(Icons.book, color: Colors.blue),
                              ),
                            )
                          : const Icon(Icons.book, color: Colors.blue),
                    ),
                    title: Text(
                      subject.name,
                      style: AppTextStyles.baseMedium16,
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      context.push(RouteNames.exams, extra: subject.id);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
