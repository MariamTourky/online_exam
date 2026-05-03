import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/base_response/base_response.dart';
import 'package:online_exam/features/subjects/domain/models/subject_model.dart';
import 'package:online_exam/features/subjects/domain/repos/subject_repo.dart';

part 'subject_state.dart';

@injectable
class SubjectCubit extends Cubit<SubjectState> {
  final SubjectRepo _subjectRepo;
  SubjectCubit(this._subjectRepo) : super(SubjectInitial());

  getAllSubjects()async{
    emit(SubjectLoading());
    final response = await _subjectRepo.getAllSubjects();
    switch(response){
      case SuccessResponse(data: final subjects):
        emit(SubjectLoaded(subjects));
      case ErrorResponse(error: final error):
        emit(SubjectError(error.toString()));
    }
  }
}
