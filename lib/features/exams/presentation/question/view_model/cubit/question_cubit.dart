import 'dart:async';
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
import 'package:online_exam/features/results/data/models/result_model.dart';

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
      case LoadExamIntent(examId: final id, exam: final exam):
        emit(state.copyWith(exam: exam));
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
          _startTimer();
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

  void _timerTick() {
    if (state.remainingTime != null && state.remainingTime! > 0) {
      emit(state.copyWith(remainingTime: state.remainingTime! - 1));
    } else {
      state.timer?.cancel();
      _submitExam();
    }
  }

  void _startTimer() {
    state.timer?.cancel();

    int remainingSeconds = (state.exam?.duration ?? 0) * 60;
    emit(state.copyWith(remainingTime: remainingSeconds));

    final timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _timerTick();
    });

    emit(state.copyWith(timer: timer));
  }

  void _submitExam() async {
    int correctAnswers = 0;
    int totalQuestions = state.questions.length;

    for (var question in state.questions) {
      if (question.selectedAnswer == question.correct) {
        correctAnswers++;
      }
    }

    int wrongAnswers = totalQuestions - correctAnswers;

    final result = ResultModel(
      totalQuestions: totalQuestions,
      correctAnswers: correctAnswers,
      wrongAnswers: wrongAnswers,
      examTitle: state.exam?.title ?? "Exam",
    );

    // Save result to shared preferences

    state.timer?.cancel();
    emit(state.copyWith(isSubmitted: true, result: result));
  }

  @override
  Future<void> close() {
    state.timer?.cancel();
    pageController.dispose();
    return super.close();
  }
}
