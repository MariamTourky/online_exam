import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/config/constants/api_endpoints.dart';
import 'package:online_exam/features/home/data/models/exam_response.dart';
import 'package:online_exam/features/home/data/models/subject_response.dart';
import 'package:retrofit/retrofit.dart';
part 'api_client.g.dart';

@lazySingleton
@RestApi()
abstract class HomeApiClient {
  @factoryMethod
  factory HomeApiClient(Dio dio, {String? baseUrl}) = _HomeApiClient;

  @GET("${ApiEndpoints.subjects}/{id}")
  Future<SubjectResponse> getSubject(@Path("id") int id);

  @GET(ApiEndpoints.subjects)
  Future<List<SubjectResponse>> getSubjects();

  @GET(ApiEndpoints.exams)
  Future<List<ExamResponse>> getExams();

@GET("${ApiEndpoints.exams}/{id}")
  Future<ExamResponse> getExam(@Path("id") int id);

}
