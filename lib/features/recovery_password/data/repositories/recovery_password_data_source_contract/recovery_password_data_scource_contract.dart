import 'package:dartz/dartz.dart';
import 'package:online_exam/core/error/failure.dart';
import '../../../data_sources/remote/response_models/reset_password_response/reset_password_response.dart';
import '../../request_models/reset_password/reset_password_dto.dart';

abstract class RecoverPasswordDataScourcContract{
  Future<Either<Failure,ResetPasswordResponse>> resetPassword(
      ResetPasswordDto request);
}