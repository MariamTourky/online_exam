
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';
import '../../../../../config/constants/api_endpoints.dart';
import '../../../data/request_models/user_sign_up_dto.dart';
import '../response_model/user_sign_up_response.dart';

part 'sign_up_service.g.dart'; // Generated file

@lazySingleton
@RestApi(baseUrl: ApiEndpoints.baseUrl)
abstract class SignUpService {
  @factoryMethod
  factory SignUpService(Dio dio) = _SignUpService;
  @POST(ApiEndpoints.signup)
  Future<UserSignUpResponse> signUp(@Body() UserSignUpDto body);

}


