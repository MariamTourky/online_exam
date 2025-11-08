import '../../data/request_models/user_login_dto.dart';

class UserLoginEntity {

  final String email;
  final String password;
  final String? token;
  final String? id;

  const UserLoginEntity({

    required this.email,
    required this.password,
    this.token,
    this.id,
  });

  UserloginDto toDto() => UserloginDto(
    email: email,
    password: password,

  );
}