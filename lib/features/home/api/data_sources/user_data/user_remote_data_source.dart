
import 'package:online_exam/features/home/api/api_client/api_client.dart';
import 'package:online_exam/features/home/data/models/response_models/user_data_response.dart';

class UserRemoteDataSource {
  final HomeApiClient apiClient;

  UserRemoteDataSource(this.apiClient);

  Future<UserDataResponse> getUserData() async {

    final List<UserDataResponse> jsonList = await apiClient.getUserData();

    if (jsonList.isEmpty) {
      throw Exception('No user data returned from API');
    }

    return jsonList.first;
  }
}
