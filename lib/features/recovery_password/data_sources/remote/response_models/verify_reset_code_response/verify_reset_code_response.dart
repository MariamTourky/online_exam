import 'package:json_annotation/json_annotation.dart';
import '../../../../domain/entities/verify_reset_code_entity.dart';
part 'verify_reset_code_response.g.dart';
@JsonSerializable()
class VerifyResetCodeResponse {
  final String? message;
  final int? code;
  final String? status;

  VerifyResetCodeResponse({this.message, this.code, this.status});

  factory VerifyResetCodeResponse.fromJson(Map<String, dynamic> json) =>
      _$VerifyResetCodeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyResetCodeResponseToJson(this);

  VerifyResetCodeEntity toEntity() {
    if (status == "Success") {
      return VerifyResetCodeEntity(message: "Success", code: 200);
    } else {
      return VerifyResetCodeEntity(
          message: message!, code: code );
    }
  }
}
