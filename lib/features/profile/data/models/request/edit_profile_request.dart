import 'package:json_annotation/json_annotation.dart';

part 'edit_profile_request.g.dart';

@JsonSerializable()
class EditProfileRequest {
  @JsonKey(name: "lastName")
  final String lastName;

  EditProfileRequest({required this.lastName});

  Map<String, dynamic> toJson() => _$EditProfileRequestToJson(this);
}
