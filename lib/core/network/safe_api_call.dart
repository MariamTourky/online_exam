import 'package:dio/dio.dart';

import 'package:retrofit/retrofit.dart';

import 'api_result.dart';

Future<ApiResult<T>> safeApiCall<T>({
  required Future<HttpResponse<T>> Function() call,
  bool isBaseResponse = false,
}) async {
  print('safeApiCall: Starting API call, isBaseResponse=$isBaseResponse');
  try {
    final response = await call();
    if (response.response.statusCode! >= 200 &&
        response.response.statusCode! < 300) {
      return SuccessApiResult(data: response.data);
    } else {
      return ErrorApiResult(
        error: "Failed with status code: ${response.response.statusCode}",
      );
    }
  } on DioException catch (dioError) {
    final responseData = dioError.response?.data;
    String errorDetail;
    if (responseData is Map && responseData['error'] != null) {
      errorDetail = responseData['error'].toString();
    } else if (dioError.message != null && dioError.message!.isNotEmpty) {
      errorDetail = dioError.message!;
    } else {
      errorDetail = 'Unknown Dio error';
    }
    return ErrorApiResult(error: errorDetail);
  } catch (e) {
    return ErrorApiResult(error: "Unexpected error: $e");
  }
}
