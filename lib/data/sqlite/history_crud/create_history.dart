import 'package:boxing_traning/data/sqlite/data_constant.dart';
import 'package:boxing_traning/data/sqlite/data_helper.dart';
import 'package:boxing_traning/domain/models/history_model.dart';
import 'package:sqflite/sqflite.dart';

class CreateSport extends DBHelper {
  Database? dbClient;
  Future<void> init() async {
    dbClient = await db;
  }

  Future<HistoryModel?> call({required HistoryModel model}) async {
    dbClient = await db;
    Map<String, dynamic> requestObj = model.toJson();
    if (dbClient != null) {
      await dbClient!.insert(DataConstant.tableHistory, requestObj);
      return model;
    }
    return null;
  }
}
