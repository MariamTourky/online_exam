import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:online_exam/core/base_response/base_response.dart';
import 'package:retrofit/retrofit.dart';

Future<BaseResponse<T>> safeApiCall<T>({
  required Future<HttpResponse<T>> Function() call,
  bool isBaseResponse = false,
}) async {
  debugPrint('safeApiCall: Starting API call, isBaseResponse=$isBaseResponse');
  try {
    final response = await call();
    if (response.response.statusCode! >= 200 &&
        response.response.statusCode! < 300) {
      return SuccessResponse(data: response.data);
    } else {
      return ErrorResponse(
        error: Exception(
          "Failed with status code: ${response.response.statusCode}",
        ),
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
    return ErrorResponse(error: Exception(errorDetail));
  } catch (e) {
    return ErrorResponse(error: Exception("Unexpected error: $e"));
  }
}
