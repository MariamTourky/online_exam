import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../config/constants/app_constants.dart';
import '../../../../core/utils/validators/validators.dart';
import '../manager/signup_cubit.dart';
import '../manager/signup_intents.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../core/widgets/password_text_form_field.dart';
import '../../../../core/widgets/custom_button.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<SignupCubit>();

    return Form(
      key: viewModel.formKey,
      child: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CustomTextFormField(
              controller: viewModel.usernameController,
              label: AppConstants.userName,
              hint: AppConstants.enterYourEmail,
              validator: Validators.validateName,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: CustomTextFormField(
                    controller: viewModel.firstNameController,
                    label: AppConstants.firstName,
                    hint: AppConstants.enterYourfirstName,
                    validator: Validators.validateName,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: CustomTextFormField(
                    controller: viewModel.lastNameController,
                    label: AppConstants.lastName,
                    hint: AppConstants.enterYourlastName,
                    validator: Validators.validateName,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            CustomTextFormField(
              controller: viewModel.emailController,
              label: AppConstants.email,
              hint: AppConstants.enterYourEmail,
              validator: Validators.validateEmail,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),

            BlocBuilder<SignupCubit, SignupState>(
              buildWhen: (prev, curr) =>
              prev.togglePasswordVisibility != curr.togglePasswordVisibility ||
                  prev.toggleRePasswordVisibility != curr.toggleRePasswordVisibility,
              builder: (context, state) {
                return Row(
                  children: [
                    Expanded(
                      child: PasswordTextFormField(
                        controller: viewModel.passwordController,
                        label: AppConstants.password,
                        hint: AppConstants.enterYourPassword,
                        isVisible: state.togglePasswordVisibility,
                        onToggleVisibility: () =>
                            viewModel.doIntent(SignupIntent.togglePasswordVisibility),
                        validator: Validators.validatePassword,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: PasswordTextFormField(
                        controller: viewModel.rePasswordController,
                        label: AppConstants.confirmPassword,
                        hint: AppConstants.enterRePassword,
                        isVisible: state.toggleRePasswordVisibility,
                        onToggleVisibility: () =>
                            viewModel.doIntent(SignupIntent.toggleRePasswordVisibility),
                        validator: (value) => Validators.validateRePassword(
                            value, viewModel.passwordController.text),
                      ),
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 16),

            CustomTextFormField(
              controller: viewModel.phoneController,
              label: AppConstants.phoneNumber,
              hint: AppConstants.enterYourPhoneNumber,
              validator: Validators.validatePhone,
              keyboardType: TextInputType.phone,
              textInputAction: TextInputAction.done,
            ),
            const SizedBox(height: 24),

            BlocBuilder<SignupCubit, SignupState>(
              buildWhen: (prev, curr) =>
              prev.isLoading != curr.isLoading ||
                  prev.isFormValid != curr.isFormValid,
              builder: (context, state) {
                return CustomButton(
                  isEnabled: state.isFormValid,
                  isLoading: state.isLoading,
                  text: AppConstants.signup,
                  onPressed: () => viewModel.doIntent(SignupIntent.submit),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
