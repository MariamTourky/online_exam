import 'dart:core';

import 'package:online_exam/features/home/domain/models/exam_model.dart';
import 'package:online_exam/features/home/domain/models/result_model.dart';
import 'package:online_exam/features/home/domain/models/subject_model.dart';
import 'package:online_exam/features/login/data_sources/remote/response_model/user_login_response.dart';

abstract class HomeRemoteDataSource {
  Future<List<ExamModel>> fetchExploreExams();
  Future<List<ResultModel>> fetchResults();
  Future<User> fetchProfileData();
  Future<List<SubjectModel>> fetchSubjects();
}
