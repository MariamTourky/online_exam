import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
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
  final PageController pageController = PageController();
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
        // _submitAnswer(questionId: qId, answer: ans);
      case SelectAnswerStateIntent(questionId: final qId, answer: final ans):
        _selectAnswer(questionId: qId, selectedAnswer: ans);
      case AnswerCheckStateIntent(questionId: final qId, answer: final ans):
        _answerCheckState(questionId: qId, answer: ans);
      case SkipQuestionIntent():
        break;
      case NextQuestionIntent():
        _nextQuestion();
      case PreviousQuestionIntent():
        _previousQuestion();
      case SubmitExamIntent():
        _submitExam();
      case TimerTickIntent():
        _timerTick();
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

    emit(state.copyWith(questions: updatedQuestions,currentIndex: state.currentIndex + 1));
  } 

  void _answerCheckState({required String questionId, required String answer}) {
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
  
  void _nextQuestion() {
    if (state.currentIndex < state.questions.length - 1) {
      emit(state.copyWith(currentIndex: state.currentIndex + 1));
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }
  
  void _previousQuestion() {
    if (state.currentIndex > 0) {
      emit(state.copyWith(currentIndex: state.currentIndex - 1));
      pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }
  
  void _timerTick() {}
  
  void _submitExam() {}
  
  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }
}
