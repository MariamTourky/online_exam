import 'package:online_exam/core/base_response/base_response.dart';
import 'package:online_exam/features/exams/domain/entities/qouestion_model.dart';
import 'package:online_exam/features/exams/domain/repos/exam_repo.dart';

class GetAllQuestionUsecase {
  final ExamRepo _examRepo;
  GetAllQuestionUsecase(this._examRepo);

  Future<BaseResponse<QuestionModel>> call({
    required String token,
    required String examId,
  }) async {
    return await _examRepo.getAllquestionsOnExam(token: token, examId: examId);
  }
}
