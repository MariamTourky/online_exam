import 'package:dio/dio.dart';
import 'package:online_exam/core/network/api_result.dart';
import 'package:online_exam/core/network/api_service.dart';
import 'package:online_exam/core/network/safe_api_call.dart';
import 'package:online_exam/features/explore/data/repos/explore_remote_datasource.dart';
import 'package:online_exam/features/explore/data/models/subject_response.dart';

class ExploreRemoteDataSourceImpl implements ExploreRemoteDataSource {
  @override
  Future<ApiResult<List<SubjectResponse>>> getAllSubjects(String token) {
    ApiService apiService = ApiService(Dio());
    
    return safeApiCall<List<SubjectResponse>>(
      call: () => apiService.getAllSubjects(token),
    );  
  }
}