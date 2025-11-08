import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/user_sign_up_entity.dart';

abstract class SignUpDataContract {
  Future<Either<Failure, UserSignUpEntity>> signUp(UserSignUpEntity entity);
}
