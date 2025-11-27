import 'package:online_exam/core/base_response/base_response.dart';
import 'package:online_exam/features/home/domain/models/exam_entity.dart';
import 'package:online_exam/features/home/domain/repositories/exam_repo.dart';

class GetExamUseCase {
  final ExamRepo repository;
  GetExamUseCase(this.repository);

 Future<BaseResponse<List<ExamEntity>>> call() => repository.getExams();

}

   