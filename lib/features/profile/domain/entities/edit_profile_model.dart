import 'dart:core';

class EditProfileModel {
  String id;
  String username;
  String firstName;
  String lastName;
  String email;
  String phone;
  String role;
  String password;
  String isVerified;
  String createdAt;

  EditProfileModel(
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
  );
}