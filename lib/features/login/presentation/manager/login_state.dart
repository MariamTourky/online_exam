part of 'login_cubit.dart';

class LoginState {
  final bool isLoading;
  final bool isFormValid;
  final bool success;
  final String? errorMessage;
  final bool togglePasswordVisibility;

  const LoginState({
    required this.isLoading,
    required this.isFormValid,
    required this.success,
    required this.togglePasswordVisibility,
    this.errorMessage,
  });

  factory LoginState.initial() => const LoginState(
    isLoading: false,
    isFormValid: false,
    success: false,
    togglePasswordVisibility: false,
    errorMessage: null,
  );

  LoginState copyWith({
    bool? isLoading,
    bool? isFormValid,
    bool? success,
    bool? togglePasswordVisibility,
    String? errorMessage,
  }) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      isFormValid: isFormValid ?? this.isFormValid,
      success: success ?? this.success,
      togglePasswordVisibility:
      togglePasswordVisibility ?? this.togglePasswordVisibility,
      errorMessage: errorMessage,
    );
  }
}
