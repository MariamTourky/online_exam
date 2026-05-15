import 'package:injectable/injectable.dart';
import 'package:online_exam/features/results/domain/entities/result_entity.dart';
import 'package:online_exam/features/results/domain/repos/result_repo.dart';

@lazySingleton
class GetAllResultUsecase {
  final ResultsRepo _repo;
  GetAllResultUsecase(this._repo);
  
  Future<List<ResultEntity>> call() async {
    return await _repo.getAllResults();
  }
}