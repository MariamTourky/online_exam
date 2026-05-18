import 'package:online_exam/features/results/domain/entities/result_entity.dart';

abstract class ResultsRepo {
  Future<List<ResultEntity>> getAllResults(String userId);
  Future<void> saveResult(ResultEntity result, String userId);
}
