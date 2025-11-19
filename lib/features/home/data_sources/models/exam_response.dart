import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam/features/home/domain/models/exam_model.dart';
part 'exam_response.g.dart';
@JsonSerializable()
class ExamResponse {
    @JsonKey(name: "message")
    String? message;
    @JsonKey(name: "ExamMetadata ")
    ExamMetadata? examMetadata;
    @JsonKey(name: "examModel")
    List<ExamModel>? examModel;

    ExamResponse({
        this.message,
        this.examMetadata,
        this.examModel,
    });

    factory ExamResponse.fromJson(Map<String, dynamic> json) => _$ExamResponseFromJson(json);

    Map<String, dynamic> toJson() => _$ExamResponseToJson(this);
}

@JsonSerializable()
class ExamMetadata {
    @JsonKey(name: "currentPage")
    int? currentPage;
    @JsonKey(name: "numberOfPages")
    int? numberOfPages;
    @JsonKey(name: "limit")
    int? limit;

    ExamMetadata({
        this.currentPage,
        this.numberOfPages,
        this.limit,
    });

    factory ExamMetadata.fromJson(Map<String, dynamic> json) => _$ExamMetadataFromJson(json);

    Map<String, dynamic> toJson() => _$ExamMetadataToJson(this);
}


