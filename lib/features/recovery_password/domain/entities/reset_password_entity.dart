class ResetPasswordEntity {
  final String message;
  final int? code;

  const ResetPasswordEntity({
    required this.message,
    this.code,
  });
}
