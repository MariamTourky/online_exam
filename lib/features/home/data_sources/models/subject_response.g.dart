// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subject_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubjectResponse _$SubjectResponseFromJson(Map<String, dynamic> json) =>
    SubjectResponse(
      message: json['message'] as String?,
      subjectmetadata: json['subjectmetadata'] == null
          ? null
          : Subjectmetadata.fromJson(
              json['subjectmetadata'] as Map<String, dynamic>,
            ),
      subjectModel: (json['subjectModel'] as List<dynamic>?)
          ?.map((e) => SubjectModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SubjectResponseToJson(SubjectResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'subjectmetadata': instance.subjectmetadata,
      'subjectModel': instance.subjectModel,
    };

Subjectmetadata _$SubjectmetadataFromJson(Map<String, dynamic> json) =>
    Subjectmetadata(
      currentPage: (json['currentPage'] as num?)?.toInt(),
      numberOfPages: (json['numberOfPages'] as num?)?.toInt(),
      limit: (json['limit'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SubjectmetadataToJson(Subjectmetadata instance) =>
    <String, dynamic>{
      'currentPage': instance.currentPage,
      'numberOfPages': instance.numberOfPages,
      'limit': instance.limit,
    };
