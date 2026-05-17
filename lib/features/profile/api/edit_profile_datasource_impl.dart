import 'package:injectable/injectable.dart';
import 'package:online_exam/core/network/api_service.dart';
import 'package:online_exam/features/profile/data/datasources/edit_profile_datasource.dart';
import 'package:online_exam/features/profile/data/models/edit_profile_request.dart';
import 'package:online_exam/features/profile/data/models/edit_profile_response.dart';
import 'package:retrofit/retrofit.dart';

@Injectable(as: EditProfileDatasource)
class EditProfileDatasourceImpl implements EditProfileDatasource {
  final ApiService _apiService;

  EditProfileDatasourceImpl(this._apiService);

  @override
  Future<HttpResponse<EditProfileResponse>> editProfile(
      String token, EditProfileRequest request) async {
    return await _apiService.editProfile(token, request);
  }
}
