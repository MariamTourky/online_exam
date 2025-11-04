import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/config/constants/app_constants.dart';
import 'package:online_exam/core/widgets/custom_text_form_field.dart';
import 'package:online_exam/core/widgets/password_text_form_field.dart';

import '../../../../core/utils/validators/validators.dart';
import '../../../../core/widgets/custom_button.dart';
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
        ],
      ),
    );
  }
}