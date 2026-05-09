// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionResponse _$QuestionResponseFromJson(Map<String, dynamic> json) =>
    QuestionResponse(
      message: json['message'] as String?,
      questions: (json['questions'] as List<dynamic>?)
          ?.map((e) => Question.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$QuestionResponseToJson(QuestionResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'questions': instance.questions,
    };

Question _$QuestionFromJson(Map<String, dynamic> json) => Question(
  id: json['_id'] as String?,
  question: json['question'] as String?,
  answers: (json['answers'] as List<dynamic>?)
      ?.map((e) => Answer.fromJson(e as Map<String, dynamic>))
      .toList(),
  type: json['type'] as String?,
  correct: json['correct'] as String?,
  subject: json['subject'],
  exam: json['exam'],
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$QuestionToJson(Question instance) => <String, dynamic>{
  '_id': instance.id,
  'question': instance.question,
  'answers': instance.answers,
  'type': instance.type,
  'correct': instance.correct,
  'subject': instance.subject,
  'exam': instance.exam,
  'createdAt': instance.createdAt?.toIso8601String(),
};

Answer _$AnswerFromJson(Map<String, dynamic> json) =>
    Answer(answer: json['answer'] as String?, key: json['key'] as String?);

Map<String, dynamic> _$AnswerToJson(Answer instance) => <String, dynamic>{
  'answer': instance.answer,
  'key': instance.key,
};
