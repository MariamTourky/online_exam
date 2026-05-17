import 'package:online_exam/features/profile/data/models/edit_profile_request.dart';

sealed class ProfileIntent {}

class EditProfileIntent extends ProfileIntent {
  final EditProfileRequest request;
  EditProfileIntent(this.request);
}