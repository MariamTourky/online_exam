import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:online_exam/config/constants/app_constants.dart';
import 'package:online_exam/core/widgets/custom_text_form_field.dart';
import 'package:online_exam/core/widgets/password_text_form_field.dart';

import '../../../../config/routes/route_names.dart';
import '../../../../config/theme/app_text_styles.dart';
import '../../../../core/utils/validators/validators.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_navigation_text.dart';
import '../manager/login_cubit.dart';
import '../manager/login_intents.dart';


class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();

    return Form(
      key: cubit.formKey,
      onChanged: () => cubit.doIntent(LoginIntent.formChanged),
      child: Padding(
        padding: const EdgeInsets.only(top: 24.0,right: 16,left: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomTextFormField(
              controller: cubit.emailController,
              label: AppConstants.email,
              hint: AppConstants.enterYourEmail,
              validator: Validators.validateEmail,
            ),

            const SizedBox(height: 16),

            BlocBuilder<LoginCubit, LoginState>(
              buildWhen: (p, c) =>
              p.togglePasswordVisibility != c.togglePasswordVisibility,
              builder: (context, state) {
                return PasswordTextFormField(
                  controller: cubit.passwordController,
                  label: AppConstants.password,
                  hint: AppConstants.enterYourPassword,
                  isVisible: state.togglePasswordVisibility,
                  onToggleVisibility: () =>
                      cubit.doIntent(LoginIntent.togglePasswordVisibility),
                  validator: Validators.validatePassword,
                );
              },
            ),

            const SizedBox(height: 16),

            Align(
              alignment: AlignmentGeometry.bottomRight,
              child: CustomNavigationText(
                text: AppConstants.forgetPassword,
                navigateTo: () => context.go(RouteNames.forgetPassword),
              ),
            ),
            const SizedBox(height: 24),

            BlocBuilder<LoginCubit, LoginState>(
              buildWhen: (p, c) =>
              p.isFormValid != c.isFormValid ||
                  p.isLoading != c.isLoading,
              builder: (context, state) {
                return CustomButton(
                  text: AppConstants.login,
                  isEnabled: state.isFormValid && !state.isLoading,
                  isLoading: state.isLoading,
                  onPressed: () => cubit.doIntent(LoginIntent.submit),
                );
              },
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Row(
                children: [
                  Text(AppConstants.dontHaveAccount,style: AppTextStyles.baseRegularBlack,),
                  const SizedBox(width: 8),
                  CustomNavigationText(
                    text: AppConstants.signup,
                    navigateTo: () => context.go(RouteNames.signup),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}