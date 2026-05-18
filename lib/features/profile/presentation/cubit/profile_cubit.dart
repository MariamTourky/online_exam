import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/base_response/base_response.dart';
import 'package:online_exam/core/storage/shared_prefs_service.dart';
import 'package:online_exam/features/profile/data/models/request/change_password_request.dart';
import 'package:online_exam/features/profile/data/models/request/edit_profile_request.dart';
import 'package:online_exam/features/profile/domain/usecases/change_password_usecase.dart';
import 'package:online_exam/features/profile/domain/usecases/edit_profile_usecase.dart';
import 'package:online_exam/features/profile/domain/usecases/get_profile_data_usecase.dart';
import 'package:online_exam/features/profile/presentation/cubit/profile_intent.dart';

part 'profile_state.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  final EditProfileUseCase _editProfileUseCase;
  final GetProfileDataUseCase _getProfileDataUseCase;
  final ChangePasswordUseCase _changePasswordUseCase;
  final SharedPrefsService _sharedPrefsService;

  ProfileCubit(
    this._editProfileUseCase,
    this._sharedPrefsService,
    this._getProfileDataUseCase,
    this._changePasswordUseCase,
  ) : super(ProfileInitial());

  Future<void> doIntent(ProfileIntent intent) async {
    switch (intent) {
      case EditProfileIntent():
        _editProfile(intent.request);
        break;
      case GetProfileDataIntent():
        _getProfileData();
        break;
      case ChangePasswordIntent():
        _changePassword(intent.request);
        break;
    }
  }

  void _editProfile(EditProfileRequest request) async {
    final token = await _sharedPrefsService.getToken();
    final response = await _editProfileUseCase(token!, request);
    switch (response) {
      case SuccessResponse(data: final data):
        emit(
          state.copyWith(
            id: data.id,
            username: data.username,
            firstName: data.firstName,
            lastName: data.lastName,
            email: data.email,
            phone: data.phone,
            role: data.role,
            isVerified: data.isVerified,
            createdAt: data.createdAt,
            message: data.message,
          ),
        );
        break;
      case ErrorResponse():
        emit(state.copyWith(error: response.error));
        debugPrint("ProfileCubit: Error editing profile: ${response.error}");
        break;
    }
  }

  void _getProfileData() async {
    debugPrint("ProfileCubit: Starting _getProfileData...");
    final token = await _sharedPrefsService.getToken();
    final response = await _getProfileDataUseCase(token!);
    debugPrint(
      "ProfileCubit: _getProfileData response type: ${response.runtimeType}",
    );
    switch (response) {
      case SuccessResponse(data: final data):
        debugPrint(
          "ProfileCubit: Success fetching data. Username: ${data.username}",
        );
        emit(
          state.copyWith(
            id: data.id,
            username: data.username,
            firstName: data.firstName,
            lastName: data.lastName,
            email: data.email,
            phone: data.phone,
            role: data.role,
            isVerified: data.isVerified,
            createdAt: data.createdAt,
          ),
        );
        break;
      case ErrorResponse():
        debugPrint("ProfileCubit: Error fetching data: ${response.error}");
        emit(state.copyWith(error: response.error));
        break;
    }
  }

  void _changePassword(ChangePasswordRequest request) async {
    final token = await _sharedPrefsService.getToken();
    final response = await _changePasswordUseCase(token!, request);
    switch (response) {
      case SuccessResponse(data: final data):
        emit(state.copyWith(message: data.message, token: data.token));
        break;
      case ErrorResponse():
        emit(state.copyWith(error: response.error));
        debugPrint("ProfileCubit: Error change password: ${response.error}");
        break;
    }
  }
}
