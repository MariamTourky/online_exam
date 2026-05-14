import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/storage/shared_prefs_service.dart';
import 'package:online_exam/features/results/domain/entities/result_entity.dart';

part 'results_state.dart';

@injectable
class ResultsCubit extends Cubit<ResultsState> {
  final SharedPrefsService _sharedPreferencesService;

  ResultsCubit(this._sharedPreferencesService) : super(const ResultsInitial());
}
