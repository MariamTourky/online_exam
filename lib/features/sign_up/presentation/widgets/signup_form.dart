import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../config/constants/app_constants.dart';
import '../../../../config/routes/route_names.dart';
import '../../../../config/theme/app_text_styles.dart';
import '../../../../core/utils/validators/validators.dart';
import '../../../../core/widgets/custom_navigation_text.dart';
import '../manager/signup_cubit.dart';
import '../manager/signup_intents.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../core/widgets/password_text_form_field.dart';
import '../../../../core/widgets/custom_button.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignupCubit>();

    return Form(
      key: cubit.formKey,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CustomTextFormField(
              controller: cubit.usernameController,
              label: AppConstants.userName,
              hint: AppConstants.enterYourEmail,
              validator: Validators.validateName,
              onChanged: (_) => cubit.doIntent(SignupIntent.formChanged),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: CustomTextFormField(
                    controller: cubit.firstNameController,
                    label: AppConstants.firstName,
                    hint: AppConstants.enterYourfirstName,
                    validator: Validators.validateName,
                    onChanged: (_) => cubit.doIntent(SignupIntent.formChanged),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: CustomTextFormField(
                    controller: cubit.lastNameController,
                    label: AppConstants.lastName,
                    hint: AppConstants.enterYourlastName,
                    validator: Validators.validateName,
                    onChanged: (_) => cubit.doIntent(SignupIntent.formChanged),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            CustomTextFormField(
              controller: cubit.emailController,
              label: AppConstants.email,
              hint: AppConstants.enterYourEmail,
              validator: Validators.validateEmail,
              keyboardType: TextInputType.emailAddress,
              onChanged: (_) => cubit.doIntent(SignupIntent.formChanged),
            ),
            const SizedBox(height: 16),
            BlocBuilder<SignupCubit, SignupState>(
              buildWhen: (p, c) =>
                  p.togglePasswordVisibility != c.togglePasswordVisibility ||
                  p.toggleRePasswordVisibility != c.toggleRePasswordVisibility,
              builder: (context, state) {
                return Column(
                  children: [
                    PasswordTextFormField(
                      controller: cubit.passwordController,
                      label: AppConstants.password,
                      hint: AppConstants.enterYourPassword,
                      isVisible: state.togglePasswordVisibility,
                      onToggleVisibility: () =>
                          cubit.doIntent(SignupIntent.togglePasswordVisibility),
                      validator: Validators.validatePassword,
                      onChanged: (_) =>
                          cubit.doIntent(SignupIntent.formChanged),
                    ),
                    const SizedBox(height: 16),
                    PasswordTextFormField(
                      controller: cubit.rePasswordController,
                      label: AppConstants.confirmPassword,
                      hint: AppConstants.confirmPassword,
                      isVisible: state.toggleRePasswordVisibility,
                      onToggleVisibility: () => cubit.doIntent(
                        SignupIntent.toggleRePasswordVisibility,
                      ),
                      validator: (v) => Validators.validateRePassword(
                        v,
                        cubit.passwordController.text,
                      ),
                      onChanged: (_) =>
                          cubit.doIntent(SignupIntent.formChanged),
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 16),
            CustomTextFormField(
              controller: cubit.phoneController,
              label: AppConstants.phoneNumber,
              hint: AppConstants.enterYourPhoneNumber,
              validator: Validators.validatePhone,
              keyboardType: TextInputType.phone,
              textInputAction: TextInputAction.done,
              onChanged: (_) => cubit.doIntent(SignupIntent.formChanged),
            ),
            const SizedBox(height: 24),
            BlocBuilder<SignupCubit, SignupState>(
              buildWhen: (p, c) =>
                  p.isLoading != c.isLoading || p.isFormValid != c.isFormValid,
              builder: (context, state) {
                return CustomButton(
                  isEnabled: state.isFormValid,
                  isLoading: state.isLoading,
                  text: AppConstants.signup,
                  onPressed: () => cubit.doIntent(SignupIntent.submit),
                );
              },
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Row(
                children: [
                  Text(AppConstants.alreadyHaveAccount,style: AppTextStyles.baseRegularBlack,),
                  const SizedBox(width: 8),
                  CustomNavigationText(
                    text: AppConstants.login,
                    navigateTo: () => context.go(RouteNames.login),
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
