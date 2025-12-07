import 'package:online_exam/core/base_response/base_response.dart';
import 'package:online_exam/features/home/api/data_sources/subject/subject_remote_data_source.dart';
import 'package:online_exam/features/home/domain/models/subject_entity.dart';
import 'package:online_exam/features/home/domain/repositories/subject_repo.dart';

class SubjectRepoImpl implements SubjectRepo {
  final SubjectRemoteDataSource remote;

  SubjectRepoImpl(this.remote);

  @override
  Future<BaseResponse<List<SubjectEntity>>> getSubjects() async {
    try {
      final data = await remote.getSubjects();
      final entities = data.map((e) => e.toEntity()).toList();
      return SuccessResponse<List<SubjectEntity>>(data: entities);
    } catch (e) {
      return ErrorResponse<List<SubjectEntity>>(
        error: e is Exception ? e : Exception(e.toString()),
      );
    }
  }

  @override
  Future<BaseResponse<SubjectEntity>> getSubjectById(String id) async {
    try {
      final data = await remote.getSubject(int.parse(id));
      return SuccessResponse<SubjectEntity>(data: data.toEntity());
    } catch (e) {
      return ErrorResponse<SubjectEntity>(
        error: e is Exception ? e : Exception(e.toString()),
      );
    }
  }

  @override
  Future<BaseResponse<void>> addSubject(SubjectEntity subject) async {
    try {
      // TODO: Implement once SubjectRemoteDataSource has an addSubject method
      return SuccessResponse<void>(data: null);
    } catch (e) {
      return ErrorResponse<void>(
        error: e is Exception ? e : Exception(e.toString()),
      );
    }
  }

  @override
  Future<BaseResponse<void>> updateSubject(SubjectEntity subject) async {
    try {
      // TODO: Implement once SubjectRemoteDataSource has an updateSubject method
      return SuccessResponse<void>(data: null);
    } catch (e) {
      return ErrorResponse<void>(
        error: e is Exception ? e : Exception(e.toString()),
      );
    }
  }

  @override
  Future<BaseResponse<void>> deleteSubject(String id) async {
    try {
      // TODO: Implement once SubjectRemoteDataSource has a deleteSubject method
      return SuccessResponse<void>(data: null);
    } catch (e) {
      return ErrorResponse<void>(
        error: e is Exception ? e : Exception(e.toString()),
      );
    }
  }
}
