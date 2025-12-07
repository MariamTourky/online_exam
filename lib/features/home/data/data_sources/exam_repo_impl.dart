import 'package:online_exam/core/base_response/base_response.dart';
import 'package:online_exam/features/home/api/data_sources/exam/exam_local_data_source.dart';
import 'package:online_exam/features/home/api/data_sources/exam/exam_remote_data_source.dart';
import 'package:online_exam/features/home/domain/models/exam_entity.dart';
import 'package:online_exam/features/home/domain/repositories/exam_repo.dart';

class ExamRepoImpl implements ExamRepo {
  final ExamRemoteDataSource remote;
final ExamLocalDataSource local;
  ExamRepoImpl(this.remote, this.local);

  @override
  Future<BaseResponse<List<ExamEntity>>> getExams() async {
    try {
      final responses = await remote.getExams();

      // Flatten the list of ExamResponse objects to extract all ExamDto items
      final allExams = <ExamEntity>[];
      for (final response in responses) {
        if (response.exams != null) {
          allExams.addAll(response.exams!.map((e) => e.toEntity()).toList());
        }
      }

      return SuccessResponse<List<ExamEntity>>(data: allExams);
    } catch (e) {
      return ErrorResponse<List<ExamEntity>>(
        error: e is Exception ? e : Exception(e.toString()),
      );
    }
  }

  @override
  Future<BaseResponse<ExamEntity>> getExamById(String id) async {
    try {
      final response = await remote.getExam(int.parse(id));

      // The ExamResponse contains a list of ExamDto; return the first one
      if (response.exams != null && response.exams!.isNotEmpty) {
        return SuccessResponse<ExamEntity>(
          data: response.exams!.first.toEntity(),
        );
      }

      return ErrorResponse<ExamEntity>(error: Exception('No exam found'));
    } catch (e) {
      return ErrorResponse<ExamEntity>(
        error: e is Exception ? e : Exception(e.toString()),
      );
    }
  }

  @override
  Future<BaseResponse<ExamEntity>> getExamBySubject(String subjectId) async {
    try {
      // TODO: Implement once ExamRemoteDataSource has a getExamBySubject method
      return ErrorResponse<ExamEntity>(error: Exception('Not implemented'));
    } catch (e) {
      return ErrorResponse<ExamEntity>(
        error: e is Exception ? e : Exception(e.toString()),
      );
    }
  }
}
