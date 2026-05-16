import 'package:equatable/equatable.dart';

sealed class ResultIntent extends Equatable {
  const ResultIntent();

  @override
  List<Object?> get props => [];
}

class LoadResultIntent extends ResultIntent {}

class SaveResultIntent extends ResultIntent {}
