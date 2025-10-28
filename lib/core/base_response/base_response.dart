sealed class BaseResponse<T> {}

class SuccessResponse<T> extends BaseResponse<T> {
  final T data;
  SuccessResponse({required this.data});
}

class ErrorResponse<T> extends BaseResponse<T> {
  final Exception error;
  String message = "something went wrong";
  ErrorResponse({required this.error}) {
    message = "dfljkghdkjf";
  }
}
