// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_sign_up_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserSignUpDto _$UserSignUpDtoFromJson(Map<String, dynamic> json) =>
    UserSignUpDto(
      username: json['username'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      rePassword: json['rePassword'] as String,
      phone: json['phone'] as String,
    );

Map<String, dynamic> _$UserSignUpDtoToJson(UserSignUpDto instance) =>
    <String, dynamic>{
      'username': instance.username,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'password': instance.password,
      'rePassword': instance.rePassword,
      'phone': instance.phone,
    };
