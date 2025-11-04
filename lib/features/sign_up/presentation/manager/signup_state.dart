part of 'signup_cubit.dart';


class SignupState {
  final bool isLoading;
  final bool isFormValid;
  final bool success;
  final String? errorMessage;
  final bool togglePasswordVisibility;
  final bool toggleRePasswordVisibility;

  const SignupState({
    required this.isLoading,
    required this.isFormValid,
    required this.success,
    required this.togglePasswordVisibility,
    required this.toggleRePasswordVisibility,
    this.errorMessage,
  });

  factory SignupState.initial() => const SignupState(
    isLoading: false,
    isFormValid: false,
    success: false,
    togglePasswordVisibility: false,
    toggleRePasswordVisibility: false,
    errorMessage: null,
  );

  SignupState copyWith({
    bool? isLoading,
    bool? isFormValid,
    bool? success,
    bool? togglePasswordVisibility,
    bool? toggleRePasswordVisibility,
    String? errorMessage,
  }) {
    return SignupState(
      isLoading: isLoading ?? this.isLoading,
      isFormValid: isFormValid ?? this.isFormValid,
      success: success ?? this.success,
      togglePasswordVisibility:
      togglePasswordVisibility ?? this.togglePasswordVisibility,
      toggleRePasswordVisibility:
      toggleRePasswordVisibility ?? this.toggleRePasswordVisibility,
      errorMessage: errorMessage,
    );
  }
}
