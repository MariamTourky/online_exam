import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:online_exam/config/constants/app_constants.dart';
import 'package:online_exam/config/theme/app_text_styles.dart';
import 'package:online_exam/core/utils/validators/validators.dart';
import 'package:online_exam/core/widgets/custom_button.dart';
import 'package:online_exam/core/widgets/custom_text_form_field.dart';

import '../../../../config/routes/route_names.dart';
import '../manager/forget_password/forget_password_cubit.dart';

class ForgetPasswordForm extends StatelessWidget {
  const ForgetPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
      listenWhen: (previous, current) =>
      previous.success != current.success && current.success,
      listener: (context, state) {
        final email = context.read<ForgetPasswordCubit>().emailController.text.trim();
        context.push(
          RouteNames.emailVerification,
          extra: email,
        );
      },
      child: BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
        builder: (context, state) {
          final cubit = context.read<ForgetPasswordCubit>();
          return Form(
            key: cubit.formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  Text(AppConstants.forgetPassword, style: AppTextStyles.medium20Black),
                  const SizedBox(height: 16),
                  Text(
                    textAlign: TextAlign.center,
                    AppConstants.pleaseEnterAssociatedEmail,
                    style: AppTextStyles.baseRegular14,
                  ),

                  const SizedBox(height: 30),
                  CustomTextFormField(
                    controller: cubit.emailController,
                    label: AppConstants.email,
                    hint: AppConstants.enterYourEmail,
                    validator: Validators.validateEmail,
                    onChanged: (_) =>
                        cubit.doIntent(ForgetPasswordIntent.formChanged),
                  ),
                  const SizedBox(height: 40),
                  CustomButton(
                    isEnabled: state.isFormValid,
                    isLoading: state.isLoading,
                    text: AppConstants.continueText,
                    onPressed: () => cubit.doIntent(ForgetPasswordIntent.submit),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}