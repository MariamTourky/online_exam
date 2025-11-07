import 'package:json_annotation/json_annotation.dart';
import '../../../../domain/entities/reset_password_entity.dart';

part 'reset_password_response.g.dart';

@JsonSerializable()
class ResetPasswordResponse {
  final String message;
  final int? code;

  ResetPasswordResponse({
    required this.message,
    this.code,
  });

  factory ResetPasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ResetPasswordResponseToJson(this);

  ResetPasswordEntity toEntity() =>
      ResetPasswordEntity(message: message, code: code);

}
