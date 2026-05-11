import 'package:online_exam/features/exams/domain/entities/answer_model.dart';

class QuestionModel {
  QuestionModel(
    this.id,
    this.question,
    this.answer,
    this.type,
    this.correct,
    this.subject,
    this.exam,
    this.createdAt,
    this.selectedAnswer,
  );
  String? id;
  String? question;
  List<AnswerModel>? answer;
  String? type;
  String? correct;
  dynamic subject;
  dynamic exam;
  DateTime? createdAt;
  String? selectedAnswer;

  QuestionModel copyWith({
    String? id,
    String? question,
    List<AnswerModel>? answer,
    String? type,
    String? correct,
    dynamic subject,
    dynamic exam,
    DateTime? createdAt,
    String? selectedAnswer,
  }) {
    return QuestionModel(
      id ?? this.id,
      question ?? this.question,
      answer ?? this.answer,
      type ?? this.type,
      correct ?? this.correct,
      subject ?? this.subject,
      exam ?? this.exam,
      createdAt ?? this.createdAt,
      selectedAnswer ?? this.selectedAnswer,
    );
  }
}
