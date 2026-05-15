import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/storage/shared_prefs_service.dart';
import 'package:online_exam/core/storage/storage_keys.dart';
import 'package:online_exam/features/results/domain/entities/result_entity.dart';
import 'package:online_exam/features/results/domain/usecases/get_all_result_usecase.dart';
import 'package:online_exam/features/results/domain/usecases/save_result_usecase.dart';
import 'package:online_exam/features/results/presentation/cubit/result_intent.dart';

part 'results_state.dart';

@injectable
class ResultsCubit extends Cubit<ResultsState> {
  final SaveResultUsecase _saveResultUsecase;
  final GetAllResultUsecase _getAllResultUsecase;
  final SharedPrefsService _sharedPrefsService;

  ResultsCubit(
    this._saveResultUsecase,
    this._getAllResultUsecase,
    this._sharedPrefsService,
  ) : super(const ResultsInitial());

  String get _userId =>
      _sharedPrefsService.getString(StorageKeys.userId) ?? '';

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
      final results = await _getAllResultUsecase.call(_userId);
      final lastResult = results.isNotEmpty ? results.last : null;
      emit(state.copyWith(
        isLoading: false,
        allResults: results,
        lastResult: lastResult,
      ));
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  Future<void> _saveResult() async {
    if (state.lastResult == null) return;
    emit(state.copyWith(isLoading: true, errorMessage: null));
    try {
      await _saveResultUsecase.saveResult(state.lastResult!, _userId);
      emit(state.copyWith(isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }
}
