import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failure.dart';
import '../entities/user_sign_up_entity.dart';
import '../repositories_contract/sign_up_data_contract.dart';

@lazySingleton
class SignUpUseCase {
  final SignUpDataContract _repository;

  const SignUpUseCase(this._repository);

  Future<Either<Failure, UserSignUpEntity>> call(UserSignUpEntity entity) {
    return _repository.signUp(entity);
  }
}
