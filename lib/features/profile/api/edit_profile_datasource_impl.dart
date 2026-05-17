import 'package:injectable/injectable.dart';
import 'package:online_exam/core/base_response/base_response.dart';
import 'package:online_exam/core/network/api_service.dart';
import 'package:online_exam/core/network/safe_api_call.dart';
import 'package:online_exam/features/profile/data/datasources/edit_profile_datasource.dart';
import 'package:online_exam/features/profile/data/models/request/change_password_request.dart';
import 'package:online_exam/features/profile/data/models/request/edit_profile_request.dart';
import 'package:online_exam/features/profile/data/models/response/change_password_response.dart';
import 'package:online_exam/features/profile/data/models/response/edit_profile_response.dart';
import 'package:online_exam/features/profile/data/models/response/get_profile_data_response.dart';

@Injectable(as: EditProfileDatasource)
class EditProfileDatasourceImpl implements EditProfileDatasource {
  final ApiService _apiService;

  EditProfileDatasourceImpl(this._apiService);

  @override
  Future<BaseResponse<EditProfileResponse>> editProfile(
    String token,
    EditProfileRequest request,
  ) {
    return safeApiCall(call: () => _apiService.editProfile(token, request));
  }

  @override
  Future<BaseResponse<GetProfileDataResponse>> getProfileData(String token) {
    return safeApiCall(call: () => _apiService.getProfileData(token));
  }

  @override
  Future<BaseResponse<ChangePasswordResponse>> changePassword(
    String token,
    ChangePasswordRequest request,
  ) {
    return safeApiCall(call: () => _apiService.changePassword(token, request));
  }
}
