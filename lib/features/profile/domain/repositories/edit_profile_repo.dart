import 'package:online_exam/core/base_response/base_response.dart';
import 'package:online_exam/features/profile/data/models/request/change_password_request.dart';
import 'package:online_exam/features/profile/data/models/request/edit_profile_request.dart';
import 'package:online_exam/features/profile/domain/entities/change_password_model.dart';
import 'package:online_exam/features/profile/domain/entities/edit_profile_model.dart';
import 'package:online_exam/features/profile/domain/entities/profile_data_model.dart';

abstract class EditProfileRepo {
  Future<BaseResponse<EditProfileModel>> editProfile(
    String token,
    EditProfileRequest request,
  );
  Future<BaseResponse<ProfileDataModel>> getProfileData(String token);
  Future<BaseResponse<ChangePasswordModel>> changePassword(
    String token,
    ChangePasswordRequest request,
  );
}
