import 'package:injectable/injectable.dart';
import 'package:online_exam/core/base_response/base_response.dart';
import 'package:online_exam/features/subjects/data/data_source/subject_remote_datasources.dart';
import 'package:online_exam/features/subjects/data/models/subject_response.dart';
import 'package:online_exam/features/subjects/domain/models/subject_model.dart';
import 'package:online_exam/features/subjects/domain/repos/subject_repo.dart';

@Injectable(as: SubjectRepo)
class SubjectRepoImpl implements SubjectRepo {
  final SubjectRemoteDatasources _subjectRemoteDatasources;
  SubjectRepoImpl(this._subjectRemoteDatasources);
  @override
  Future<BaseResponse<List<SubjectModel>>> getAllSubjects(String token) async {
    final response = await _subjectRemoteDatasources.getAllSubjects(token);
    switch (response) {
      case SuccessResponse<SubjectResponse>():
        return SuccessResponse(
          data: response.data.subjects?.map((e) => e.toDomain()).toList() ?? [],
        );
      case ErrorResponse<SubjectResponse>():
        return ErrorResponse(error: response.error);
    }
  }
}
