import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failure.dart';
import '../entities/verify_reset_code_entity.dart';
import '../repositories_contract/recovery_password_data_contract.dart';
@lazySingleton

class VerifyResetCodeUseCase {
  final RecoveryPasswordDataContract _repository;

  VerifyResetCodeUseCase(this._repository);

  Future<Either<Failure, VerifyResetCodeEntity>> call(String resetCode) {
    return _repository.verifyResetCode(resetCode);
  }
}
