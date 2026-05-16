import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:injectable/injectable.dart';
import 'package:online_exam/features/results/data/datasources/result_local_datasource.dart';
import 'package:online_exam/features/results/data/models/result_model.dart';

@LazySingleton(as: ResultLocalDatasource)
class ResultLocalDatasourceImpl implements ResultLocalDatasource {
  /// Returns a unique box name for each user to ensure data isolation and persistence.
  String _userBoxName(String userId) => 'results_${userId.isEmpty ? "guest" : userId}';

  Future<Box> _openUserBox(String userId) async {
    final boxName = _userBoxName(userId);
    Box box;
    if (Hive.isBoxOpen(boxName)) {
      box = Hive.box(boxName);
    } else {
      box = await Hive.openBox(boxName);
    }
    debugPrint('Hive box "$boxName" is persisted at: ${box.path}');
    return box;
  }

  @override
  Future<void> saveExamResult(ResultModel result, String userId) async {
    final box = await _openUserBox(userId);
    debugPrint('Saving new exam result for user: $userId');
    
    // Use box.add to append a new entry automatically
    await box.add(jsonEncode(result.toJson()));
    
    debugPrint('Successfully saved. Total results in box: ${box.length}');
  }

  @override
  Future<List<ResultModel>> getAllResults(String userId) async {
    final box = await _openUserBox(userId);
    debugPrint('Fetching all results from box: ${box.name}');
    
    final results = box.values.map((encodedJson) {
      final Map<String, dynamic> json = jsonDecode(encodedJson as String);
      return ResultModel.fromJson(json);
    }).toList();
        
    debugPrint('Returning ${results.length} results');
    return results;
  }
}
