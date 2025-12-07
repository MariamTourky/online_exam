import 'package:injectable/injectable.dart';
import 'package:online_exam/features/login/data/request_models/user_login_dto.dart';
import 'package:online_exam/features/login/data_sources/remote/response_model/user_login_response.dart';
import 'package:retrofit/http.dart';
import '../../../../../config/constants/api_endpoints.dart';
import 'package:retrofit/error_logger.dart';
import 'package:dio/dio.dart';

part 'login_service.g.dart'; // Generated file

@lazySingleton
@RestApi(baseUrl: ApiEndpoints.baseUrl)
abstract class LoginService {
  @factoryMethod
  factory LoginService(Dio dio) = _LoginService;
  @POST(ApiEndpoints.login)
  Future<UserloginResponse> login(@Body() UserloginDto body);

}