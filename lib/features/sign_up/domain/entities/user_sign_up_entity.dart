import '../../data/request_models/user_sign_up_dto.dart';

class UserSignUpEntity {
  final String username;
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String rePassword;
  final String phone;
  final String? token;
  final String? id;

  const UserSignUpEntity({
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.rePassword,
    required this.phone,
    this.token,
    this.id,
  });

  UserSignUpDto toDto() => UserSignUpDto(
    username: username,
    firstName: firstName,
    lastName: lastName,
    email: email,
    password: password,
    rePassword: rePassword,
    phone: phone,
  );
}
