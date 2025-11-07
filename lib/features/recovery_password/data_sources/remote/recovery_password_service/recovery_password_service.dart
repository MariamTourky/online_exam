import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../../../../config/constants/api_endpoints.dart';
import '../../../data/request_models/forgot_password/forgot_password_dto.dart';
import '../../../data/request_models/reset_password/reset_password_dto.dart';
import '../../../data/request_models/verify_reset_code/verify_reset_code_dto.dart';
import '../response_models/forgot_password_response/forget_password_response.dart';
import '../response_models/reset_password_response/reset_password_response.dart';
import '../response_models/verify_reset_code_response/verify_reset_code_response.dart';

part 'recovery_password_service.g.dart';

@lazySingleton
@RestApi(baseUrl: ApiEndpoints.baseUrl)
abstract class RecoveryPasswordService {

  @factoryMethod
  factory RecoveryPasswordService(Dio dio) = _RecoveryPasswordService;

  @POST(ApiEndpoints.forgetPassword)
  Future<ForgotPasswordResponse> forgetPassword(
      @Body() ForgotPasswordDto request);

  @POST(ApiEndpoints.verifyResetCode)
  Future<VerifyResetCodeResponse> verifyResetCode(
      @Body() VerifyResetCodeDto resetCode);

  @PUT(ApiEndpoints.resetPassword)
  Future<ResetPasswordResponse> resetPassword(
      @Body() ResetPasswordDto request);
}
