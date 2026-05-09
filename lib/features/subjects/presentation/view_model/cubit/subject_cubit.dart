import 'dart:core';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/base_response/base_response.dart';
import 'package:online_exam/core/storage/shared_prefs_service.dart';
import 'package:online_exam/features/subjects/domain/models/subject_model.dart';
import 'package:online_exam/features/subjects/domain/usecases/get_all_subjects_usecase.dart';
import 'package:online_exam/features/subjects/presentation/view_model/cubit/subject_intent.dart';

part 'subject_state.dart';

@injectable
class SubjectCubit extends Cubit<SubjectState> {
  final GetAllSubjectsUseCase getAllSubjectsUseCase;
  final SharedPrefsService sharedPrefsService;
  SubjectCubit(this.getAllSubjectsUseCase, this.sharedPrefsService)
    : super(SubjectInitial(isLoading: false, subjects: []));

  void doIntent(SubjectIntent intent) {
    switch (intent) {
      case GetAllSubjectsIntent():
        _getAllSubjects(intent);
    }
  }

  _getAllSubjects(GetAllSubjectsIntent intent) async {
    try {
      debugPrint('SubjectCubit: Fetching subjects...');
      emit(state.copyWith(isLoading: true, error: null));
      final token = await sharedPrefsService.getToken();
      debugPrint('SubjectCubit: Token: ${token?.substring(0, 10)}...');
      if (token == null) {
        debugPrint('SubjectCubit: Token is null');
        emit(
          state.copyWith(
            isLoading: false,
            error: 'Authentication token not found',
          ),
        );
        return;
      }
      final response = await getAllSubjectsUseCase(token);
      if (isClosed) return;
      switch (response) {
        case SuccessResponse(data: final subjects):
          debugPrint(
            'SubjectCubit: Success, subjects count: ${subjects.length}',
          );
          emit(state.copyWith(subjects: subjects, isLoading: false));
        case ErrorResponse(error: final error):
          debugPrint('SubjectCubit: Error: $error');
          emit(state.copyWith(error: error.toString(), isLoading: false));
      }
    } catch (e) {
      debugPrint('SubjectCubit: Exception: $e');
      if (!isClosed) {
        emit(state.copyWith(isLoading: false, error: e.toString()));
      }
    }
  }
}
