import 'package:injectable/injectable.dart';
import 'package:online_exam/core/base_response/base_response.dart';
import 'package:online_exam/features/profile/data/models/request/change_password_request.dart';
import 'package:online_exam/features/profile/data/models/response/change_password_response.dart';
import 'package:online_exam/features/profile/data/models/response/edit_profile_response.dart';
import 'package:online_exam/features/profile/domain/entities/change_password_model.dart';
import 'package:online_exam/features/profile/domain/repositories/edit_profile_repo.dart';

@injectable
class ChangePasswordUseCase {
  final EditProfileRepo _repo;

  ChangePasswordUseCase(this._repo);

  Future<BaseResponse<ChangePasswordModel>> call(
    String token,
    ChangePasswordRequest request,
  ) {
    return _repo.changePassword(token, request);
  }
}