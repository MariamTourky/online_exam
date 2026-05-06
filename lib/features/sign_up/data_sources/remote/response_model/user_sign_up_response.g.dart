// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_sign_up_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserSignUpResponse _$UserSignUpResponseFromJson(Map<String, dynamic> json) =>
    UserSignUpResponse(
      message: json['message'] as String?,
      token: json['token'] as String?,
      user: json['user'] == null
          ? null
          : UserResponse.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserSignUpResponseToJson(UserSignUpResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'token': instance.token,
      'user': instance.user,
    };

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) => UserResponse(
  username: json['username'] as String?,
  firstName: json['firstName'] as String?,
  lastName: json['lastName'] as String?,
  email: json['email'] as String?,
  phone: json['phone'] as String?,
  role: json['role'] as String?,
  isVerified: json['isVerified'] as bool?,
  id: json['_id'] as String?,
);

Map<String, dynamic> _$UserResponseToJson(UserResponse instance) =>
    <String, dynamic>{
      'username': instance.username,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'phone': instance.phone,
      'role': instance.role,
      'isVerified': instance.isVerified,
      '_id': instance.id,
    };
