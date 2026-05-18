import 'package:json_annotation/json_annotation.dart';

import 'package:online_exam/features/profile/domain/entities/change_password_model.dart';

part 'change_password_response.g.dart';

@JsonSerializable()
class ChangePasswordResponse {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "token")
  final String? token;

  ChangePasswordResponse({this.message, this.token});

  ChangePasswordResponse copyWith({String? message, String? token}) =>
      ChangePasswordResponse(
        message: message ?? this.message,
        token: token ?? this.token,
      );

  factory ChangePasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ChangePasswordResponseToJson(this);

  ChangePasswordModel toEntity() {
    return ChangePasswordModel(message, token);
  }
}
