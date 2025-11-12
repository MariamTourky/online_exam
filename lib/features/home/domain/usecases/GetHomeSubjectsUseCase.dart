import 'package:online_exam/features/home/domain/entities/home_item.dart';
import 'package:online_exam/features/home/domain/repositories/home_repository.dart';

class GetHomeSubjectsUseCase {
  final HomeRepository repository;
  GetHomeSubjectsUseCase(this.repository);
  Future<List<HomeItem>> call() async {
    return repository.getSubjects();
  }
}
