import 'package:online_exam/features/home/domain/models/exam_model.dart';
import 'package:online_exam/features/home/domain/repositories/exam_repo.dart';

class GetExamUseCase {
  final ExamsRepo repository;
  GetExamUseCase(this.repository);
  Future<List<ExamModel>> call() async {
    return await repository.getExams();
  }
}
