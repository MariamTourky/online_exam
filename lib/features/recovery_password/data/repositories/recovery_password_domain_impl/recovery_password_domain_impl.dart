import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/error/failure.dart';
import 'package:online_exam/features/recovery_password/data/repositories/recovery_password_data_source_contract/recovery_password_data_scource_contract.dart';
import 'package:online_exam/features/recovery_password/data/request_models/reset_password/reset_password_dto.dart';
import 'package:online_exam/features/recovery_password/domain/entities/forgot_password_entity.dart';
import 'package:online_exam/features/recovery_password/domain/entities/reset_password_entity.dart';
import 'package:online_exam/features/recovery_password/domain/entities/verify_reset_code_entity.dart';
import 'package:online_exam/features/recovery_password/domain/repositories_contract/recovery_password_data_contract.dart';

import '../../../../../core/storage/shared_prefs_service.dart';
import '../../../../../core/storage/storage_keys.dart';

@LazySingleton(as: RecoveryPasswordDataContract)
class RercoveryPasswordDomainImpl implements RecoveryPasswordDataContract {
  final RecoverPasswordDataScourcContract _recoverPasswordDataScourcContract;
  final SharedPrefsService _prefs;

  RercoveryPasswordDomainImpl(this._recoverPasswordDataScourcContract, this._prefs);

  @override
  Future<Either<Failure, ForgotPasswordEntity>> forgetPassword(String email) async {
    final result = await _recoverPasswordDataScourcContract.forgetPassword(email);

    return result.fold(
          (failure) => Left(failure),
          (response) => Right(response.toEntity()),
    );
  }

  @override
  Future<Either<Failure, VerifyResetCodeEntity>> verifyResetCode(String resetCode) async {
    final result = await _recoverPasswordDataScourcContract.verifyResetCode(resetCode);

    return result.fold(
          (failure) => Left(failure),
          (response) => Right(response.toEntity()),
    );
  }

  @override
  Future<Either<Failure, ResetPasswordEntity>> resetPassword(ResetPasswordDto request) async {
    final result = await _recoverPasswordDataScourcContract.resetPassword(request);

    return result.fold(
          (failure) async  => Left(failure),
          (response) async {
        if (response.token != null && response.token!.isNotEmpty) {
          await _prefs.saveString(StorageKeys.token, response.token!);
        }
        return Right(response.toEntity());
      },
    );
  }
}
