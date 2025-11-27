import 'package:online_exam/features/home/api/api_client/api_client.dart';
import 'package:online_exam/features/home/data/models/response_models/exam_response.dart';

abstract class ExamRemoteDataSource {
  Future<List<ExamResponse>> getExams();
  Future<ExamResponse> getExam(int id);
}

class ExamRemoteDataSourceImpl implements ExamRemoteDataSource {
  final HomeApiClient apiClient;

  ExamRemoteDataSourceImpl(this.apiClient);

  @override
  Future<List<ExamResponse>> getExams() async {
    final response = await apiClient.getExams();
    return response;
  }

  @override
  Future<ExamResponse> getExam(int id) async {
    final response = await apiClient.getExam(id);
    return response;
  }
}
