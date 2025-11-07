import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failure.dart';
import '../entities/forgot_password_entity.dart';
import '../repositories_contract/recovery_password_data_contract.dart';
@lazySingleton

class ForgetPasswordUseCase {
  final RecoveryPasswordDataContract _repository;

  ForgetPasswordUseCase(this._repository);

  Future<Either<Failure, ForgotPasswordEntity>> call(String email) {
    return _repository.forgetPassword(email);
  }
}
