
import 'package:dartz/dartz.dart';

import 'package:online_exam/core/error/failure.dart';

import 'package:online_exam/features/recovery_password/data/request_models/reset_password/reset_password_dto.dart';
import 'package:online_exam/features/recovery_password/data_sources/remote/recovery_password_service/recovery_password_service.dart';

import 'package:online_exam/features/recovery_password/data_sources/remote/response_models/forgot_password_response/forget_password_response.dart';

import 'package:online_exam/features/recovery_password/data_sources/remote/response_models/reset_password_response/reset_password_response.dart';

import 'package:online_exam/features/recovery_password/data_sources/remote/response_models/verify_reset_code_response/verify_reset_code_response.dart';
import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';

import '../../../../core/error/app_error_messages.dart';
import '../../data/repositories/recovery_password_data_source_contract/recovery_password_data_scource_contract.dart';
import '../../data/request_models/forgot_password/forgot_password_dto.dart';
import '../../data/request_models/verify_reset_code/verify_reset_code_dto.dart';
@LazySingleton(as: RecoverPasswordDataScourcContract)
class RecoverPasswordDataImpl implements RecoverPasswordDataScourcContract {
  final RecoveryPasswordService _recoveryPasswordService;

  RecoverPasswordDataImpl(this._recoveryPasswordService);

  @override
  Future<Either<Failure, ForgotPasswordResponse>> forgetPassword(String email) async {
    try {
      final dto = ForgotPasswordDto(email: email);
      final response = await _recoveryPasswordService.forgetPassword(dto);
      return Right(response);
    } on DioException catch (e) {
      final message =
          e.response?.data['message'] ?? AppErrorMessages.serverError;

      if (e.type == DioExceptionType.connectionTimeout) {
        return Left(TimeoutFailure(AppErrorMessages.connectionTimeout));
      } else if (e.type == DioExceptionType.connectionError) {
        return Left(NetworkFailure(AppErrorMessages.noInternet));
      } else {
        return Left(ServerFailure(message));
      }
    } catch (e) {
      return Left(UnknownFailure(AppErrorMessages.unknownError));
    }
  }

  @override
  Future<Either<Failure, VerifyResetCodeResponse>> verifyResetCode(
      String resetCode) async {
    try {
      final dto = VerifyResetCodeDto(resetCode: resetCode);
      final response = await _recoveryPasswordService.verifyResetCode(dto);
      return Right(response);
    } on DioException catch (e) {
      final message =
          e.response?.data['message'] ?? AppErrorMessages.serverError;

      if (e.type == DioExceptionType.connectionTimeout) {
        return Left(TimeoutFailure(AppErrorMessages.connectionTimeout));
      } else if (e.type == DioExceptionType.connectionError) {
        return Left(NetworkFailure(AppErrorMessages.noInternet));
      } else {
        return Left(ServerFailure(message));
      }
    } catch (e) {
      return Left(UnknownFailure(AppErrorMessages.unknownError));
    }
  }

  @override
  Future<Either<Failure, ResetPasswordResponse>> resetPassword(
      ResetPasswordDto request) async {
    try {
      final response = await _recoveryPasswordService.resetPassword(request);
      return Right(response);
    } on DioException catch (e) {
      final message =
          e.response?.data['message'] ?? AppErrorMessages.serverError;

      if (e.type == DioExceptionType.connectionTimeout) {
        return Left(TimeoutFailure(AppErrorMessages.connectionTimeout));
      } else if (e.type == DioExceptionType.connectionError) {
        return Left(NetworkFailure(AppErrorMessages.noInternet));
      } else {
        return Left(ServerFailure(message));
      }
    } catch (e) {
      return Left(UnknownFailure(AppErrorMessages.unknownError));
    }
  }
}
