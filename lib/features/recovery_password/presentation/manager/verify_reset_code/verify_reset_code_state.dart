part of 'verify_reset_code_cubit.dart';


class VerifyResetCodeState extends Equatable {
  final bool isLoading;
  final bool isFormValid;
  final bool success;
  final String? errorMessage;
  final String code;

  const VerifyResetCodeState({
    required this.isLoading,
    required this.isFormValid,
    required this.success,
    required this.code,
    this.errorMessage,
  });

  factory VerifyResetCodeState.initial() => const VerifyResetCodeState(
    isLoading: false,
    isFormValid: false,
    success: false,
    code: '',
    errorMessage: null,
  );

  VerifyResetCodeState copyWith({
    bool? isLoading,
    bool? isFormValid,
    bool? success,
    String? code,
    String? errorMessage,
  }) {
    return VerifyResetCodeState(
      isLoading: isLoading ?? this.isLoading,
      isFormValid: isFormValid ?? this.isFormValid,
      success: success ?? this.success,
      code: code ?? this.code,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [isLoading, isFormValid, success, code, errorMessage];
}
