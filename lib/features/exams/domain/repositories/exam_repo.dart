import 'package:online_exam/core/base_response/base_response.dart';
import 'package:online_exam/features/exams/domain/entities/exam_model.dart';

abstract class ExamRepo {
  const ExamRepo();

  Future<BaseResponse<List<ExamModel>>> getAllExamsOnSubject({
    required String token,
    required String subjectId,
  });
}