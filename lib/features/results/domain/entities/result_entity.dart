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

  Map<String, dynamic> toJson() {
    return {
      'totalQuestions': totalQuestions,
      'correctAnswers': correctAnswers,
      'wrongAnswers': wrongAnswers,
      'examTitle': examTitle,
      'subjectName': subjectName,
      'duration': duration,
      'createdAt': createdAt?.toIso8601String(),
      'answeredQuestions': answeredQuestions?.map((e) => e.toJson()).toList(),
    };
  }

  factory ResultEntity.fromJson(Map<String, dynamic> json) {
    return ResultEntity(
      totalQuestions: json['totalQuestions'] as int,
      correctAnswers: json['correctAnswers'] as int,
      wrongAnswers: json['wrongAnswers'] as int,
      examTitle: json['examTitle'] as String,
      subjectName: json['subjectName'] as String?,
      duration: json['duration'] as int?,
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'] as String)
          : null,
      answeredQuestions: (json['answeredQuestions'] as List<dynamic>?)
          ?.map(
            (e) => AnsweredQuestionEntity.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    );
  }
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

  Map<String, dynamic> toJson() {
    return {
      'questionText': questionText,
      'options': options.map((e) => e.toJson()).toList(),
      'selectedAnswerKey': selectedAnswerKey,
      'correctAnswerKey': correctAnswerKey,
    };
  }

  factory AnsweredQuestionEntity.fromJson(Map<String, dynamic> json) {
    return AnsweredQuestionEntity(
      questionText: json['questionText'] as String,
      options: (json['options'] as List<dynamic>)
          .map((e) => AnswerOptionEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      selectedAnswerKey: json['selectedAnswerKey'] as String?,
      correctAnswerKey: json['correctAnswerKey'] as String?,
    );
  }
}

class AnswerOptionEntity {
  final String? key;
  final String? text;

  AnswerOptionEntity({this.key, this.text});

  Map<String, dynamic> toJson() {
    return {'key': key, 'text': text};
  }

  factory AnswerOptionEntity.fromJson(Map<String, dynamic> json) {
    return AnswerOptionEntity(
      key: json['key'] as String?,
      text: json['text'] as String?,
    );
  }
}
