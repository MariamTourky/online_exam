// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_reset_code_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyResetCodeResponse _$VerifyResetCodeResponseFromJson(
  Map<String, dynamic> json,
) => VerifyResetCodeResponse(
  message: json['message'] as String?,
  code: (json['code'] as num?)?.toInt(),
  status: json['status'] as String?,
);

Map<String, dynamic> _$VerifyResetCodeResponseToJson(
  VerifyResetCodeResponse instance,
) => <String, dynamic>{
  'message': instance.message,
  'code': instance.code,
  'status': instance.status,
};
