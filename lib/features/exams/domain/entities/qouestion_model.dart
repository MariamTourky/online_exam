
class QuestionModel {
  QuestionModel(
    this.id,
    this.question,
    this.answer,
    this.type,
    this.correct,
    this.Subject,
    this.exam,
    this.createdAt,
  );
  String? id;
  String? question;
  List? answer;
  String? type;
  String? correct;
  dynamic Subject;
  dynamic exam;
  DateTime? createdAt;
}
