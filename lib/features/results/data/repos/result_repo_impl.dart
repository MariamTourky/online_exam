import 'package:injectable/injectable.dart';
import 'package:online_exam/core/base_response/base_response.dart';
import 'package:online_exam/features/results/data/datasources/result_local_datasource.dart';
import 'package:online_exam/features/results/domain/entities/result_entity.dart';
import 'package:online_exam/features/results/domain/repos/result_repo.dart';

@Injectable(as: ResultsRepo)
class ResultRepoImpl implements ResultsRepo {
  final ResultLocalDatasource resultLocalDatasource;
  ResultRepoImpl({required this.resultLocalDatasource});
  @override
  Future<BaseResponse<ResultEntity?>> getResult() {
    // TODO: implement getResult
    throw UnimplementedError();
  }

  @override
  Future<BaseResponse<ResultEntity?>> saveResult(ResultEntity result) {
    // TODO: implement saveResult
    throw UnimplementedError();
  }
}
