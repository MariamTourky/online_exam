part of 'results_cubit.dart';

class ResultsState extends Equatable {
  final bool isLoading;
  final String? errorMessage;
  final ResultEntity? lastResult;

  const ResultsState({
    this.isLoading = false,
    this.errorMessage,
    this.lastResult,
  });

  ResultsState copyWith({
    bool? isLoading,
    String? errorMessage,
    ResultEntity? lastResult,
  }) {
    return ResultsState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      lastResult: lastResult ?? this.lastResult,
    );
  }

  @override
  List<Object?> get props => [isLoading, errorMessage, lastResult];
}

class ResultsInitial extends ResultsState {
  const ResultsInitial() : super();
}
