import 'package:injectable/injectable.dart';
import 'package:online_exam/core/base_response/base_response.dart';
import 'package:online_exam/features/profile/data/datasources/edit_profile_datasource.dart';
import 'package:online_exam/features/profile/data/models/request/change_password_request.dart';
import 'package:online_exam/features/profile/data/models/request/edit_profile_request.dart';
import 'package:online_exam/features/profile/domain/entities/change_password_model.dart';
import 'package:online_exam/features/profile/domain/entities/edit_profile_model.dart';
import 'package:online_exam/features/profile/domain/entities/profile_data_model.dart';
import 'package:online_exam/features/profile/domain/repositories/edit_profile_repo.dart';

@Injectable(as: EditProfileRepo)
class EditProfileRepoImpl implements EditProfileRepo {
  final EditProfileDatasource _datasource;

  EditProfileRepoImpl(this._datasource);

  @override
  Future<BaseResponse<EditProfileModel>> editProfile(
    String token,
    EditProfileRequest request,
  ) async {
    final response = await _datasource.editProfile(token, request);
    switch (response) {
      case SuccessResponse(data: final data):
        return SuccessResponse(data: data.user!.toEntity(data.message));
      case ErrorResponse(error: final error):
        return ErrorResponse(error: error);
    }
  }

  @override
  Future<BaseResponse<ProfileDataModel>> getProfileData(String token) async {
    final response = await _datasource.getProfileData(token);
    switch (response) {
      case SuccessResponse(data: final data):
        return SuccessResponse(data: data.user!.toEntity());
      case ErrorResponse(error: final error):
        return ErrorResponse(error: error);
    }
  }

  @override
  Future<BaseResponse<ChangePasswordModel>> changePassword(
    String token,
    ChangePasswordRequest request,
  ) async {
    final response = await _datasource.changePassword(token, request);
    switch (response) {
      case SuccessResponse(data: final data):
        return SuccessResponse(data: data.toEntity());
      case ErrorResponse(error: final error):
        return ErrorResponse(error: error);
    }
  }
}
