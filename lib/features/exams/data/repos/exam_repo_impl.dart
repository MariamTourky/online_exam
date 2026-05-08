import 'package:injectable/injectable.dart';
import 'package:online_exam/core/base_response/base_response.dart';
import 'package:online_exam/features/exams/data/datasources/exam_remote_datasource.dart';
import 'package:online_exam/features/exams/data/models/exam_response.dart';
import 'package:online_exam/features/exams/domain/entities/exam_model.dart';
import 'package:online_exam/features/exams/domain/repos/exam_repo.dart';

@Injectable(as: ExamRepo)
class ExamRepoImpl implements ExamRepo {
  final ExamRemoteDataSource _remoteDataSource;
  ExamRepoImpl(this._remoteDataSource);

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
}
