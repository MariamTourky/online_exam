import 'package:json_annotation/json_annotation.dart';

part 'edit_profile_request.g.dart';

@JsonSerializable()
class EditProfileRequest {
  @JsonKey(name: "username")
  final String username;
  @JsonKey(name: "firstName")
  final String firstName;
  @JsonKey(name: "lastName")
  final String lastName;
  @JsonKey(name: "email")
  final String email;
  @JsonKey(name: "phone")
  final String phone;
  @JsonKey(name: "password")
  final String? password;
  @JsonKey(name: "role")
  final String role;

  EditProfileRequest({
    required this.lastName,
    required this.firstName,
    required this.email,
    required this.phone,
    required this.username,
    this.password,
    required this.role,
  });

  Map<String, dynamic> toJson() => _$EditProfileRequestToJson(this);
}
