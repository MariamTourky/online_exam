import 'package:injectable/injectable.dart';
import 'package:online_exam/core/base_response/base_response.dart';
import 'package:online_exam/features/exams/domain/entities/exam_model.dart';
import 'package:online_exam/features/exams/domain/repos/exam_repo.dart';

@injectable
class GetAllExamUseCaseUseCase {
  final ExamRepo _repo;
  const GetAllExamUseCaseUseCase(this._repo);

  Future<BaseResponse<List<ExamModel>>> call({
    required String token,
    required String subjectId,
  }) async {
    return await _repo.getAllExamsOnSubject(token: token, subjectId: subjectId);
  }
}
