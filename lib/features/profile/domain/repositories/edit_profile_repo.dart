import 'package:online_exam/core/base_response/base_response.dart';
import 'package:online_exam/features/profile/data/models/edit_profile_request.dart';
import 'package:online_exam/features/profile/data/models/edit_profile_response.dart';

abstract class EditProfileRepo {
  Future<BaseResponse<EditProfileResponse>> editProfile(String token, EditProfileRequest request);
}