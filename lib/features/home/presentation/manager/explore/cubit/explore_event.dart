import 'package:online_exam/features/home/presentation/manager/home_tab.dart';

sealed class ExploreEvent {}

class ChangeTabEvent extends ExploreEvent {
  final HomeTab tab;
  ChangeTabEvent(this.tab);
}

class GetSubjectEvent extends ExploreEvent {}

class SelectSubjectEvent extends ExploreEvent {
  final int subjectId;
  SelectSubjectEvent(this.subjectId);
}

class GetExamEvent extends ExploreEvent {}

class SelectExamEvent extends ExploreEvent {
  final int examId;
  SelectExamEvent(this.examId);
}

class StartExamEvent extends ExploreEvent {
  final int examId;
  StartExamEvent(this.examId);
}
