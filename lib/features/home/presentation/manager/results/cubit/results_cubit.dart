import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'results_state.dart';

class ResultsCubit extends Cubit<ResultsState> {
  ResultsCubit() : super(ResultsInitial());
}
