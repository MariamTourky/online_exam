import 'package:online_exam/core/base_state/base_state.dart';
import 'package:online_exam/features/home/presentation/manager/home_tab.dart';

class HomeState<T> {
  BaseState<List<T>>? subjectState;
  List<T> subjects = [];
  List<T> exams = [];
  BaseState<List<T>>? examState;
    bool isLoading = false;
  String? errorMessage;
  HomeTab currentTab = HomeTab.explore;
  HomeState({
    this.subjectState,
    this.subjects = const [],
    this.examState,
    this.exams = const [],
    this.isLoading = false,
    this.errorMessage,
    this.currentTab = HomeTab.explore,
  });

  HomeState copyWith({
        List<T>? subjects,
    BaseState<List<T>>? subjectState,
    BaseState<List<T>>? examState,
    List<T>? exams,
        bool? isLoading,

    String? errorMessage,
    HomeTab? currentTab,
  }) {
    return HomeState(
      subjectState: subjectState ?? this.subjectState,
      isLoading: isLoading ?? this.isLoading,
      subjects: subjects ?? this.subjects,
      examState: examState ?? this.examState,
      exams: exams ?? this.exams,
      errorMessage: errorMessage ?? this.errorMessage,
      currentTab: currentTab ?? this.currentTab,
    );
  }
}
