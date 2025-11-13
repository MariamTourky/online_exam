import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../config/constants/app_constants.dart';
import '../../../../config/constants/schaffold_messages.dart';
import '../../../../config/routes/route_names.dart';
import '../../../../config/theme/app_text_styles.dart';
import '../../../../core/utils/show_snak_bar.dart';
import '../manager/reset_password/reset_password_cubit.dart';
import '../widgets/reset_password_form.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ResetPasswordCubit, ResetPasswordState>(
        listener: (context, state) {
          if (state.errorMessage != null && state.errorMessage!.isNotEmpty) {
            showAppSnackbar(context, state.errorMessage!, isError: true);
          }
          if (state.success) {
            showAppSnackbar(context, SchaffoldMessages.updatePasswordScuccessfully);
            context.go(RouteNames.login);
          }
        },
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 70,
            surfaceTintColor: Colors.transparent,
            titleSpacing: 0,
            title: const Text(
                AppConstants.password,
                style: AppTextStyles.medium20Black),
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_new),
              onPressed: () => context.pop(),
            ),
          ),
          body: ResetPasswordForm(),
        ),
    );
  }
}