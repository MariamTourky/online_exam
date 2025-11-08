part of 'forget_password_cubit.dart';

class ForgetPasswordState {
  final bool isLoading;
  final bool isFormValid;
  final bool success;
  final String? errorMessage;

  const ForgetPasswordState({
    required this.isLoading,
    required this.isFormValid,
    required this.success,
    this.errorMessage,
  });

  factory ForgetPasswordState.initial() => const ForgetPasswordState(
    isLoading: false,
    isFormValid: false,
    success: false,
    errorMessage: null,
  );

  ForgetPasswordState copyWith({
    bool? isLoading,
    bool? isFormValid,
    bool? success,
    String? errorMessage,
  }) {
    return ForgetPasswordState(
      isLoading: isLoading ?? this.isLoading,
      isFormValid: isFormValid ?? this.isFormValid,
      success: success ?? this.success,
      errorMessage: errorMessage,
    );
  }
}
