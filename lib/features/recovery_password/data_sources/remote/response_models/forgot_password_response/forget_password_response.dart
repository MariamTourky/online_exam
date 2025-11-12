import 'package:json_annotation/json_annotation.dart';

import '../../../../domain/entities/forgot_password_entity.dart';

part 'forget_password_response.g.dart';

@JsonSerializable()
class ForgotPasswordResponse {
  final String message;
  final String? info;

  ForgotPasswordResponse({
    required this.message,
    this.info,
  });

  factory ForgotPasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$ForgotPasswordResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ForgotPasswordResponseToJson(this);

  ForgotPasswordEntity toEntity() =>
      ForgotPasswordEntity(message: message, info: info);
}
