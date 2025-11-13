part of 'reset_password_cubit.dart';

class ResetPasswordState {
  final bool isLoading;
  final bool isFormValid;
  final bool success;
  final String? errorMessage;
  final bool togglePasswordVisibility;

  const ResetPasswordState({
    required this.isLoading,
    required this.isFormValid,
    required this.success,
    required this.togglePasswordVisibility,
    this.errorMessage,
  });

  factory ResetPasswordState.initial() => const ResetPasswordState(
    isLoading: false,
    isFormValid: false,
    success: false,
    togglePasswordVisibility: false,
    errorMessage: null,
  );

  ResetPasswordState copyWith({
    bool? isLoading,
    bool? isFormValid,
    bool? success,
    bool? togglePasswordVisibility,
    String? errorMessage,
  }) {
    return ResetPasswordState(
      isLoading: isLoading ?? this.isLoading,
      isFormValid: isFormValid ?? this.isFormValid,
      success: success ?? this.success,
      togglePasswordVisibility:
      togglePasswordVisibility ?? this.togglePasswordVisibility,
      errorMessage: errorMessage,
    );
  }
}
