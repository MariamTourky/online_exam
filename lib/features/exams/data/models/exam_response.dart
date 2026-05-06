import 'package:json_annotation/json_annotation.dart';

import 'package:online_exam/features/exams/domain/entities/exam_model.dart';

part 'exam_response.g.dart';

@JsonSerializable()
class ExamResponse {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "metadata")
  final Metadata? metadata;
  @JsonKey(name: "exams")
  final List<Exam>? exams;

  ExamResponse({this.message, this.metadata, this.exams});

  ExamResponse copyWith({
    String? message,
    Metadata? metadata,
    List<Exam>? exams,
  }) => ExamResponse(
    message: message ?? this.message,
    metadata: metadata ?? this.metadata,
    exams: exams ?? this.exams,
  );

  factory ExamResponse.fromJson(Map<String, dynamic> json) =>
      _$ExamResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ExamResponseToJson(this);
}

@JsonSerializable()
class Exam {
  @JsonKey(name: "_id")
  final String? id;
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "duration")
  final int? duration;
  @JsonKey(name: "subject")
  final String? subject;
  @JsonKey(name: "numberOfQuestions")
  final int? numberOfQuestions;
  @JsonKey(name: "active")
  final bool? active;
  @JsonKey(name: "createdAt")
  final DateTime? createdAt;

  Exam({
    this.id,
    this.title,
    this.duration,
    this.subject,
    this.numberOfQuestions,
    this.active,
    this.createdAt,
  });

  Exam copyWith({
    String? id,
    String? title,
    int? duration,
    String? subject,
    int? numberOfQuestions,
    bool? active,
    DateTime? createdAt,
  }) => Exam(
    id: id ?? this.id,
    title: title ?? this.title,
    duration: duration ?? this.duration,
    subject: subject ?? this.subject,
    numberOfQuestions: numberOfQuestions ?? this.numberOfQuestions,
    active: active ?? this.active,
    createdAt: createdAt ?? this.createdAt,
  );

  factory Exam.fromJson(Map<String, dynamic> json) => _$ExamFromJson(json);

  Map<String, dynamic> toJson() => _$ExamToJson(this);

  ExamModel toEntity() {
    return ExamModel(
      id: id,
      title: title,
      duration: duration,
      subject: subject,
      numberOfQuestions: numberOfQuestions,
      active: active,
      createdAt: createdAt,
    );
  }
}

@JsonSerializable()
class Metadata {
  @JsonKey(name: "currentPage")
  final int? currentPage;
  @JsonKey(name: "numberOfPages")
  final int? numberOfPages;
  @JsonKey(name: "limit")
  final int? limit;

  Metadata({this.currentPage, this.numberOfPages, this.limit});

  Metadata copyWith({int? currentPage, int? numberOfPages, int? limit}) =>
      Metadata(
        currentPage: currentPage ?? this.currentPage,
        numberOfPages: numberOfPages ?? this.numberOfPages,
        limit: limit ?? this.limit,
      );

  factory Metadata.fromJson(Map<String, dynamic> json) =>
      _$MetadataFromJson(json);

  Map<String, dynamic> toJson() => _$MetadataToJson(this);
}
