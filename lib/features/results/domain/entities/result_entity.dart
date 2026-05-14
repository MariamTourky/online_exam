class ResultEntity {
  final int totalQuestions;
  final int correctAnswers;
  final int wrongAnswers;
  final String examTitle;

  ResultEntity({
    required this.totalQuestions,
    required this.correctAnswers,
    required this.wrongAnswers,
    required this.examTitle,
  });
}
