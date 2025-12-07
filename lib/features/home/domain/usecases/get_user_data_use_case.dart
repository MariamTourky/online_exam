import 'package:online_exam/features/home/data/models/response_models/user_data_response.dart';

import '../repositories/user_data_repo.dart';

class GetUserDataUseCase {
  final UserDataRepo repo;

  GetUserDataUseCase(this.repo);

  Future<UserDataResponse> call() async {
    final result = await repo.getUserData();
    return result;
  }
}
