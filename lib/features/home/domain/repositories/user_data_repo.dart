import 'package:online_exam/features/login/data_sources/remote/response_model/user_login_response.dart';

abstract class UserDataRepo {
  Future<User> getUserData();
}
