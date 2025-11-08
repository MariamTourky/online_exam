import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';
import 'package:online_exam/features/login/domain/entities/user_login_entity.dart';

part 'user_login_response.g.dart';

UserloginResponse userloginResponseFromJson(String str) => UserloginResponse.fromJson(json.decode(str));

String userloginResponseToJson(UserloginResponse data) => json.encode(data.toJson());

@JsonSerializable()
class UserloginResponse {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "token")
  final String? token;
  @JsonKey(name: "user")
  final User? user;

  UserloginResponse({
    this.message,
    this.token,
    this.user,
  });

  factory UserloginResponse.fromJson(Map<String, dynamic> json) => _$UserloginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserloginResponseToJson(this);

  UserLoginEntity toEntity() => UserLoginEntity(
    email: user?.email ?? '',
    password: '',
    token: token,
    id: user?.id,
  );
}

@JsonSerializable()
class User {
  @JsonKey(name: "_id")
  final String? id;
  @JsonKey(name: "username")
  final String? username;
  @JsonKey(name: "firstName")
  final String? firstName;
  @JsonKey(name: "lastName")
  final String? lastName;
  @JsonKey(name: "email")
  final String? email;
  @JsonKey(name: "phone")
  final String? phone;
  @JsonKey(name: "role")
  final String? role;
  @JsonKey(name: "isVerified")
  final bool? isVerified;
  @JsonKey(name: "createdAt")
  final DateTime? createdAt;

  User({
    this.id,
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.role,
    this.isVerified,
    this.createdAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
