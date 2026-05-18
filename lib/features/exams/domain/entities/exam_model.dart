class ExamModel {
  final String? id;
  final String? title;
  final int? duration;
  final String? subject;
  final int? numberOfQuestions;
  final bool? active;
  final DateTime? createdAt;

  ExamModel({
    this.id,
    this.title,
    this.duration,
    this.subject,
    this.numberOfQuestions,
    this.active,
    this.createdAt,
  });

  ExamModel copyWith({
    String? id,
    String? title,
    int? duration,
    String? subject,
    int? numberOfQuestions,
    bool? active,
    DateTime? createdAt,
  }) {
    return ExamModel(
      id: id ?? this.id,
      title: title ?? this.title,
      duration: duration ?? this.duration,
      subject: subject ?? this.subject,
      numberOfQuestions: numberOfQuestions ?? this.numberOfQuestions,
      active: active ?? this.active,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'duration': duration,
      'subject': subject,
      'numberOfQuestions': numberOfQuestions,
      'active': active,
      'createdAt': createdAt?.toIso8601String(),
    };
  }

  factory ExamModel.fromJson(Map<String, dynamic> json) {
    return ExamModel(
      id: json['id'] as String?,
      title: json['title'] as String?,
      duration: json['duration'] as int?,
      subject: json['subject'] as String?,
      numberOfQuestions: json['numberOfQuestions'] as int?,
      active: json['active'] as bool?,
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'] as String)
          : null,
    );
  }
}
