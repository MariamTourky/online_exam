import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/storage/shared_prefs_service.dart';
import 'package:online_exam/features/profile/data/models/edit_profile_request.dart';
import 'package:online_exam/features/profile/domain/usecases/edit_profile_usecase.dart';
import 'package:online_exam/features/profile/presentation/cubit/profile_intent.dart';

part 'profile_state.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  final EditProfileUseCase _editProfileUseCase;
  final SharedPrefsService _sharedPrefsService;

  ProfileCubit(this._editProfileUseCase, this._sharedPrefsService)
    : super(ProfileInitial());

  Future<void> doIntent(ProfileIntent intent) async {
    switch (intent) {
      case EditProfileIntent():
        _editProfile(intent.request);
    }
  }

  void _editProfile(EditProfileRequest request) async {}
}
