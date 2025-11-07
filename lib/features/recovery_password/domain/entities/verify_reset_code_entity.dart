class VerifyResetCodeEntity {
  final String message;
  final int? code;

  const VerifyResetCodeEntity({
    required this.message,
    this.code,
  });
}
