import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam/features/home/data_sources/models/exam_dto.dart';

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
