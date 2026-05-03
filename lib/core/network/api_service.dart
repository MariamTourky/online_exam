import 'package:dio/dio.dart';
import 'package:online_exam/core/values/app_endpoints.dart';
import 'package:online_exam/features/subjects/data/models/subject_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:injectable/injectable.dart';

import '../../config/constants/api_endpoints.dart';

part 'api_service.g.dart'; // Generated file

@lazySingleton
@RestApi(baseUrl: ApiEndpoints.baseUrl)
abstract class ApiService {

  @factoryMethod
  factory ApiService(Dio dio) = _ApiService;
  @GET(AppEndpoints.allSubjects)
  
  Future<HttpResponse<SubjectResponse>> getAllSubjects(@Header("token") String token);



}
