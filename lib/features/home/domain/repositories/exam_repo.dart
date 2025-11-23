
import 'package:online_exam/features/home/domain/models/exam_model.dart';

abstract class ExamsRepo {
  Future<List<ExamModel>> getExams();
  Future<ExamModel> getExamById(String id);
  Future<ExamModel> getExamBySubject(String subjectId);
  Future<void> addExam(ExamModel exam);
}
