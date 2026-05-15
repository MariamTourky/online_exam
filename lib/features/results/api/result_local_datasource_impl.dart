import 'dart:convert';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/features/results/data/datasources/result_local_datasource.dart';
import 'package:online_exam/features/results/data/models/result_model.dart';

@LazySingleton(as: ResultLocalDatasource)
class ResultLocalDatasourceImpl implements ResultLocalDatasource {
  static const String _boxName = 'results_box';

  /// Returns a user-scoped key for storing results.
  String _resultsKeyForUser(String userId) => 'exam_results_$userId';

  Future<Box> _openBox() async {
    if (Hive.isBoxOpen(_boxName)) {
      return Hive.box(_boxName);
    }
    return await Hive.openBox(_boxName);
  }

  @override
  Future<void> saveExamResult(ResultModel result, String userId) async {
    final box = await _openBox();
    final key = _resultsKeyForUser(userId);
    // Load existing results, append the new one, and save back
    final existingJson = box.get(key, defaultValue: '[]') as String;
    final List<dynamic> resultsList = jsonDecode(existingJson);
    resultsList.add(result.toJson());
    await box.put(key, jsonEncode(resultsList));
  }

  @override
  List<ResultModel> getAllResults(String userId) {
    if (!Hive.isBoxOpen(_boxName)) {
      return [];
    }
    final box = Hive.box(_boxName);
    final key = _resultsKeyForUser(userId);
    final existingJson = box.get(key, defaultValue: '[]') as String;
    final List<dynamic> resultsList = jsonDecode(existingJson);
    return resultsList
        .map((json) => ResultModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }
}
