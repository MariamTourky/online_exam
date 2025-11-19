
import 'package:online_exam/features/home/domain/models/subject_model.dart';

abstract class SubjectRepo {
  Future<List<SubjectModel>> getSubjects();
}
