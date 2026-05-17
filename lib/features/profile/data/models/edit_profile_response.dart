import 'package:json_annotation/json_annotation.dart';

part 'edit_profile_response.g.dart';

@JsonSerializable()
class EditProfileResponse {
    @JsonKey(name: "message")
    final String? message;
    @JsonKey(name: "user")
    final User? user;

    EditProfileResponse({
        this.message,
        this.user,
    });

    EditProfileResponse copyWith({
        String? message,
        User? user,
    }) => 
        EditProfileResponse(
            message: message ?? this.message,
            user: user ?? this.user,
        );

    factory EditProfileResponse.fromJson(Map<String, dynamic> json) => _$EditProfileResponseFromJson(json);

    Map<String, dynamic> toJson() => _$EditProfileResponseToJson(this);
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
    @JsonKey(name: "password")
    final String? password;
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
        this.password,
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
        String? password,
        bool? isVerified,
        DateTime? createdAt,
    }) => 
        User(
            id: id ?? this.id,
            username: username ?? this.username,
            firstName: firstName ?? this.firstName,
            lastName: lastName ?? this.lastName,
            email: email ?? this.email,
            phone: phone ?? this.phone,
            role: role ?? this.role,
            password: password ?? this.password,
            isVerified: isVerified ?? this.isVerified,
            createdAt: createdAt ?? this.createdAt,
        );

    factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

    Map<String, dynamic> toJson() => _$UserToJson(this);
}
