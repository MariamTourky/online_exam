import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/features/sign_up/presentation/manager/signup_intents.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/utils/validators/validators.dart';
import '../../domain/entities/user_sign_up_entity.dart';
import '../../domain/use_cases/sign_up_usecase.dart';

part 'signup_state.dart';
@injectable
class SignupCubit extends Cubit<SignupState> {
  final SignUpUseCase _signUpUseCase;

  SignupCubit(this._signUpUseCase) : super(SignupState.initial());

  final formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final rePasswordController = TextEditingController();
  final phoneController = TextEditingController();

  void doIntent(SignupIntent intent) {
    switch (intent) {
      case FormChangedIntent():
        _validateForm();
      case TogglePasswordVisibilityIntent():
        _togglePasswordVisibility();
      case ToggleRePasswordVisibilityIntent():
        _toggleRePasswordVisibility();
      case SubmitSignupIntent():
        _submitSignup();
    }
  }

  void _validateForm() {
    final isValid =
            Validators.validateName(usernameController.text) == null &&
            Validators.validateName(firstNameController.text) == null &&
            Validators.validateName(lastNameController.text) == null &&
            Validators.validateEmail(emailController.text) == null &&
            Validators.validatePassword(passwordController.text) == null &&
            Validators.validateRePassword(
                rePasswordController.text, passwordController.text) ==
                null &&
            Validators.validatePhone(phoneController.text) == null;

    emit(state.copyWith(isFormValid: isValid));
  }

  void _togglePasswordVisibility() {
    emit(state.copyWith(
      togglePasswordVisibility: !state.togglePasswordVisibility,
    ));
  }

  void _toggleRePasswordVisibility() {
    emit(state.copyWith(
      toggleRePasswordVisibility: !state.toggleRePasswordVisibility,
    ));
  }

  Future<void> _submitSignup() async {
    if (!(formKey.currentState?.validate() ?? false)) return;

    emit(state.copyWith(isLoading: true, errorMessage: null, success: false));

    final userEntity = UserSignUpEntity(
      username: usernameController.text.trim(),
      firstName: firstNameController.text.trim(),
      lastName: lastNameController.text.trim(),
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
      rePassword: rePasswordController.text.trim(),
      phone: phoneController.text.trim(),
    );

    final Either<Failure, UserSignUpEntity> result =
    await _signUpUseCase(userEntity);

    result.fold(
          (failure) => emit(state.copyWith(
        isLoading: false,
        errorMessage: failure.message,
      )),
          (_) => emit(state.copyWith(
        isLoading: false,
        success: true,
      )),
    );
  }

  @override
  Future<void> close() {
    usernameController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    rePasswordController.dispose();
    phoneController.dispose();
    return super.close();
  }
}