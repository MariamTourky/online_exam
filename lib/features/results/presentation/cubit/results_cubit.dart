import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/features/results/domain/entities/result_entity.dart';
import 'package:online_exam/features/results/domain/usecases/get_all_result_usecase.dart';
import 'package:online_exam/features/results/domain/usecases/save_result_usecase.dart';
import 'package:online_exam/features/results/presentation/cubit/result_intent.dart';

part 'results_state.dart';

@injectable
class ResultsCubit extends Cubit<ResultsState> {
  final SaveResultUsecase _saveResultUsecase;
  final GetAllResultUsecase _getAllResultUsecase;

  ResultsCubit(this._saveResultUsecase, this._getAllResultUsecase)
    : super(const ResultsInitial());

  void doIntent(ResultIntent intent) {
    switch (intent) {
      case LoadResultIntent():
        _loadResults();
      case SaveResultIntent():
        _saveResult();
    }
  }

  Future<void> _loadResults() async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    try {
      final results = await _getAllResultUsecase.call();
      final lastResult = results.isNotEmpty ? results.last : null;
      emit(state.copyWith(isLoading: false, lastResult: lastResult));
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  Future<void> _saveResult() async {
    if (state.lastResult == null) return;
    emit(state.copyWith(isLoading: true, errorMessage: null));
    try {
      await _saveResultUsecase.saveResult(state.lastResult!);
      emit(state.copyWith(isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }
}
