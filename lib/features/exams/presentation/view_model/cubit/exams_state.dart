part of 'exams_cubit.dart';

abstract class ExamsState extends BaseState {}

class ExamsInitial extends ExamsState {
  final List<ExamModel> exams;
  final String? id;
  final String? title;
  final int? duration;
  final String? subject;
  final int? numberOfQuestions;
  final bool? active;
  final DateTime? createdAt;

  ExamsInitial({
     this.exams = const [],
    this.id,
    this.title,
    this.duration,
    this.subject,
    this.numberOfQuestions,
    this.active,
    this.createdAt,
  });
  @override
  BaseState copyWith({bool? isLoading, String? errorMessage, data}) {
    return super.copyWith(
      isLoading: isLoading,
      errorMessage: errorMessage,
      data: data,
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
  ];
}
