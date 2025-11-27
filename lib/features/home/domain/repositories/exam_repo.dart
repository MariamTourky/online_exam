import 'package:online_exam/core/base_response/base_response.dart';
import 'package:online_exam/features/home/domain/models/exam_entity.dart';

abstract class ExamRepo {
  Future<BaseResponse<List<ExamEntity>>> getExams();
  Future<BaseResponse<ExamEntity>> getExamById(String id);
  Future<BaseResponse<ExamEntity>> getExamBySubject(String subjectId);
}
