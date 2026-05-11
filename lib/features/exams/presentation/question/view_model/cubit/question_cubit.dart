import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/base_response/base_response.dart';
import 'package:online_exam/core/storage/shared_prefs_service.dart';
import 'package:online_exam/features/exams/domain/entities/answer_model.dart';
import 'package:online_exam/features/exams/domain/entities/exam_model.dart';
import 'package:online_exam/features/exams/domain/entities/qouestion_model.dart';
import 'package:online_exam/features/exams/domain/usecases/get_all_question_usecase.dart';
import 'package:online_exam/features/exams/presentation/question/view_model/cubit/question_intent.dart';

part 'question_state.dart';

@injectable
class QuestionCubit extends Cubit<QuestionState> {
  final GetAllQuestionUsecase _getAllQuestionUsecase;
  final SharedPrefsService _sharedPreferencesService;
  QuestionCubit(this._getAllQuestionUsecase, this._sharedPreferencesService)
    : super(const QuestionInitial());

  void doIntent(QuestionIntent intent) {
    switch (intent) {
      case GetQuestionIntent(examId: final id, exam: final exam):
        if (exam != null) {
          emit(state.copyWith(exam: exam));
        }
        _getAllQuestion(examId: id);
      case LoadExamIntent(examId: final id):
        _getAllQuestion(examId: id);
      case SubmitAnswerIntent(questionId: final qId, answer: final ans):
        _submitAnswer(questionId: qId, answer: ans);
      case SelectAnswerStateIntent(questionId: final qId, answer: final ans):
        _selectAnswer(questionId: qId, selectedAnswer: ans);
      case AnswerCheckStateIntent(questionId: final qId, answer: final ans):
        _answerCheckState(questionId: qId, answer: ans);
      case SkipQuestionIntent():
        break;
      case NextQuestionIntent():
        break;
      case PreviousQuestionIntent():
        break;
      case SubmitExamIntent():
        break;
      case TimerTickIntent():
        break;
    }
  }

  Future<void> _getAllQuestion({required String examId}) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    final token = await _sharedPreferencesService.getToken();
    try {
      final response = await _getAllQuestionUsecase.call(
        token: token!,
        examId: examId,
      );
      switch (response) {
        case SuccessResponse(data: final questions):
          emit(state.copyWith(questions: questions, isLoading: false));
        case ErrorResponse(error: final error):
          emit(
            state.copyWith(errorMessage: error.toString(), isLoading: false),
          );
      }
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString(), isLoading: false));
    }
  }

  void _selectAnswer({
    required String questionId,
    required String selectedAnswer,
  }) {
    final updatedQuestions = state.questions.map((question) {
      if (question.id == questionId) {
        return question.copyWith(selectedAnswer: selectedAnswer);
      }
      return question;
    }).toList();

    emit(state.copyWith(questions: updatedQuestions));
  }

  void _submitAnswer({required String questionId, required String answer}) {}

  void _answerCheckState({
    required String questionId,
    required String answer,
  }) {
    final updatedQuestions = state.questions.map((question) {
      if (question.id == questionId) {
        return question.copyWith(
          answer: [AnswerModel(answer: answer, key: question.correct)],
        );
      }
      return question;
    }).toList();

    emit(state.copyWith(questions: updatedQuestions));
  }
}
