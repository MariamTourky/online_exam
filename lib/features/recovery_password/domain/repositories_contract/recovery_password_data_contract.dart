import 'package:dartz/dartz.dart';
import 'package:online_exam/core/error/failure.dart';
import 'package:online_exam/features/recovery_password/data/request_models/reset_password/reset_password_dto.dart';
import 'package:online_exam/features/recovery_password/domain/entities/reset_password_entity.dart';

abstract class RecoveryPasswordDataContract{

  Future<Either<Failure,ResetPasswordEntity>> resetPassword(
      ResetPasswordDto request);
}