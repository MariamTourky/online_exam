import 'package:online_exam/features/home/domain/repositories/user_data_repo.dart';
import 'package:online_exam/features/login/data_sources/remote/response_model/user_login_response.dart';

class GetUserDataUseCase {
  final UserDataRepo repository;
  GetUserDataUseCase(this.repository);

Future<User> call() async {
    return await repository.getUserData();
  }
}
