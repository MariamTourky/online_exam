import 'dart:core';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/base_response/base_response.dart';
import 'package:online_exam/core/storage/shared_prefs_service.dart';
import 'package:online_exam/features/subjects/domain/models/subject_model.dart';
import 'package:online_exam/features/subjects/domain/usecases/get_all_subjects_usecase.dart';
import 'package:online_exam/features/subjects/presentation/cubit/cubit/subject_intent.dart';

part 'subject_state.dart';

@injectable
class SubjectCubit extends Cubit<SubjectState> {
  final GetAllSubjectsUseCase getAllSubjectsUseCase;
  final SharedPrefsService sharedPrefsService;
  SubjectCubit(this.getAllSubjectsUseCase, this.sharedPrefsService)
    : super(const SubjectInitial(subjects: [], isLoading: false));

  doIntent(SubjectIntent intent) {
    switch (intent) {
      case GetAllSubjectsIntent():
        _getAllSubjects(intent);
    }
  }

  _getAllSubjects(GetAllSubjectsIntent intent) async {
    final token = await sharedPrefsService.getToken();
    emit(state.copyWith(isLoading: true));
    final response = await getAllSubjectsUseCase(token!);
    switch (response) {
      case SuccessResponse(data: final subjects):
        emit(state.copyWith(subjects: subjects, isLoading: false));
      case ErrorResponse(error: final error):
        emit(state.copyWith(error: error.toString()));
    }
  }
}
