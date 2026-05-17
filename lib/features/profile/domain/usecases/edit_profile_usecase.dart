import 'package:injectable/injectable.dart';
import 'package:online_exam/core/base_response/base_response.dart';
import 'package:online_exam/features/profile/data/models/request/edit_profile_request.dart';
import 'package:online_exam/features/profile/domain/entities/edit_profile_model.dart';
import 'package:online_exam/features/profile/domain/repositories/edit_profile_repo.dart';

@injectable
class EditProfileUseCase {
  final EditProfileRepo _repo;

  EditProfileUseCase(this._repo);

  Future<BaseResponse<EditProfileModel>> call(String token, EditProfileRequest request) {
    return _repo.editProfile(token, request);
  }
}