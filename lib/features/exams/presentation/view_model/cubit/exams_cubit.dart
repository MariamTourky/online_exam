import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/base_response/base_response.dart';
import 'package:online_exam/core/base_state/base_state.dart';
import 'package:online_exam/core/storage/shared_prefs_service.dart';
import 'package:online_exam/features/exams/domain/entities/exam_model.dart';
import 'package:online_exam/features/exams/domain/usecases/get_all_exam_usecase.dart';
import 'package:online_exam/features/exams/presentation/view_model/cubit/exam_intent.dart';

part 'exams_state.dart';

@injectable
class ExamsCubit extends Cubit<ExamsState> {
  final GetAllExamUseCase getAllExamOnSSubjectUseCase;
  final SharedPrefsService sharedPrefsService;

  ExamsCubit(
    this.sharedPrefsService, {
    required this.getAllExamOnSSubjectUseCase,
  }) : super(ExamsInitial(id: ''));
  Future<void> doIntent(ExamIntent intent) async {
    switch (intent) {
      case GetAllExamsOnSubjectIntent(subjectId: final subjectId):
        _getAllExamsOnSubject(subjectId);
      case LoadExamsDataIntent():
        _loadExamDataIntent();
      case SelectExamIntent(examId: final examId):
        _selectExam(examId);
      case RefreshExamsIntent():
        _refreshExamsIntent();
    }
  }

  void _getAllExamsOnSubject(final subjectID) async {
    final token = await sharedPrefsService.getToken();
    final response = await getAllExamOnSSubjectUseCase;
    emit(state.copyWith(isLoading: true));

    switch (response) {
      case SuccessResponse(data: final exams):
        emit(state.copyWith(exams: exams, isLoading: false));
      case ErrorResponse(error: final error):
        emit(state.copyWith(errorMessage: error.toString(), isLoading: false));
    }
  }

  void _selectExam(String examId) {}

  void _loadExamDataIntent() {}

  void _refreshExamsIntent() {}
}
