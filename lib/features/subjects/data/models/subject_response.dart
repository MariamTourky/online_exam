import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam/features/subjects/domain/models/subject_model.dart';

part 'subject_response.g.dart';

@JsonSerializable()
class SubjectResponse {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "metadata")
  final Metadata? metadata;
  @JsonKey(name: "subjects")
  final List<Subject>? subjects;

  SubjectResponse({this.message, this.metadata, this.subjects});

  SubjectResponse copyWith({
    String? message,
    Metadata? metadata,
    List<Subject>? subjects,
  }) => SubjectResponse(
    message: message ?? this.message,
    metadata: metadata ?? this.metadata,
    subjects: subjects ?? this.subjects,
  );

  factory SubjectResponse.fromJson(Map<String, dynamic> json) =>
      _$SubjectResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SubjectResponseToJson(this);
}

@JsonSerializable()
class Metadata {
  @JsonKey(name: "currentPage")
  final int? currentPage;
  @JsonKey(name: "numberOfPages")
  final int? numberOfPages;
  @JsonKey(name: "limit")
  final int? limit;

  Metadata({this.currentPage, this.numberOfPages, this.limit});

  Metadata copyWith({int? currentPage, int? numberOfPages, int? limit}) =>
      Metadata(
        currentPage: currentPage ?? this.currentPage,
        numberOfPages: numberOfPages ?? this.numberOfPages,
        limit: limit ?? this.limit,
      );

  factory Metadata.fromJson(Map<String, dynamic> json) =>
      _$MetadataFromJson(json);

  Map<String, dynamic> toJson() => _$MetadataToJson(this);
}

@JsonSerializable()
class Subject {
  @JsonKey(name: "_id")
  final String? id;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "icon")
  final String? icon;
  @JsonKey(name: "createdAt")
  final DateTime? createdAt;

  Subject({this.id, this.name, this.icon, this.createdAt});

  Subject copyWith({
    String? id,
    String? name,
    String? icon,
    DateTime? createdAt,
  }) => Subject(
    id: id ?? this.id,
    name: name ?? this.name,
    icon: icon ?? this.icon,
    createdAt: createdAt ?? this.createdAt,
  );

  factory Subject.fromJson(Map<String, dynamic> json) =>
      _$SubjectFromJson(json);

  Map<String, dynamic> toJson() => _$SubjectToJson(this);

  SubjectModel toDomain() => SubjectModel(
    id: id ?? "",
    name: name ?? "",
    icon: icon,
    createdAt: createdAt,
  );
}
