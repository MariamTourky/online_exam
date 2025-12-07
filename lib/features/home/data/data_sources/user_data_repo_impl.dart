import 'package:online_exam/features/home/api/data_sources/user_data/user_remote_data_source.dart';
import 'package:online_exam/features/home/data/models/response_models/user_data_response.dart';
import 'package:online_exam/features/home/domain/repositories/user_data_repo.dart';

class UserDataRepoImpl implements UserDataRepo {
  final UserRemoteDataSource remote;

  UserDataRepoImpl(this.remote);

  @override
  Future<UserDataResponse> getUserData() async {
    final result = await remote.getUserData();
    return result;
  }
}
