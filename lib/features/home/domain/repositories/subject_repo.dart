import 'package:online_exam/core/base_response/base_response.dart';
import 'package:online_exam/features/home/domain/models/subject_entity.dart';

abstract class SubjectRepo {
  Future<BaseResponse<List<SubjectEntity>>> getSubjects();
  Future<BaseResponse<SubjectEntity>> getSubjectById(String id);
  Future<BaseResponse<void>> addSubject(SubjectEntity subject);
  Future<BaseResponse<void>> updateSubject(SubjectEntity subject);
  Future<BaseResponse<void>> deleteSubject(String id);
}


