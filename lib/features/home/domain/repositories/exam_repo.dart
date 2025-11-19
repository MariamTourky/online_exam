import 'package:dartz/dartz.dart';
import 'package:online_exam/features/home/domain/models/exam_model.dart';

abstract class ExamsRepo {

  Future<List<ExamModel>> getExams();

}
