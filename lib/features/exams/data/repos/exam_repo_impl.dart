import 'package:injectable/injectable.dart';
import 'package:online_exam/core/base_response/base_response.dart';
import 'package:online_exam/core/network/api_service.dart';
import 'package:online_exam/core/network/safe_api_call.dart';
import 'package:online_exam/features/exams/data/datasources/exam_remote_datasource.dart';
import 'package:online_exam/features/exams/data/models/exam_response.dart';
import 'package:online_exam/features/exams/data/models/question_response.dart';
import 'package:online_exam/features/exams/domain/entities/exam_model.dart';
import 'package:online_exam/features/exams/domain/entities/qouestion_model.dart';
import 'package:online_exam/features/exams/domain/repos/exam_repo.dart';

@Injectable(as: ExamRepo)
class ExamRepoImpl implements ExamRepo {
  final ExamRemoteDataSource _remoteDataSource;
  final ApiService _apiService;
  ExamRepoImpl(this._remoteDataSource, this._apiService);

  @override
  Future<BaseResponse<List<ExamModel>>> getAllExamsOnSubject({
    required String token,
    required String subjectId,
  }) async {
    final response = await _remoteDataSource.getAllExamsOnSubject(
      token: token,
      subjectId: subjectId,
    );

    switch (response) {
      case SuccessResponse<ExamResponse>():
        return SuccessResponse(
          data: response.data.exams?.map((e) => e.toEntity()).toList() ?? [],
        );
      case ErrorResponse<ExamResponse>():
        return ErrorResponse(error: response.error);
    }
  }

  @override
  Future<BaseResponse<List<QuestionModel>>> getAllQuestionsOnExam({
    required String token,
    required String examId,
  }) async {
    final response = await safeApiCall<QuestionResponse>(
      call: () => _apiService.getAllQuestionsOnExam(token, examId),
    );

    switch (response) {
      case SuccessResponse<QuestionResponse>():
        return SuccessResponse(
          data: response.data.questions?.map((e) => e.toEntity()).toList() ?? [],
        );
      case ErrorResponse<QuestionResponse>():
        return ErrorResponse(error: response.error);
    }
  }
}
