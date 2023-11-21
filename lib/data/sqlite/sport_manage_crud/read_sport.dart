import 'package:boxing_traning/data/sqlite/data_constant.dart';
import 'package:boxing_traning/data/sqlite/data_helper.dart';
import 'package:sqflite/sqflite.dart';

class ReadSport extends DBHelper {
  Database? dbClient;
  String? whereQuery;
  Future<void> init() async {
    dbClient = await db;

    whereQuery =
        '${DataConstant.name} >=?  ORDER BY ${DataConstant.name} DESC ';
  }

  Future<List<Map<String, dynamic>>> getAll() async {
    await init();
    List<Map<String, dynamic>> maps = await dbClient!.query(
        DataConstant.tableSport,
        columns: columnsRequest,
        where: whereQuery,
        whereArgs: [0]);
    return maps;
  }

  Future<List<Map<String, dynamic>>> getDetail(String id) async {
    await init();
    return dbClient!.query(DataConstant.tableSport,
        where: '${DataConstant.id} =?', whereArgs: [id]);
    // List<Map<String, dynamic>> maps = await dbClient!.query(
    //     DataConstant.tableSport,
    //     columns: columnsRequest,
    //     where: whereQuery,
    //     whereArgs: [0]);
    // return maps;
  }
}
