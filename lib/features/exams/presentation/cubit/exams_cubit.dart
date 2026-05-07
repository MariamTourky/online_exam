import 'package:bloc/bloc.dart';
import 'package:online_exam/core/base_state/base_state.dart';
import 'package:online_exam/core/storage/shared_prefs_service.dart';
import 'package:online_exam/features/exams/domain/entities/exam_model.dart';
import 'package:online_exam/features/exams/domain/usecases/get_all_exam_usecase.dart';
import 'package:online_exam/features/exams/presentation/cubit/exam_intent.dart';

part 'exams_state.dart';

class ExamsCubit extends Cubit<ExamsState> {
  ExamsCubit(this.sharedPrefsService, this.getAllExamOnSSubjectUseCase)
    : super(ExamsInitial());
  final GetAllExamUseCase getAllExamOnSSubjectUseCase;
  final SharedPrefsService sharedPrefsService;

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

  void _getAllExamsOnSubject(final subjectID) {}

  void _selectExam(String examId) {}

  void _loadExamDataIntent() {}

  void _refreshExamsIntent() {}
}
