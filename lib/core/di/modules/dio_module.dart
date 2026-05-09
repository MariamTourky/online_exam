import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';

@module
abstract class NetworkModule {
  @lazySingleton
  Dio get dio => Dio()
    ..options = BaseOptions(
      baseUrl: 'https://exam.elevateegy.com/api/v1',
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );
}
