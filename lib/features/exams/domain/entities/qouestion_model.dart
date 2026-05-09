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
  );
  String? id;
  String? question;
  List? answer;
  String? type;
  String? correct;
  dynamic subject;
  dynamic exam;
  DateTime? createdAt;

  QuestionModel copyWith({
    String? id,
    String? question,
    List? answer,
    String? type,
    String? correct,
    dynamic subject,
    dynamic exam,
    DateTime? createdAt,
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
    );
  }
}
