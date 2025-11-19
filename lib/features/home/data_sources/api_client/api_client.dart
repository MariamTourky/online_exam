import 'package:dio/dio.dart';
import 'package:online_exam/config/constants/api_endpoints.dart';
import 'package:online_exam/features/home/data_sources/models/exam_response.dart';

import 'package:online_exam/features/home/data_sources/models/subject_response.dart';

import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: ApiEndpoints.baseUrl)
abstract class HomeApiClient {
  factory HomeApiClient(Dio dio, {String? baseUrl}) = _HomeApiClient;

  @GET("${ApiEndpoints.Subjects}/{id}")
  Future<SubjectResponse> getSubject(@Path("id") int id);

  @GET(ApiEndpoints.Subjects)
  Future<List<SubjectResponse>> getSubjects();

  @GET(ApiEndpoints.Exams)
  Future<List<ExamResponse>> getExams();

@GET("${ApiEndpoints.Exams}/{id}")
  Future<ExamResponse> getExam(@Path("id") int id);

}
