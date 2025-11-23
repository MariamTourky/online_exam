

import 'package:online_exam/features/home/domain/models/subject_model.dart';

abstract class SubjectRepo {
  Future<List<SubjectModel>> getSubjects();
  Future<SubjectModel> getSubjectById(String id);
  Future<void> addSubject(SubjectModel subject);
  Future<void> updateSubject(SubjectModel subject);
  Future<void> deleteSubject(String id);
}
