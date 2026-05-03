import 'package:online_exam/core/base_response/base_response.dart';
import 'package:online_exam/features/subjects/domain/models/subject_model.dart';

abstract class SubjectRepo {
  Future<BaseResponse<List<SubjectModel>>> getAllSubjects();
}