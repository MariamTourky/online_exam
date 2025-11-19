// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exam_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExamResponse _$ExamResponseFromJson(Map<String, dynamic> json) => ExamResponse(
  message: json['message'] as String?,
  examMetadata: json['ExamMetadata '] == null
      ? null
      : ExamMetadata.fromJson(json['ExamMetadata '] as Map<String, dynamic>),
  examModel: (json['examModel'] as List<dynamic>?)
      ?.map((e) => ExamModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ExamResponseToJson(ExamResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'ExamMetadata ': instance.examMetadata,
      'examModel': instance.examModel,
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
