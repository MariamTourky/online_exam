import 'package:online_exam/features/home/domain/entities/explore_entity.dart';
import 'package:online_exam/features/home/domain/repositories/home_repository.dart';

class GetExploreExamsUseCase {
  final HomeRepository repository;
  GetExploreExamsUseCase(this.repository);
  Future<List<ExploreEntity>> call() async {
    return repository.getExploreExams();
  }
}
