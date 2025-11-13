import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:online_exam/config/constants/app_constants.dart';
import 'package:online_exam/config/routes/route_names.dart';
import 'package:online_exam/core/utils/validators/validators.dart';
import '../../../../config/theme/app_text_styles.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../core/widgets/password_text_form_field.dart';

import '../../../../core/widgets/custom_button.dart';
import '../manager/reset_password/reset_password_cubit.dart';
import '../manager/reset_password/reset_password_intents.dart';

class ResetPasswordForm extends StatelessWidget {
  const ResetPasswordForm({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ResetPasswordCubit>();

    return Form(
      key: cubit.formKey,
      onChanged: () => cubit.doIntent(ResetPasswordIntent.formChanged),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 15),
            const Text(
              AppConstants.resetPassword,
              style: AppTextStyles.medium20Black,
            ),
            const SizedBox(height: 10),
            const Text(
              textAlign: TextAlign.center,
              AppConstants.passwordValidationMessage,
              style: AppTextStyles.baseRegular14,
            ),
            const SizedBox(height: 40),
            CustomTextFormField(
              controller: cubit.emailController,
              label: AppConstants.email,
              hint: AppConstants.enterYourEmail,
              validator: Validators.validateEmail,
            ),
            const SizedBox(height: 16),
            BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
              buildWhen: (p, c) =>
              p.togglePasswordVisibility != c.togglePasswordVisibility,
              builder: (context, state) {
                return PasswordTextFormField(
                  controller: cubit.newPasswordController,
                  label: AppConstants.newPassword,
                  hint: AppConstants.enterYourPassword,
                  isVisible: state.togglePasswordVisibility,
                  onToggleVisibility: () => cubit
                      .doIntent(ResetPasswordIntent.togglePasswordVisibility),
                  validator: Validators.validatePassword,
                );
              },
            ),
            const SizedBox(height: 32),
            BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
              buildWhen: (p, c) =>
              p.isFormValid != c.isFormValid || p.isLoading != c.isLoading,
              builder: (context, state) {
                return CustomButton(
                  text: AppConstants.resetPassword,
                  isEnabled: state.isFormValid && !state.isLoading,
                  isLoading: state.isLoading,
                  onPressed: (){
                      cubit.doIntent(ResetPasswordIntent.submit);
                 }
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}