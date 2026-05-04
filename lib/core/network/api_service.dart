import 'package:dio/dio.dart';
import 'package:online_exam/features/exams/data/models/exam_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:injectable/injectable.dart';

import '../../config/constants/api_endpoints.dart';

part 'api_service.g.dart'; // Generated file

@lazySingleton
@RestApi(baseUrl: ApiEndpoints.baseUrl)
abstract class ApiService {
  @factoryMethod
  factory ApiService(Dio dio) = _ApiService;

  @GET(ApiEndpoints.exams)
  Future<HttpResponse<ExamResponse>> getAllExamsOnSubject(
    @Header("token") String token,
    @Query("subject") String subject,
  );
}
