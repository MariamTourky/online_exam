import 'package:injectable/injectable.dart';
import 'package:online_exam/core/base_response/base_response.dart';
import 'package:online_exam/core/storage/shared_prefs_service.dart';
import 'package:online_exam/features/results/data/datasources/result_local_datasource.dart';
import 'package:online_exam/features/results/data/models/result_model.dart';

@LazySingleton(as: ResultLocalDatasource)
class ResultLocalDatasourceImpl implements ResultLocalDatasource {
  final SharedPrefsService _sharedPrefsService;
  static const String _resultKey = 'last_exam_result';

  ResultLocalDatasourceImpl(this._sharedPrefsService);
  @override
  Future<BaseResponse<ResultModel?>> getResult() {
    // TODO: implement getResult
    throw UnimplementedError();
  }

  @override
  Future<BaseResponse<ResultModel?>> saveResult(ResultModel resultModel) {
    // TODO: implement saveResult
    throw UnimplementedError();
  }
}
