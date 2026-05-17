import 'package:online_exam/core/base_response/base_response.dart';
import 'package:online_exam/features/profile/data/models/request/change_password_request.dart';
import 'package:online_exam/features/profile/data/models/request/edit_profile_request.dart';
import 'package:online_exam/features/profile/data/models/response/change_password_response.dart';
import 'package:online_exam/features/profile/data/models/response/edit_profile_response.dart';
import 'package:online_exam/features/profile/data/models/response/get_profile_data_response.dart';

abstract class EditProfileDatasource {
  Future<BaseResponse<EditProfileResponse>> editProfile(
    String token,
    EditProfileRequest request,
  );
  Future<BaseResponse<GetProfileDataResponse>> getProfileData(String token);
  
  Future<BaseResponse<ChangePasswordResponse>> changePassword(
    String token,
    ChangePasswordRequest request,
  );
}
