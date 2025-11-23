// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exam_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExamResponse _$ExamResponseFromJson(Map<String, dynamic> json) => ExamResponse(
  message: json['message'] as String?,
  examMetadata: json['examMetadata'] == null
      ? null
      : ExamMetadata.fromJson(json['examMetadata'] as Map<String, dynamic>),
  exams: (json['exams'] as List<dynamic>?)
      ?.map((e) => ExamDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ExamResponseToJson(ExamResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'examMetadata': instance.examMetadata,
      'exams': instance.exams,
    };

ExamMetadata _$ExamMetadataFromJson(Map<String, dynamic> json) => ExamMetadata(
  currentPage: (json['currentPage'] as num?)?.toInt(),
  numberOfPages: (json['numberOfPages'] as num?)?.toInt(),
  limit: (json['limit'] as num?)?.toInt(),
);

Map<String, dynamic> _$ExamMetadataToJson(ExamMetadata instance) =>
    <String, dynamic>{
      'currentPage': instance.currentPage,
      'numberOfPages': instance.numberOfPages,
      'limit': instance.limit,
    };
