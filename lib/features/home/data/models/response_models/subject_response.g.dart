// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subject_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubjectResponse _$SubjectResponseFromJson(Map<String, dynamic> json) =>
    SubjectResponse(
      message: json['message'] as String?,
      subjectMetadata: json['SubjectMetadata'] == null
          ? null
          : SubjectMetadata.fromJson(
              json['SubjectMetadata'] as Map<String, dynamic>,
            ),
      subjectDto: (json['subjectDto'] as List<dynamic>?)
          ?.map((e) => SubjectDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SubjectResponseToJson(SubjectResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'SubjectMetadata': instance.subjectMetadata,
      'subjectDto': instance.subjectDto,
    };

SubjectMetadata _$SubjectMetadataFromJson(Map<String, dynamic> json) =>
    SubjectMetadata(
      currentPage: (json['currentPage'] as num?)?.toInt(),
      numberOfPages: (json['numberOfPages'] as num?)?.toInt(),
      limit: (json['limit'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SubjectMetadataToJson(SubjectMetadata instance) =>
    <String, dynamic>{
      'currentPage': instance.currentPage,
      'numberOfPages': instance.numberOfPages,
      'limit': instance.limit,
    };

SubjectDto _$SubjectDtoFromJson(Map<String, dynamic> json) => SubjectDto(
  id: json['_id'] as String?,
  name: json['name'] as String?,
  icon: json['icon'] as String?,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$SubjectDtoToJson(SubjectDto instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'icon': instance.icon,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
