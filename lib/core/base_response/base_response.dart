sealed class BaseResponse<T> {
  bool get isSuccess => this is SuccessResponse<T>;
  bool get isError => this is ErrorResponse<T>;
}

class SuccessResponse<T> extends BaseResponse<T> {
  final T data;
  SuccessResponse({required this.data});
}

class ErrorResponse<T> extends BaseResponse<T> {
  final Exception error;
  ErrorResponse({required this.error});
}
