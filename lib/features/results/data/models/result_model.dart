class ResultModel {
  final int totalQuestions;
  final int correctAnswers;
  final int wrongAnswers;
  final String examTitle;

  ResultModel({
    required this.totalQuestions,
    required this.correctAnswers,
    required this.wrongAnswers,
    required this.examTitle,
  });

  Map<String, dynamic> toJson() {
    return {
      'totalQuestions': totalQuestions,
      'correctAnswers': correctAnswers,
      'wrongAnswers': wrongAnswers,
      'examTitle': examTitle,
    };
  }

  factory ResultModel.fromJson(Map<String, dynamic> json) {
    return ResultModel(
      totalQuestions: json['totalQuestions'],
      correctAnswers: json['correctAnswers'],
      wrongAnswers: json['wrongAnswers'],
      examTitle: json['examTitle'],
    );
  }
}
