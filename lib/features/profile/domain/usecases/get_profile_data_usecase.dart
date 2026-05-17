import 'package:injectable/injectable.dart';
import 'package:online_exam/core/base_response/base_response.dart';
import 'package:online_exam/features/profile/domain/entities/profile_data_model.dart';
import 'package:online_exam/features/profile/domain/repositories/edit_profile_repo.dart';

@injectable
class GetProfileDataUseCase {
  final EditProfileRepo _repo;

  GetProfileDataUseCase(this._repo);

  Future<BaseResponse<ProfileDataModel>> call(String token) {
    return _repo.getProfileData(token);
  }
}