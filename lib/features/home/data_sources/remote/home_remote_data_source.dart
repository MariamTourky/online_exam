import 'dart:core';

import 'package:online_exam/features/home/data_sources/models/exam_dto.dart';
import 'package:online_exam/features/home/data_sources/models/subject_dto.dart';
import 'package:online_exam/features/login/data_sources/remote/response_model/user_login_response.dart';

abstract class HomeRemoteDataSource {
  Future<List<ExamDto>> fetchExploreExams();
  Future<User> fetchProfileData();
  Future<List<SubjectDto>> fetchSubjects();
}
