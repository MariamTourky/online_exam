import 'package:online_exam/features/home/api/api_client/api_client.dart';
import 'package:online_exam/features/home/data/models/response_models/subject_response.dart';

abstract class SubjectRemoteDataSource {
  Future<List<SubjectResponse>> getSubjects();
  Future<SubjectResponse> getSubject(int id);
}

class SubjectRemoteDataSourceImpl implements SubjectRemoteDataSource {
  final HomeApiClient apiClient;

  SubjectRemoteDataSourceImpl(this.apiClient);

  @override
  Future<List<SubjectResponse>> getSubjects() async {
    final response = await apiClient.getSubjects();
    return response;
  }

  @override
  Future<SubjectResponse> getSubject(int id) async {
    final response = await apiClient.getSubject(id);
    return response;
  }
}
