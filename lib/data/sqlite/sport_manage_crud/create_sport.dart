import 'package:boxing_traning/data/sqlite/data_constant.dart';
import 'package:boxing_traning/data/sqlite/data_helper.dart';
import 'package:boxing_traning/domain/models/martial_template.dart';
import 'package:sqflite/sqflite.dart';

class CreateSport extends DBHelper {
  Database? dbClient;
  Future<void> init() async {
    dbClient = await db;
  }

  Future<MartialTemplate?> call(
      {required MartialTemplate martialTemplate}) async {
    dbClient = await db;
    Map<String, dynamic> requestObj = {
      DataConstant.id: martialTemplate.id,
      DataConstant.name: martialTemplate.name,
      DataConstant.breakTime: martialTemplate.breakTime,
      DataConstant.prepareTime: martialTemplate.prepareTime,
      DataConstant.roundTime: martialTemplate.roundTime,
      DataConstant.totalRounds: martialTemplate.totalRounds,
    };
    if (dbClient != null) {
      await dbClient!.insert(DataConstant.tableSport, requestObj);
      return martialTemplate;
    }
    return null;
  }

  // Future<MartialTemplate?> call(MartialTemplate planItem) async {
  //   dbClient = await db;
  //   Map<String, dynamic> requestObj = {
  //     ConstantDB.ID: planItem.id,
  //     ConstantDB.TITLE: planItem.title,
  //     ConstantDB.DETAIL: planItem.detail,
  //     ConstantDB.STATUS: planItem.status,
  //     ConstantDB.DATE_TIME: planItem.dateTime
  //   };
  //   if (dbClient != null) {
  //     await dbClient!.insert(ConstantDB.TABLE_TODAY_PLAN, requestObj);
  //     return planItem;
  //   }
  //   return null;
  // }
}
