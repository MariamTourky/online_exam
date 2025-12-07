import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/error/failure.dart';
import '../../../domain/entities/forgot_password_entity.dart';
import '../../../domain/use_cases/forget_password_usecase.dart';
part 'forget_password_intents.dart';


part 'forget_password_state.dart';

@injectable
class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  final ForgetPasswordUseCase _forgetPasswordUseCase;

  ForgetPasswordCubit(this._forgetPasswordUseCase)
      : super(ForgetPasswordState.initial());

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  void doIntent(ForgetPasswordIntent intent) {
    switch (intent) {
      case FormChangedIntent():
        _validateForm();
      case SubmitForgetPasswordIntent():
        _submitForgetPassword();
    }
  }

  void _validateForm() {
    final isEmailFilled = emailController.text.trim().isNotEmpty;
    emit(state.copyWith(isFormValid: isEmailFilled));
  }

  Future<void> _submitForgetPassword() async {
    final isValid = formKey.currentState?.validate() ?? false;
    if (!isValid) return;

    emit(state.copyWith(isLoading: true, errorMessage: null, success: false));

    final email = emailController.text.trim();

    final Either<Failure, ForgotPasswordEntity> result =
    await _forgetPasswordUseCase(email);

    result.fold(
          (failure) => emit(
        state.copyWith(
          isLoading: false,
          errorMessage: failure.message,
        ),
      ),
          (_) => emit(
        state.copyWith(
          isLoading: false,
          success: true,
        ),
      ),
    );
  }

  @override
  Future<void> close() {
    emailController.dispose();
    return super.close();
  }
}
