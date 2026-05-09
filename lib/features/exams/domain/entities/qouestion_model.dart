
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
}
