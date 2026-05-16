part of 'results_cubit.dart';

class ResultsState extends Equatable {
  final bool isLoading;
  final String? errorMessage;
  final List<ResultEntity> allResults;
  final ResultEntity? lastResult;

  const ResultsState({
    this.isLoading = false,
    this.errorMessage,
    this.allResults = const [],
    this.lastResult,
  });

  ResultsState copyWith({
    bool? isLoading,
    String? errorMessage,
    List<ResultEntity>? allResults,
    ResultEntity? lastResult,
  }) {
    return ResultsState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      allResults: allResults ?? this.allResults,
      lastResult: lastResult ?? this.lastResult,
    );
  }

  @override
  List<Object?> get props => [isLoading, errorMessage, allResults, lastResult];
}

class ResultsInitial extends ResultsState {
  const ResultsInitial() : super();
}
