import 'package:online_exam/features/results/domain/entities/result_entity.dart';

class ResultModel extends ResultEntity {
  ResultModel({
    required super.totalQuestions,
    required super.correctAnswers,
    required super.wrongAnswers,
    required super.examTitle,
  });

  factory ResultModel.fromEntity(ResultEntity entity) {
    return ResultModel(
      totalQuestions: entity.totalQuestions,
      correctAnswers: entity.correctAnswers,
      wrongAnswers: entity.wrongAnswers,
      examTitle: entity.examTitle,
    );
  }

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
