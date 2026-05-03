import 'package:injectable/injectable.dart';
import 'package:online_exam/core/base_response/base_response.dart';
import 'package:online_exam/features/subjects/domain/models/subject_model.dart';
import 'package:online_exam/features/subjects/domain/repos/subject_repo.dart';

@injectable
class GetAllSubjectsUseCase {
  final SubjectRepo _subjectRepo;
  GetAllSubjectsUseCase(this._subjectRepo);

  Future<BaseResponse<List<SubjectModel>>> call(String token) async {
    return await _subjectRepo.getAllSubjects(token);
  }
}
