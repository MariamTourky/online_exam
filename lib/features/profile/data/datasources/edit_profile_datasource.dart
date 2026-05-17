import 'package:online_exam/features/profile/data/models/edit_profile_request.dart';
import 'package:online_exam/features/profile/data/models/edit_profile_response.dart';
import 'package:retrofit/retrofit.dart';

abstract class EditProfileDatasource {
  Future<HttpResponse<EditProfileResponse>> editProfile(String token, EditProfileRequest request);
}