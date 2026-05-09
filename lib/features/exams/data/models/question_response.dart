import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam/features/exams/domain/entities/qouestion_model.dart';

part 'question_response.g.dart';

@JsonSerializable()
class QuestionResponse {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "questions")
  final List<Question>? questions;

  QuestionResponse({this.message, this.questions});

  QuestionResponse copyWith({String? message, List<Question>? questions}) =>
      QuestionResponse(
        message: message ?? this.message,
        questions: questions ?? this.questions,
      );

  factory QuestionResponse.fromJson(Map<String, dynamic> json) =>
      _$QuestionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionResponseToJson(this);
}

@JsonSerializable()
class Question {
  @JsonKey(name: "_id")
  final String? id;
  @JsonKey(name: "question")
  final String? question;
  @JsonKey(name: "answers")
  final List<Answer>? answers;
  @JsonKey(name: "type")
  final String? type;
  @JsonKey(name: "correct")
  final String? correct;
  @JsonKey(name: "subject")
  final dynamic subject;
  @JsonKey(name: "exam")
  final dynamic exam;
  @JsonKey(name: "createdAt")
  final DateTime? createdAt;

  Question({
    this.id,
    this.question,
    this.answers,
    this.type,
    this.correct,
    this.subject,
    this.exam,
    this.createdAt,
  });

  Question copyWith({
    String? id,
    String? question,
    List<Answer>? answers,
    String? type,
    String? correct,
    dynamic subject,
    dynamic exam,
    DateTime? createdAt,
  }) => Question(
    id: id ?? this.id,
    question: question ?? this.question,
    answers: answers ?? this.answers,
    type: type ?? this.type,
    correct: correct ?? this.correct,
    subject: subject ?? this.subject,
    exam: exam ?? this.exam,
    createdAt: createdAt ?? this.createdAt,
  );

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionToJson(this);

  QuestionModel toEntity() {
    return QuestionModel(
      id,
      question,
      answers,
      type,
      correct,
      subject,
      exam,
      createdAt,
    );
  }
}

@JsonSerializable()
class Answer {
  @JsonKey(name: "answer")
  final String? answer;
  @JsonKey(name: "key")
  final String? key;

  Answer({this.answer, this.key});

  Answer copyWith({String? answer, String? key}) =>
      Answer(answer: answer ?? this.answer, key: key ?? this.key);

  factory Answer.fromJson(Map<String, dynamic> json) => _$AnswerFromJson(json);

  Map<String, dynamic> toJson() => _$AnswerToJson(this);
}
