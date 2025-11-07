import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'user_sign_up_dto.g.dart';

UserSignUpDto userSignUpDtoFromJson(String str) => UserSignUpDto.fromJson(json.decode(str));
String userSignUpDtoToJson(UserSignUpDto data) => json.encode(data.toJson());

@JsonSerializable()
class UserSignUpDto {
  final String username;
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String rePassword;
  final String phone;

  UserSignUpDto({
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.rePassword,
    required this.phone,
  });

  factory UserSignUpDto.fromJson(Map<String, dynamic> json) =>
      _$UserSignUpDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserSignUpDtoToJson(this);
}