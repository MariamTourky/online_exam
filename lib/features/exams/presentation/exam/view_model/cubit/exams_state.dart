part of 'exams_cubit.dart';

class ExamsState extends Equatable {
  final List<ExamModel> exams;
  final String? id;
  final String? title;
  final int? duration;
  final String? subject;
  final int? numberOfQuestions;
  final bool? active;
  final DateTime? createdAt;
  final String? errorMessage;
  final bool isLoading;

  const ExamsState({
    this.exams = const [],
    this.id,
    this.title,
    this.duration,
    this.subject,
    this.numberOfQuestions,
    this.active,
    this.createdAt,
    this.errorMessage,
    this.isLoading = false,
  });

  ExamsState copyWith({
    List<ExamModel>? exams,
    String? id,
    String? title,
    int? duration,
    String? subject,
    int? numberOfQuestions,
    bool? active,
    DateTime? createdAt,
    String? errorMessage,
    bool? isLoading,
  }) {
    return ExamsState(
      exams: exams ?? this.exams,
      id: id ?? this.id,
      title: title ?? this.title,
      duration: duration ?? this.duration,
      subject: subject ?? this.subject,
      numberOfQuestions: numberOfQuestions ?? this.numberOfQuestions,
      active: active ?? this.active,
      createdAt: createdAt ?? this.createdAt,
      errorMessage: errorMessage ?? this.errorMessage,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [
    exams,
    id,
    title,
    duration,
    subject,
    numberOfQuestions,
    active,
    createdAt,
    errorMessage,
    isLoading,
  ];
}

class ExamsInitial extends ExamsState {
  const ExamsInitial({super.id});
}
