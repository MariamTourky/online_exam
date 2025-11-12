import 'package:dartz/dartz.dart';
import 'package:online_exam/core/error/failure.dart';
import '../../../data_sources/remote/response_models/forgot_password_response/forget_password_response.dart';
import '../../../data_sources/remote/response_models/verify_reset_code_response/verify_reset_code_response.dart';

abstract class RecoverPasswordDataScourcContract{
  Future<Either<Failure,ForgotPasswordResponse>> forgetPassword(String email);

  Future<Either<Failure,VerifyResetCodeResponse>> verifyResetCode(String resetCode);

}