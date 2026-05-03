import 'package:online_exam/core/base_response/base_response.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/network/api_service.dart';
import 'package:online_exam/features/subjects/data/models/subject_response.dart';
import 'package:online_exam/features/subjects/data/data_source/subject_remote_datasources.dart';

@Injectable(as: SubjectRemoteDatasources)
class SubjectRemoteDatasourcesImpl implements SubjectRemoteDatasources {
  ApiService _apiService;
  SubjectRemoteDatasourcesImpl(this._apiService);
  @override
  Future<BaseResponse<SubjectResponse>> getAllSubjects(String token) async {
    try {
      final response = await _apiService.getAllSubjects(token);
      return SuccessResponse(data: response.data);
    } catch (e) {
      return ErrorResponse(error: e as Exception);
    }
  }
}