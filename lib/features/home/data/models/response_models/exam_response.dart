import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam/features/home/data/models/request_models/exam_dto.dart';
import 'package:online_exam/features/home/domain/models/exam_entity.dart';

part 'exam_response.g.dart';

@JsonSerializable()
class ExamResponse {
  @JsonKey(name: "message")
  final String? message;

  @JsonKey(name: "examMetadata")
  final ExamMetadata? examMetadata;

  @JsonKey(name: "exams") 
  final List<ExamDto>? exams;

  ExamResponse({
    this.message,
    this.examMetadata,
    this.exams,
  });

  factory ExamResponse.fromJson(Map<String, dynamic> json) =>
      _$ExamResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ExamResponseToJson(this);



}

@JsonSerializable()
class ExamMetadata {
  @JsonKey(name: "currentPage")
  final int? currentPage;

  @JsonKey(name: "numberOfPages")
  final int? numberOfPages;

  @JsonKey(name: "limit")
  final int? limit;

  ExamMetadata({
    this.currentPage,
    this.numberOfPages,
    this.limit,
  });

  factory ExamMetadata.fromJson(Map<String, dynamic> json) =>
      _$ExamMetadataFromJson(json);

  Map<String, dynamic> toJson() => _$ExamMetadataToJson(this);

}


@JsonSerializable()
class ExamDto {
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

  ExamDto({
    this.id,
    this.title,
    this.duration,
    this.subject,
    this.numberOfQuestions,
    this.active,
    this.createdAt,
  });

  factory ExamDto.fromJson(Map<String, dynamic> json) =>
      _$ExamDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ExamDtoToJson(this);

  /// -------------------------
  /// DTO → Domain
  /// Only return what ExamModel needs
  /// -------------------------
  ExamEntity toEntity() {
    return ExamEntity(
      title: title,
      duration: duration,
      subject: subject,
      numberOfQuestions: numberOfQuestions,
    );
  }

  ExamDto fromEntity(ExamEntity exam) {
    return ExamDto(
      title: exam.title,
      duration: exam.duration,
      subject: exam.subject,
      numberOfQuestions: exam.numberOfQuestions,
    );
  }
}
