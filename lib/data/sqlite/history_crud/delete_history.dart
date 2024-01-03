import 'package:boxing_traning/data/sqlite/data_constant.dart';
import 'package:boxing_traning/data/sqlite/data_helper.dart';

class DeleteSport extends DBHelper {
  Future<int> call(String id) async {
    var dbClient = await db;
    if (dbClient != null) {
      return dbClient.delete(DataConstant.tableSport,
          where: '${DataConstant.id} =?', whereArgs: [id]);
    }
    return 0;
  }
}
