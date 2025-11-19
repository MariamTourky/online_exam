
import 'package:json_annotation/json_annotation.dart';
part 'exam_model.g.dart';
@JsonSerializable()
class ExamModel {
    @JsonKey(name: "_id")
    String? id;
    @JsonKey(name: "title")
    String? title;
    @JsonKey(name: "duration")
    int? duration;
    @JsonKey(name: "subject")
    String? subject;
    @JsonKey(name: "numberOfQuestions")
    int? numberOfQuestions;
    @JsonKey(name: "active")
    bool? active;
    @JsonKey(name: "createdAt")
    DateTime? createdAt;

    ExamModel({
        this.id,
        this.title,
        this.duration,
        this.subject,
        this.numberOfQuestions,
        this.active,
        this.createdAt,
    });

    factory ExamModel.fromJson(Map<String, dynamic> json) => _$ExamModelFromJson(json);

    Map<String, dynamic> toJson() => _$ExamModelToJson(this);
}