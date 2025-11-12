import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:online_exam/features/recovery_password/domain/entities/reset_password_entity.dart';
import 'package:online_exam/features/recovery_password/presentation/manager/reset_password/reset_password_intents.dart';

import '../../../../../core/error/failure.dart';
import '../../../data/request_models/reset_password/reset_password_dto.dart';
import '../../../domain/use_cases/reset_password_usecase.dart';

part 'reset_password_state.dart';

@injectable
class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final ResetPasswordUseCase _resetPasswordUseCase;

  ResetPasswordCubit(this._resetPasswordUseCase)
      : super(ResetPasswordState.initial());

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final newPasswordController = TextEditingController();

  void doIntent(ResetPasswordIntent intent) {
    switch (intent) {
      case FormChangedIntent():
        _validateForm();
      case TogglePasswordVisibilityIntent():
        _togglePasswordVisibility();
      case SubmitResetPasswordIntent():
        _submitResetPassword();
    }
  }

  void _validateForm() {
    final isEmailFilled = emailController.text.trim().isNotEmpty;
    final isPasswordFilled = newPasswordController.text.trim().isNotEmpty;

    emit(state.copyWith(isFormValid: isEmailFilled && isPasswordFilled));
  }

  void _togglePasswordVisibility() {
    emit(state.copyWith(
      togglePasswordVisibility: !state.togglePasswordVisibility,
    ));
  }

  Future<void> _submitResetPassword() async {
    final isValid = formKey.currentState?.validate() ?? false;
    if (!isValid) return;

    emit(state.copyWith(isLoading: true, errorMessage: null, success: false));

    final dto = ResetPasswordDto(
      email: emailController.text.trim(),
      newPassword: newPasswordController.text.trim(),
    );

    final result = await _resetPasswordUseCase(dto);

    result.fold(
          (failure) => emit(
        state.copyWith(
          isLoading: false,
          errorMessage: failure.message,
        ),
      ),
          (entity) => emit(
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
    newPasswordController.dispose();
    return super.close();
  }
}