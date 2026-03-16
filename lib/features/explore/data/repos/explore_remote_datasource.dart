import 'package:online_exam/core/network/api_result.dart';
import 'package:online_exam/features/explore/data/models/subject_response.dart';

abstract class ExploreRemoteDataSource {
  Future<ApiResult<List<SubjectResponse>>> getAllSubjects(String token);
}