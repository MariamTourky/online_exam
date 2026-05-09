import 'package:injectable/injectable.dart';
import 'package:online_exam/core/base_response/base_response.dart';
import 'package:online_exam/core/network/api_service.dart';
import 'package:online_exam/features/exams/data/datasources/exam_remote_datasource.dart';
import 'package:online_exam/features/exams/data/models/exam_response.dart';

@Injectable(as: ExamRemoteDataSource)
class ExamRemoteDataSourceImpl implements ExamRemoteDataSource {
  final ApiService _apiService;
  const ExamRemoteDataSourceImpl(this._apiService);

  @override
  Future<BaseResponse<ExamResponse>> getAllExamsOnSubject({
    required String token,
    required String subjectId,
  }) async {
    try {
      final response = await _apiService.getAllExamsOnSubject(token, subjectId);
      return SuccessResponse(data: response.data);
    } catch (e) {
      return ErrorResponse(error: e as Exception);
    }
  }
}
