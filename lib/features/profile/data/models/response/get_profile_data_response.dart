import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

import 'package:online_exam/features/profile/domain/entities/profile_data_model.dart';

part 'get_profile_data_response.g.dart';

@JsonSerializable()
class GetProfileDataResponse {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "user")
  final User? user;

  GetProfileDataResponse({this.message, this.user});

  GetProfileDataResponse copyWith({String? message, User? user}) =>
      GetProfileDataResponse(
        message: message ?? this.message,
        user: user ?? this.user,
      );

  factory GetProfileDataResponse.fromJson(Map<String, dynamic> json) =>
      _$GetProfileDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetProfileDataResponseToJson(this);
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

  User copyWith({
    String? id,
    String? username,
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
    String? role,
    bool? isVerified,
    DateTime? createdAt,
  }) => User(
    id: id ?? this.id,
    username: username ?? this.username,
    firstName: firstName ?? this.firstName,
    lastName: lastName ?? this.lastName,
    email: email ?? this.email,
    phone: phone ?? this.phone,
    role: role ?? this.role,
    isVerified: isVerified ?? this.isVerified,
    createdAt: createdAt ?? this.createdAt,
  );

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
  ProfileDataModel toEntity() {
    return ProfileDataModel(
      id,
      username,
      firstName,
      lastName,
      email,
      phone,
      role,
      isVerified.toString(),
      createdAt.toString(),
    );
  }
}
