sealed class QuestionIntent {}

class GetQuestionIntent extends QuestionIntent {
  final String examId;
  GetQuestionIntent({required this.examId});
}

class SubmitAnswerIntent extends QuestionIntent {
  final String questionId;
  final String answer;
  SubmitAnswerIntent({required this.questionId, required this.answer});
}

class SkipQuestionIntent extends QuestionIntent {}

class NextQuestionIntent extends QuestionIntent {}

class PreviousQuestionIntent extends QuestionIntent {}

class SubmitExamIntent extends QuestionIntent {}

class TimerTickIntent extends QuestionIntent {}

class LoadExamIntent extends QuestionIntent {
  final String examId;
  LoadExamIntent({required this.examId});
}
