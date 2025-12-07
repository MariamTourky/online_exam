import 'package:dartz/dartz.dart';
import '../../../../../core/error/failure.dart';
import '../../../data_sources/remote/response_model/user_sign_up_response.dart';
import '../../request_models/user_sign_up_dto.dart';

abstract class SignUpDataSourceContract {
  Future<Either<Failure, UserSignUpResponse>> signUp(UserSignUpDto dto);
}
