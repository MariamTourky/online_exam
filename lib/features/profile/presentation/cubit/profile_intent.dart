import 'package:online_exam/features/profile/data/models/request/change_password_request.dart';
import 'package:online_exam/features/profile/data/models/request/edit_profile_request.dart';

sealed class ProfileIntent {}

class EditProfileIntent extends ProfileIntent {
  final EditProfileRequest request;
  EditProfileIntent(this.request);
}

class GetProfileDataIntent extends ProfileIntent {}

class ChangePasswordIntent extends ProfileIntent {
  final ChangePasswordRequest request;
  ChangePasswordIntent(this.request);
}
