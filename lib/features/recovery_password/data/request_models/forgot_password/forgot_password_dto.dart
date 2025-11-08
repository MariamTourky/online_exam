import 'package:json_annotation/json_annotation.dart';


part 'forgot_password_dto.g.dart';

@JsonSerializable()
class ForgotPasswordDto {
  final String email;

  const ForgotPasswordDto({required this.email});

  factory ForgotPasswordDto.fromJson(Map<String, dynamic> json) =>
      _$ForgotPasswordDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ForgotPasswordDtoToJson(this);

}
