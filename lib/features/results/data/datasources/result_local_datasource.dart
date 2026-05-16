import 'package:online_exam/features/results/data/models/result_model.dart';

abstract class ResultLocalDatasource {
  Future<void> saveExamResult(ResultModel result, String userId);
  Future<List<ResultModel>> getAllResults(String userId);
}
