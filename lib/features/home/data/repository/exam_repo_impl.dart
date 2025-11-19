import 'package:dartz/dartz.dart';
import 'package:online_exam/features/home/domain/models/exam_model.dart';
import 'package:online_exam/features/home/domain/models/exam_model.dart' hide ExamModel;
import 'package:online_exam/features/home/domain/models/subject_model.dart';
import 'package:online_exam/features/home/domain/repositories/exam_repo.dart';

class ExamsRepoImpl implements ExamsRepo {
@override
  Future<List<ExamModel>> getExams() {
    // TODO: implement getExams
    throw UnimplementedError();
  }
}
