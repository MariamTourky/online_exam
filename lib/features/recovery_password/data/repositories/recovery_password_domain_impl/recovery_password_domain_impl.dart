import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/error/failure.dart';
import 'package:online_exam/features/recovery_password/data/repositories/recovery_password_data_source_contract/recovery_password_data_scource_contract.dart';
import 'package:online_exam/features/recovery_password/domain/entities/forgot_password_entity.dart';

import 'package:online_exam/features/recovery_password/domain/repositories_contract/recovery_password_data_contract.dart';

@LazySingleton(as: RecoveryPasswordDataContract)
class RercoveryPasswordDomainImpl implements RecoveryPasswordDataContract {
  final RecoverPasswordDataScourcContract _recoverPasswordDataScourcContract;

  RercoveryPasswordDomainImpl(this._recoverPasswordDataScourcContract);

  @override
  Future<Either<Failure, ForgotPasswordEntity>> forgetPassword(String email) async {
    final result = await _recoverPasswordDataScourcContract.forgetPassword(email);

    return result.fold(
          (failure) => Left(failure),
          (response) => Right(response.toEntity()),
    );
  }}

