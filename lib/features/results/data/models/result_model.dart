import 'package:online_exam/features/results/domain/entities/result_entity.dart';

class ResultModel extends ResultEntity {
  ResultModel({
    required super.totalQuestions,
    required super.correctAnswers,
    required super.wrongAnswers,
    required super.examTitle,
    super.subjectName,
    super.duration,
    super.createdAt,
    super.answeredQuestions,
  });

  factory ResultModel.fromEntity(ResultEntity entity) {
    return ResultModel(
      totalQuestions: entity.totalQuestions,
      correctAnswers: entity.correctAnswers,
      wrongAnswers: entity.wrongAnswers,
      examTitle: entity.examTitle,
      subjectName: entity.subjectName,
      duration: entity.duration,
      createdAt: entity.createdAt,
      answeredQuestions: entity.answeredQuestions,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'totalQuestions': totalQuestions,
      'correctAnswers': correctAnswers,
      'wrongAnswers': wrongAnswers,
      'examTitle': examTitle,
      'subjectName': subjectName,
      'duration': duration,
      'createdAt': createdAt?.toIso8601String(),
      'answeredQuestions': answeredQuestions
          ?.map(
            (q) => {
              'questionText': q.questionText,
              'selectedAnswerKey': q.selectedAnswerKey,
              'correctAnswerKey': q.correctAnswerKey,
              'options': q.options
                  .map((o) => {'key': o.key, 'text': o.text})
                  .toList(),
            },
          )
          .toList(),
    };
  }

  factory ResultModel.fromJson(Map<String, dynamic> json) {
    return ResultModel(
      totalQuestions: json['totalQuestions'] ?? 0,
      correctAnswers: json['correctAnswers'] ?? 0,
      wrongAnswers: json['wrongAnswers'] ?? 0,
      examTitle: json['examTitle'] ?? '',
      subjectName: json['subjectName'],
      duration: json['duration'],
      createdAt: json['createdAt'] != null
          ? DateTime.tryParse(json['createdAt'])
          : null,
      answeredQuestions: (json['answeredQuestions'] as List<dynamic>?)
          ?.map(
            (q) => AnsweredQuestionEntity(
              questionText: q['questionText'] ?? '',
              selectedAnswerKey: q['selectedAnswerKey'],
              correctAnswerKey: q['correctAnswerKey'],
              options:
                  (q['options'] as List<dynamic>?)
                      ?.map(
                        (o) =>
                            AnswerOptionEntity(key: o['key'], text: o['text']),
                      )
                      .toList() ??
                  [],
            ),
          )
          .toList(),
    );
  }
}
