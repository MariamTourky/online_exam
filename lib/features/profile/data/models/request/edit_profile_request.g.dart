// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_profile_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditProfileRequest _$EditProfileRequestFromJson(Map<String, dynamic> json) =>
    EditProfileRequest(
      lastName: json['lastName'] as String,
      firstName: json['firstName'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      username: json['username'] as String,
    );

Map<String, dynamic> _$EditProfileRequestToJson(EditProfileRequest instance) =>
    <String, dynamic>{
      'username': instance.username,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'phone': instance.phone,
    };
