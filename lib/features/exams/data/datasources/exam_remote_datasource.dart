import 'package:online_exam/core/base_response/base_response.dart';
import 'package:online_exam/features/exams/data/models/exam_response.dart';
import 'package:online_exam/features/exams/data/models/question_response.dart';

abstract class ExamRemoteDataSource {
  const ExamRemoteDataSource();

  Future<BaseResponse<ExamResponse>> getAllExamsOnSubject({
    required String token,
    required String subjectId,
  });
  Future<BaseResponse<QuestionResponse>> getAllQuestionOnExam({
    required String token,
    required String examId,
  });
}
