import 'package:online_exam/core/base_response/base_response.dart';
import 'package:online_exam/features/results/data/models/result_model.dart';

abstract class ResultLocalDatasource {
  Future<BaseResponse<ResultModel?>> saveResult(ResultModel resultModel);
  Future<BaseResponse<ResultModel?>> getResult();
}
