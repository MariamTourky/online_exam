part of 'question_cubit.dart';

class QuestionState extends Equatable {
  final List<QuestionModel> questions;
  final int currentIndex;
  final bool isLoading;
  final String? errorMessage;
  final ExamModel? exam;
  final Timer? timer;
  final int? remainingTime;

  const QuestionState({
    this.questions = const [],
    this.currentIndex = 0,
    this.isLoading = false,
    this.errorMessage,
    this.exam,
    this.timer,
    this.remainingTime,
  });

  QuestionState copyWith({
    List<QuestionModel>? questions,
    int? currentIndex,
    bool? isLoading,
    String? errorMessage,
    ExamModel? exam,
    Timer? timer,
    int? remainingTime,
  }) {
    return QuestionState(
      questions: questions ?? this.questions,
      currentIndex: currentIndex ?? this.currentIndex,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      exam: exam ?? this.exam,
      timer: timer ?? this.timer,
      remainingTime: remainingTime ?? this.remainingTime,
    );
  }

  @override
  List<Object?> get props => [
    questions,
    currentIndex,
    isLoading,
    errorMessage,
    exam,
    timer,
    remainingTime,
  ];
}

class QuestionInitial extends QuestionState {
  const QuestionInitial() : super();
}
