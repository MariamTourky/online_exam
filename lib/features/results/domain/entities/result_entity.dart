class ResultEntity {
  final int totalQuestions;
  final int correctAnswers;
  final int wrongAnswers;
  final String examTitle;
  final String? subjectName;
  final int? duration; // in minutes
  final DateTime? createdAt;
  final List<AnsweredQuestionEntity>? answeredQuestions;

  ResultEntity({
    required this.totalQuestions,
    required this.correctAnswers,
    required this.wrongAnswers,
    required this.examTitle,
    this.subjectName,
    this.duration,
    this.createdAt,
    this.answeredQuestions,
  });
}

class AnsweredQuestionEntity {
  final String questionText;
  final List<AnswerOptionEntity> options;
  final String? selectedAnswerKey;
  final String? correctAnswerKey;

  AnsweredQuestionEntity({
    required this.questionText,
    required this.options,
    this.selectedAnswerKey,
    this.correctAnswerKey,
  });
}

class AnswerOptionEntity {
  final String? key;
  final String? text;

  AnswerOptionEntity({this.key, this.text});
}
