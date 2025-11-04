
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'user_login_dto.g.dart';

UserloginDto userloginDtoFromJson(String str) => UserloginDto.fromJson(json.decode(str));

String userloginDtoToJson(UserloginDto data) => json.encode(data.toJson());

@JsonSerializable()
class UserloginDto {
  @JsonKey(name: "email")
  final String? email;
  @JsonKey(name: "password")
  final String? password;

  UserloginDto({
   required this.email,
    required this.password,
  });

  factory UserloginDto.fromJson(Map<String, dynamic> json) => _$UserloginDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserloginDtoToJson(this);
}
