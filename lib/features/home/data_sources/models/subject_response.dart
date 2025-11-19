import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam/features/home/domain/models/subject_model.dart';
part 'subject_response.g.dart';
@JsonSerializable()
class SubjectResponse {
    @JsonKey(name: "message")
    String? message;
    @JsonKey(name: "subjectmetadata")
    Subjectmetadata? subjectmetadata;
    @JsonKey(name: "subjectModel")
    List<SubjectModel>? subjectModel;

    SubjectResponse({
        this.message,
        this.subjectmetadata,
        this.subjectModel,
    });

    factory SubjectResponse.fromJson(Map<String, dynamic> json) => _$SubjectResponseFromJson(json);

    Map<String, dynamic> toJson() => _$SubjectResponseToJson(this);
}

@JsonSerializable()
class Subjectmetadata {
    @JsonKey(name: "currentPage")
    int? currentPage;
    @JsonKey(name: "numberOfPages")
    int? numberOfPages;
    @JsonKey(name: "limit")
    int? limit;

    Subjectmetadata({
        this.currentPage,
        this.numberOfPages,
        this.limit,
    });

    factory Subjectmetadata.fromJson(Map<String, dynamic> json) => _$SubjectmetadataFromJson(json);

    Map<String, dynamic> toJson() => _$SubjectmetadataToJson(this);
}
