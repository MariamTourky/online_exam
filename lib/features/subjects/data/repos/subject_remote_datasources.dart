import 'package:online_exam/features/subjects/data/models/subject_response.dart';

abstract class SubjectRemoteDatasources {
  Future<List<SubjectResponse>> getAllSubjects(String token);
}