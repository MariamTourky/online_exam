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
  EditProfileRequest({
    required this.lastName,
    required this.firstName,
    required this.email,
    required this.phone,
    required this.username,
  });

  Map<String, dynamic> toJson() => _$EditProfileRequestToJson(this);
}
