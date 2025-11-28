import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/base_response/base_response.dart';
import 'package:online_exam/core/base_state/base_state.dart';
import 'package:online_exam/features/home/domain/models/exam_entity.dart';
import 'package:online_exam/features/home/domain/models/subject_entity.dart';
import 'package:online_exam/features/home/domain/usecases/get_exam_use_case.dart';
import 'package:online_exam/features/home/domain/usecases/get_subject_use_case.dart';
import 'package:online_exam/features/home/domain/usecases/get_user_data_use_case.dart';
import 'package:online_exam/features/home/presentation/manager/app_event.dart';
import 'package:online_exam/features/home/presentation/manager/home_state.dart';
import 'package:online_exam/features/home/presentation/manager/home_tab.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  HomeCubit(
    this._getSubjectsUseCase,
    this._getExamsUseCase,
    this._getUserDataUseCase,
  ) : super(HomeState());

  final GetSubjectUseCase _getSubjectsUseCase;
  final GetExamUseCase _getExamsUseCase;
  final GetUserDataUseCase _getUserDataUseCase;

  void doIntent(AppEvent event) {
    switch (event) {
      case GetSubjectEvent():
        _getSubjectEvent();
      case SelectSubjectEvent():
        _selectSubjectEvent(event.subjectId);
      case GetExamEvent():
        _getExamEvent();
      case SelectExamEvent():
        _selectExamEvent(event.examId);
      case StartExamEvent():
        _startExamEvent(event.examId);
      case ChangeTabEvent():
        changeTabEvent(event.tab);
    }
  }

  Future<void> _selectSubjectEvent(int subjectId) async {
    final SubjectEntity? subject = state.subjects?.firstWhere(
      (s) => s.id == subjectId.toString(),
      orElse: () => null,
    );

    emit(state.copyWith(subjectState: BaseState(data: state.subjects)));
  }

  _startExamEvent(int examId) async {}

  void changeTabEvent(HomeTab tab) {
    emit(state.copyWith(currentTab: tab));
  }

  Future<void> _getSubjectEvent() async {
    emit(
      state.copyWith(
        subjectState: BaseState<List<SubjectEntity>>(isLoading: true),
      ),
    );
    final BaseResponse<List<SubjectEntity>> response =
        await _getSubjectsUseCase();

    switch (response) {
      case SuccessResponse<List<SubjectEntity>>():
        emit(
          state.copyWith(
            subjectState: BaseState(data: response.data, isLoading: false),
            subjects: response.data,
          ),
        );
      case ErrorResponse<List<SubjectEntity>>():
        emit(
          state.copyWith(
            subjectState: BaseState(
              errorMessage: response.error.toString(),
              isLoading: false,
            ),
          ),
        );
    }
  }

Future<void> _selectExamEvent(int examId) async {
  ExamEntity? exam;

  try {
    exam = state.exams
        .cast<ExamEntity>()
        .firstWhere((e) => e.subject.toString() == examId.toString());
  } catch (_) {
    exam = null; // exam not found
  }

  emit(
    state.copyWith(
      exams: state.exams,
      examState: BaseState(data: exam == null ? [] : [exam]),
    ),
  );
}


  Future<void> _getExamEvent() async {
    emit(
      state.copyWith(
        subjectState: BaseState<List<ExamEntity>>(isLoading: true),
      ),
    );
    final BaseResponse<List<ExamEntity>> response = await _getExamsUseCase();

    switch (response) {
      case SuccessResponse<List<ExamEntity>>():
        emit(
          state.copyWith(
            subjectState: BaseState(data: response.data, isLoading: false),
            subjects: response.data,
          ),
        );
      case ErrorResponse<List<ExamEntity>>():
        emit(
          state.copyWith(
            subjectState: BaseState(
              errorMessage: response.error.toString(),
              isLoading: false,
            ),
          ),
        );
    }
  }
}
