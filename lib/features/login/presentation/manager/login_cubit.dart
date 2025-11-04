import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entities/user_login_entity.dart';
import '../../domain/use_cases/login_usecase.dart';
import 'login_intents.dart';

part 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase _loginUseCase;

  LoginCubit(this._loginUseCase) : super(LoginState.initial());

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void doIntent(LoginIntent intent) {
    switch (intent) {
      case FormChangedIntent():
        _validateForm();
      case TogglePasswordVisibilityIntent():
        _togglePasswordVisibility();
      case SubmitLoginIntent():
        _submitLogin();
    }
  }

  void _validateForm() {
    final isEmailFilled = emailController.text.trim().isNotEmpty;
    final isPasswordFilled = passwordController.text.trim().isNotEmpty;

    emit(state.copyWith(isFormValid: isEmailFilled && isPasswordFilled));
  }

  void _togglePasswordVisibility() {
    emit(state.copyWith(
      togglePasswordVisibility: !state.togglePasswordVisibility,
    ));
  }

  Future<void> _submitLogin() async {
    final isValid = formKey.currentState?.validate() ?? false;
    if (!isValid) return;

    emit(state.copyWith(isLoading: true, errorMessage: null, success: false));

    final userEntity = UserLoginEntity(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );

    final Either<Failure, UserLoginEntity> result =
    await _loginUseCase(userEntity);

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
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
