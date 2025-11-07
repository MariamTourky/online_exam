import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/features/login/domain/repositories_contract/login_data_contract.dart';

import '../../../../core/error/failure.dart';
import '../entities/user_login_entity.dart';

@lazySingleton
class LoginUseCase {
  final LoginDataContract _repository;

  const LoginUseCase(this._repository);

  Future<Either<Failure, UserLoginEntity>> call(UserLoginEntity entity) {
    return _repository.login(entity);
  }
}