import 'package:online_exam/features/exams/domain/entities/exam_model.dart';

sealed class QuestionIntent {}

class GetQuestionIntent extends QuestionIntent {
  final String examId;
  final ExamModel? exam;
  GetQuestionIntent({required this.examId, this.exam});
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
