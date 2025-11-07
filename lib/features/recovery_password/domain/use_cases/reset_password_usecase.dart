import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failure.dart';
import '../../data/request_models/reset_password/reset_password_dto.dart';
import '../entities/reset_password_entity.dart';
import '../repositories_contract/recovery_password_data_contract.dart';
@lazySingleton

class ResetPasswordUseCase {
  final RecoveryPasswordDataContract _repository;

  ResetPasswordUseCase(this._repository);

  Future<Either<Failure, ResetPasswordEntity>> call(ResetPasswordDto request) {
    return _repository.resetPassword(request);
  }
}
