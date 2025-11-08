import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/features/login/data_sources/remote/login_service/login_service.dart';
import 'package:online_exam/features/login/data_sources/remote/response_model/user_login_response.dart';
import '../../../../core/error/app_error_messages.dart';
import '../../../../core/error/failure.dart';
import 'package:dio/dio.dart';
import '../../data/repositories/login_data_source_contract/login_data_source_contract.dart';
import '../../data/request_models/user_login_dto.dart';

@LazySingleton(as: LoginDataSourceContract)
class LoginRemoteDataSourceImpl implements LoginDataSourceContract {
  final LoginService _service;

  LoginRemoteDataSourceImpl(this._service);

  @override
  Future<Either<Failure, UserloginResponse>> login(UserloginDto dto) async {
    try {
      final response = await _service.login(dto);
      return Right(response);
    } on DioException catch (e) {
      final statusCode = e.response?.statusCode;
      final message = e.response?.data['message'] ?? AppErrorMessages.serverError;

      if (e.type == DioExceptionType.connectionTimeout) {
        return Left(TimeoutFailure(AppErrorMessages.connectionTimeout));
      } else if (e.type == DioExceptionType.connectionError) {
        return Left(NetworkFailure(AppErrorMessages.noInternet));
      }
      else if (statusCode == 401) {
        return Left(UnauthorizedFailure(message));
      } else {
        return Left(ServerFailure(message));
      }
    } catch (e) {
      return Left(UnknownFailure(AppErrorMessages.unknownError));
    }
  }
}