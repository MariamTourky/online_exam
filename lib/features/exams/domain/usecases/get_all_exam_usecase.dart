import 'package:online_exam/core/base_response/base_response.dart';
import 'package:online_exam/features/exams/domain/entities/exam_model.dart';
import 'package:online_exam/features/exams/domain/repositories/exam_repo.dart';

class GetAllExamUseCase {
  final ExamRepo _repo;
  const GetAllExamUseCase(this._repo);

  Future<BaseResponse<List<ExamModel>>> getAllExamsOnSubject({
    required String token,
    required String subjectId,
  }) async {
    return _repo.getAllExamsOnSubject(
      token: token,
      subjectId: subjectId,
    );
  }
}