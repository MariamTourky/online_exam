import 'package:json_annotation/json_annotation.dart';
part 'user_data_response.g.dart';

@JsonSerializable()
class UserDataResponse {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "UserDataDto")
  final UserDataDto? userDataDto;

  UserDataResponse({this.message, this.userDataDto});

  factory UserDataResponse.fromJson(Map<String, dynamic> json) =>
      _$UserDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataResponseToJson(this);
}



@JsonSerializable()
class UserDataDto {
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

    UserDataDto({
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

    factory UserDataDto.fromJson(Map<String, dynamic> json) => _$UserDataDtoFromJson(json);

    Map<String, dynamic> toJson() => _$UserDataDtoToJson(this);
}
