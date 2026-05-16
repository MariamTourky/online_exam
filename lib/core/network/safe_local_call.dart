import 'package:flutter/material.dart';
import 'package:online_exam/core/base_response/base_response.dart';

Future<BaseResponse<T?>> safeLocalCall<T>({
  required Future<BaseResponse<T?>> Function() call,
}) async {
  try {
    return await call();
  } catch (e) {
    debugPrint('Error in safeLocalCall: $e');
    return ErrorResponse(error: e as Exception);
  }
}
