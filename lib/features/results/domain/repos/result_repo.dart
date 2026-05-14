import 'package:online_exam/core/base_response/base_response.dart';
import 'package:online_exam/features/results/domain/entities/result_entity.dart';

abstract class ResultsRepo {
  Future<BaseResponse<ResultEntity?>> saveResult(ResultEntity result);
  Future<BaseResponse<ResultEntity?>> getResult();
}
