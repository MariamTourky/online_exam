import 'package:injectable/injectable.dart';
import 'package:online_exam/features/results/data/datasources/result_local_datasource.dart';
import 'package:online_exam/features/results/data/models/result_model.dart';
import 'package:online_exam/features/results/domain/entities/result_entity.dart';
import 'package:online_exam/features/results/domain/repos/result_repo.dart';

@Injectable(as: ResultsRepo)
class ResultRepoImpl implements ResultsRepo {
  final ResultLocalDatasource resultLocalDatasource;

  ResultRepoImpl({required this.resultLocalDatasource});

  @override
  Future<void> saveResult(ResultEntity result, String userId) {
    final model = ResultModel.fromEntity(result);
    return resultLocalDatasource.saveExamResult(model, userId);
  }

  @override
  Future<List<ResultEntity>> getAllResults(String userId) async {
    return await resultLocalDatasource.getAllResults(userId);

  }
}
