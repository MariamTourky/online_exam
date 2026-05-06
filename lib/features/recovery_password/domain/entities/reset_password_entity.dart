class ResetPasswordEntity {
  final String message;
  final String? token;
  final int? code;

  const ResetPasswordEntity({required this.message, this.token, this.code});
}
