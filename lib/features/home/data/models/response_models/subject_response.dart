import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam/features/home/domain/models/subject_entity.dart';

part 'subject_response.g.dart';
@JsonSerializable()
class SubjectResponse {
    @JsonKey(name: "message")
     String? message;
    @JsonKey(name: "SubjectMetadata")
     SubjectMetadata? subjectMetadata;
    @JsonKey(name: "subjectDto")
     List<SubjectDto>? subjectDto;

    SubjectResponse({
        this.message,
        this.subjectMetadata,
        this.subjectDto,
    });

    factory SubjectResponse.fromJson(Map<String, dynamic> json) => _$SubjectResponseFromJson(json);

    Map<String, dynamic> toJson() => _$SubjectResponseToJson(this);

    SubjectEntity toEntity() {
      if (subjectDto != null && subjectDto!.isNotEmpty) {
        return subjectDto!.first.toEntity();
      }
      throw Exception('No subject data available');
    }
}

@JsonSerializable()
class SubjectMetadata {
    @JsonKey(name: "currentPage")
     int? currentPage;
    @JsonKey(name: "numberOfPages")
     int? numberOfPages;
    @JsonKey(name: "limit")
     int? limit;

    SubjectMetadata({
        this.currentPage,
        this.numberOfPages,
        this.limit,
    });

    factory SubjectMetadata.fromJson(Map<String, dynamic> json) => _$SubjectMetadataFromJson(json);

    Map<String, dynamic> toJson() => _$SubjectMetadataToJson(this);
}


@JsonSerializable()
class SubjectDto {
  @JsonKey(name: "_id")
  final String? id;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "icon")
  final String? icon;
  @JsonKey(name: "createdAt")
  final DateTime? createdAt;

  SubjectDto({this.id, this.name, this.icon, this.createdAt});

  factory SubjectDto.fromJson(Map<String, dynamic> json) =>
      _$SubjectDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SubjectDtoToJson(this);

  SubjectEntity toEntity() {
    return SubjectEntity(id: id, name: name, icon: icon, createdAt: createdAt);
  }
  
}
