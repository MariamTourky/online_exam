import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam/features/home/data_sources/models/subject_dto.dart';

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
