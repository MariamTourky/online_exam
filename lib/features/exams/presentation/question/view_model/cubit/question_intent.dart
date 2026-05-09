sealed class QuestionIntent {}

class GetQuestionIntent extends QuestionIntent {}

class SubmitAnswerIntent extends QuestionIntent {}

class SkipQuestionIntent extends QuestionIntent {}

class NextQuestionIntent extends QuestionIntent {}

class PreviousQuestionIntent extends QuestionIntent {}

class SubmitExamIntent extends QuestionIntent {}

class TimerTickIntent extends QuestionIntent {}

class LoadExamIntent extends QuestionIntent {
  final String examId;
  LoadExamIntent({required this.examId});
}
