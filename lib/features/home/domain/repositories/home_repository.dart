import 'package:online_exam/features/home/domain/entities/home_item.dart';

abstract class HomeRepository {
  Future<List<HomeItem>> getSubjects();
}