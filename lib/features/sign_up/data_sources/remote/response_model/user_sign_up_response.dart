import 'package:json_annotation/json_annotation.dart';
import '../../../domain/entities/user_sign_up_entity.dart';
part 'user_sign_up_response.g.dart';

@JsonSerializable()
class UserSignUpResponse {
  final String? message;
  final String? token;
  final UserResponse? user;

  UserSignUpResponse({this.message, this.token, this.user});

  factory UserSignUpResponse.fromJson(Map<String, dynamic> json) =>
      _$UserSignUpResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserSignUpResponseToJson(this);

  UserSignUpEntity toEntity() => UserSignUpEntity(
    username: user?.username ?? '',
    firstName: user?.firstName ?? '',
    lastName: user?.lastName ?? '',
    email: user?.email ?? '',
    password: '',
    rePassword: '',
    phone: user?.phone ?? '',
    token: token,
    id: user?.id,
  );
}

@JsonSerializable()
class UserResponse {
  final String? username;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phone;
  final String? role;
  final bool? isVerified;
  @JsonKey(name: "_id")
  final String? id;

  UserResponse({
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.role,
    this.isVerified,
    this.id,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}