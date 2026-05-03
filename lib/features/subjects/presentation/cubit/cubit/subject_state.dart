part of 'subject_cubit.dart';

sealed class SubjectState extends Equatable {
  const SubjectState();

  @override
  List<Object> get props => [];
}

final class SubjectInitial extends SubjectState {}

final class SubjectLoading extends SubjectState {}

final class SubjectLoaded extends SubjectState {
  final List<SubjectModel> subjects;
  SubjectLoaded(this.subjects);
}

final class SubjectError extends SubjectState {
  final String error;
  SubjectError(this.error);
}

