import 'package:online_exam/core/base_response/base_response.dart';
import 'package:online_exam/features/home/domain/models/subject_entity.dart';
import 'package:online_exam/features/home/domain/repositories/subject_repo.dart';

class GetSubjectUseCase {
  final SubjectRepo repo;

  GetSubjectUseCase(this.repo);

  Future<BaseResponse<List<SubjectEntity>>> call() {
    return repo.getSubjects();
  }
}
