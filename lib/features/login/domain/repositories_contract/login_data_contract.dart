import 'package:dartz/dartz.dart';
import 'package:online_exam/features/login/domain/entities/user_login_entity.dart';
import '../../../../core/error/failure.dart';

abstract class LoginDataContract {
  Future<Either<Failure, UserLoginEntity>> login(UserLoginEntity entity);
}