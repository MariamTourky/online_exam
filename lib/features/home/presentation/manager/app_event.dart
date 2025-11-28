import 'package:online_exam/features/home/presentation/manager/home_tab.dart';

sealed class AppEvent {}

class ChangeTabEvent extends AppEvent {
  final HomeTab tab;
  ChangeTabEvent(this.tab);
}

class GetSubjectEvent extends AppEvent {}

class SelectSubjectEvent extends AppEvent {
  final int subjectId;
  SelectSubjectEvent(this.subjectId);
}

class GetExamEvent extends AppEvent {}

class SelectExamEvent extends AppEvent {
  final int examId;
  SelectExamEvent(this.examId);
}

class StartExamEvent extends AppEvent {
  final int examId;
  StartExamEvent(this.examId);
}
