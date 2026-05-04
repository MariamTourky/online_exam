import 'package:online_exam/core/base_response/base_response.dart';
import 'package:online_exam/core/network/api_service.dart';
import 'package:online_exam/core/network/safe_api_call.dart';
import 'package:online_exam/features/exams/data/datasources/exam_remote_datasource.dart';
import 'package:online_exam/features/exams/data/models/exam_response.dart';

class ExamRemoteDataSourceImpl implements ExamRemoteDataSource {
  final ApiService _apiService;
  const ExamRemoteDataSourceImpl(this._apiService);

  @override
  Future<BaseResponse<ExamResponse>> getAllExamsOnSubject({
    required String token,
    required String subjectId,
  }) async {
    return safeApiCall<ExamResponse>(
      call: () async =>
          await _apiService.getAllExamsOnSubject(token, subjectId),
    );
  }
}
