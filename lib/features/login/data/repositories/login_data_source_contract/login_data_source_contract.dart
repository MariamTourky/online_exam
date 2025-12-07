import 'package:dartz/dartz.dart';
import 'package:online_exam/features/login/data/request_models/user_login_dto.dart';
import 'package:online_exam/features/login/data_sources/remote/response_model/user_login_response.dart';
import '../../../../../core/error/failure.dart';


abstract class LoginDataSourceContract {
  Future<Either<Failure, UserloginResponse>> login(UserloginDto dto);
}