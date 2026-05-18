import 'package:injectable/injectable.dart';
import 'package:online_exam/features/results/domain/entities/result_entity.dart';
import 'package:online_exam/features/results/domain/repos/result_repo.dart';

@lazySingleton
class SaveResultUsecase {
  final ResultsRepo repo;

  SaveResultUsecase(this.repo);

  Future<void> saveResult(ResultEntity result, String userId) async {
    return await repo.saveResult(result, userId);
  }
}
