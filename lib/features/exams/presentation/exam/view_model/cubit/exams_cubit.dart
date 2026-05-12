import 'package:flutter/foundation.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/base_response/base_response.dart';
import 'package:online_exam/core/storage/shared_prefs_service.dart';
import 'package:online_exam/features/exams/domain/entities/exam_model.dart';
import 'package:online_exam/features/exams/domain/usecases/get_all_exam_usecase.dart';
import 'package:online_exam/features/exams/presentation/exam/view_model/cubit/exam_intent.dart';

part 'exams_state.dart';

@injectable
class ExamsCubit extends Cubit<ExamsState> {
  final GetAllExamUseCaseUseCase getAllExamOnSubjectUseCase;
  final SharedPrefsService sharedPrefsService;

  ExamsCubit(this.sharedPrefsService, this.getAllExamOnSubjectUseCase)
    : super(ExamsInitial(id: ''));
  Future<void> doIntent(ExamIntent intent) async {
    switch (intent) {
      case GetAllExamsOnSubjectIntent(subjectId: final subjectID):
        _getAllExamsOnSubject(subjectID);
      case LoadExamsDataIntent():
        _loadExamDataIntent();
      case SelectExamIntent(examId: final examId):
        _selectExam(examId);
      case RefreshExamsIntent():
        _refreshExamsIntent();
    }
  }

  Future<void> _getAllExamsOnSubject(final subjectID) async {
    try {
      debugPrint('ExamsCubit: Fetching exams for subject: $subjectID');
      emit(state.copyWith(isLoading: true, errorMessage: null));
      final token = await sharedPrefsService.getToken();
      if (token == null) {
        debugPrint('ExamsCubit: Token is null');
        emit(
          state.copyWith(
            isLoading: false,
            errorMessage: 'Authentication token not found',
          ),
        );
        return;
      }
      final response = await getAllExamOnSubjectUseCase.call(
        token: token,
        subjectId: subjectID,
      );
      if (isClosed) return;
      switch (response) {
        case SuccessResponse(data: final exams):
          debugPrint('ExamsCubit: Success, exams count: ${exams.length}');
          emit(state.copyWith(exams: exams, isLoading: false));
        case ErrorResponse(error: final error):
          debugPrint('ExamsCubit: Error: $error');
          emit(
            state.copyWith(errorMessage: error.toString(), isLoading: false),
          );
      }
    } catch (e) {
      debugPrint('ExamsCubit: Exception: $e');
      if (!isClosed) {
        emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
      }
    }
  }

  void _selectExam(String examId) {
    debugPrint('ExamsCubit: Selected exam: $examId');
  }

  void _loadExamDataIntent() {
    debugPrint('ExamsCubit: Loading exam data intent');
  }

  void _refreshExamsIntent() {
    debugPrint('ExamsCubit: Refreshing exams intent');
  }
}
