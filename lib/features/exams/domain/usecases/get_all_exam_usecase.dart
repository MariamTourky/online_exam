import 'package:injectable/injectable.dart';
import 'package:online_exam/core/base_response/base_response.dart';
import 'package:online_exam/features/exams/domain/entities/exam_model.dart';
import 'package:online_exam/features/exams/domain/repos/exam_repo.dart';

@injectable
class GetAllExamUseCase {
  final ExamRepo _repo;
  const GetAllExamUseCase(this._repo);

  Future<BaseResponse<List<ExamModel>>> getAllExamsOnSubject({
    required String token,
    required String subjectId,
  }) async {
    return _repo.getAllExamsOnSubject(token: token, subjectId: subjectId);
  }
}
