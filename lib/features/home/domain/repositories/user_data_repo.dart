import 'package:online_exam/features/home/data/models/response_models/user_data_response.dart';

abstract class UserDataRepo {
  Future<UserDataResponse> getUserData();
}
