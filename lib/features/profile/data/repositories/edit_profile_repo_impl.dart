import 'package:injectable/injectable.dart';
import 'package:online_exam/core/base_response/base_response.dart';
import 'package:online_exam/core/network/safe_api_call.dart';
import 'package:online_exam/features/profile/data/datasources/edit_profile_datasource.dart';
import 'package:online_exam/features/profile/data/models/request/edit_profile_request.dart';
import 'package:online_exam/features/profile/data/models/response/edit_profile_response.dart';
import 'package:online_exam/features/profile/domain/repositories/edit_profile_repo.dart';

@Injectable(as: EditProfileRepo)
class EditProfileRepoImpl implements EditProfileRepo {
  final EditProfileDatasource _datasource;

  EditProfileRepoImpl(this._datasource);

  @override
  Future<BaseResponse<EditProfileResponse>> editProfile(
    String token,
    EditProfileRequest request,
  ) {
    return _datasource.editProfile(token, request);
  }

  @override
  Future<BaseResponse<EditProfileResponse>> getProfileData(String token) {
    // TODO: implement getProfileData
    throw UnimplementedError();
  }

  @override
  Future<BaseResponse<void>> changePassword(
    String token,
    EditProfileRequest request,
  ) {
    // TODO: implement changePassword
    throw UnimplementedError();
  }
}
