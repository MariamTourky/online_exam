import 'package:json_annotation/json_annotation.dart';
import '../../../../domain/entities/verify_reset_code_entity.dart';
part 'verify_reset_code_response.g.dart';

@JsonSerializable()
class VerifyResetCodeResponse {
  final String message;
  final int? code;

  VerifyResetCodeResponse({
    required this.message,
    this.code,
  });

  factory VerifyResetCodeResponse.fromJson(Map<String, dynamic> json) =>
      _$VerifyResetCodeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyResetCodeResponseToJson(this);

  VerifyResetCodeEntity toEntity() =>
      VerifyResetCodeEntity(message: message, code: code);
}
