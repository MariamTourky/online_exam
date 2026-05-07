part of 'subject_cubit.dart';

sealed class SubjectState extends Equatable {
  const SubjectState({
    required this.subjects,
    required this.isLoading,
    this.error,
  });
  final List<SubjectModel> subjects;
  final bool isLoading;
  final String? error;
  @override
  List<Object?> get props => [subjects, isLoading, error];
  SubjectState copyWith({
    List<SubjectModel>? subjects,
    bool? isLoading,
    String? error,
  });
}

final class SubjectInitial extends SubjectState {
  const SubjectInitial({
    required super.subjects,
    required super.isLoading,
    super.error,
  });

  @override
  SubjectState copyWith({
    List<SubjectModel>? subjects,
    bool? isLoading,
    String? error,
  }) {
    return SubjectInitial(
      subjects: subjects ?? this.subjects,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}
