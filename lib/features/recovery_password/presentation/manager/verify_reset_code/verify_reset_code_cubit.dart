import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/error/failure.dart';
import '../../../domain/entities/forgot_password_entity.dart';
import '../../../domain/entities/verify_reset_code_entity.dart';
import '../../../domain/use_cases/forget_password_usecase.dart';
import '../../../domain/use_cases/verify_reset_code_usecase.dart';
import 'verify_reset_code_intents.dart';
part 'verify_reset_code_state.dart';

@injectable

class VerifyResetCodeCubit extends Cubit<VerifyResetCodeState> {
  final VerifyResetCodeUseCase _verifyUseCase;
  final ForgetPasswordUseCase _resendUseCase;
  final String email;

  VerifyResetCodeCubit(
      this._verifyUseCase,
      this._resendUseCase,
      @factoryParam this.email,
      ) : super(VerifyResetCodeState.initial());

  void doIntent(VerifyResetCodeIntent intent) {
    switch (intent) {
      case FormChangedIntent(:final code):
        _validateForm(code);
      case SubmitVerifyCodeIntent():
        _submitCode();
      case ResendCodeIntent():
        _resendCode();
    }
  }

  void _validateForm(String code) {
    emit(state.copyWith(
      code: code,
      isFormValid: code.length == 6,
    ));
  }

  Future<void> _submitCode() async {
    if (!state.isFormValid) return;

    emit(state.copyWith(isLoading: true, errorMessage: null, success: false));

    final Either<Failure, VerifyResetCodeEntity> result =
    await _verifyUseCase(state.code);

    result.fold(
          (failure) => emit(state.copyWith(isLoading: false, errorMessage: failure.message)),
          (_) => emit(state.copyWith(isLoading: false, success: true)),
    );
  }

  Future<void> _resendCode() async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    final Either<Failure, ForgotPasswordEntity> result =
    await _resendUseCase(email);

    result.fold(
          (failure) => emit(state.copyWith(isLoading: false, errorMessage: failure.message)),
          (_) => emit(state.copyWith(isLoading: false)),
    );
  }
}