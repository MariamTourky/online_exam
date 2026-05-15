import 'package:online_exam/features/results/domain/entities/result_entity.dart';

abstract class ResultsRepo {
  Future<List<ResultEntity>> getAllResults();
  Future<void> saveResult(ResultEntity result);
}
