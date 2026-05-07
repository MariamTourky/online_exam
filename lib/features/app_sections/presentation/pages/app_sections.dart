import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/di/config/di.dart';
import 'package:online_exam/features/app_sections/presentation/manager/app_section_cubit.dart';
import 'package:online_exam/features/app_sections/presentation/widgets/app_section_view.dart';

@injectable
class AppSections extends StatelessWidget {
  const AppSections({super.key});

  @override
  Widget build(BuildContext context) {
    final AppSectionCubit appSectionCubit = getIt<AppSectionCubit>();

    return BlocProvider<AppSectionCubit>(
      create: (_) => appSectionCubit,
      child: AppSectionsView(),
    );
  }
}
