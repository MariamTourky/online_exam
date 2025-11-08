import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:online_exam/features/recovery_password/presentation/manager/forget_password/forget_password_cubit.dart';
import 'package:online_exam/features/recovery_password/presentation/widgets/forget_password_form.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../config/constants/app_constants.dart';
import '../../../../config/constants/schaffold_messages.dart';
import '../../../../config/theme/app_text_styles.dart';
import '../../../../core/utils/show_snak_bar.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
      listener: (context, state) {
        if (state.errorMessage != null && state.errorMessage!.isNotEmpty) {
          showAppSnackbar(context, state.errorMessage!, isError: true);
        }
        if (state.success) {
          showAppSnackbar(context,SchaffoldMessages.codeSenttoyourEmail );
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
            icon: Icon(Icons.arrow_back_ios_new), // choose any icon you like
            onPressed: () => context.pop(),
          ),
        ),
        body: ForgetPasswordForm(),
      ),
    );
  }
}
