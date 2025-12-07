import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/features/sign_up/data_sources/remote/response_model/user_sign_up_response.dart';
import 'package:online_exam/features/sign_up/data_sources/remote/sign_up_service/sign_up_service.dart';
import '../../../../core/error/app_error_messages.dart';
import '../../../../core/error/failure.dart';
import '../../data/repositories/sign_up_data_source_contract/sign_up_data_source_contract.dart';
import '../../data/request_models/user_sign_up_dto.dart';
import 'package:dio/dio.dart';

@LazySingleton(as: SignUpDataSourceContract)
class SignUpRemoteDataSourceImpl implements SignUpDataSourceContract {
  final SignUpService _service;

  SignUpRemoteDataSourceImpl(this._service);

  @override
  Future<Either<Failure, UserSignUpResponse>> signUp(UserSignUpDto dto) async {
    try {
      final response = await _service.signUp(dto);
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

