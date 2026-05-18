import 'package:online_exam/core/base_response/base_response.dart';
import 'package:online_exam/features/subjects/data/models/subject_response.dart';

abstract class SubjectRemoteDatasources {
  Future<BaseResponse<SubjectResponse>> getAllSubjects(String token);
}
