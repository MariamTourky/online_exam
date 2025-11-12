import 'package:json_annotation/json_annotation.dart';

part 'verify_reset_code_dto.g.dart';

@JsonSerializable()
class VerifyResetCodeDto {
  final String resetCode;

  const VerifyResetCodeDto({required this.resetCode});

  factory VerifyResetCodeDto.fromJson(Map<String, dynamic> json) =>
      _$VerifyResetCodeDtoFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyResetCodeDtoToJson(this);


}
