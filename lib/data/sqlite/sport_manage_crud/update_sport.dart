import 'package:boxing_traning/data/sqlite/data_constant.dart';
import 'package:boxing_traning/data/sqlite/data_helper.dart';
import 'package:boxing_traning/domain/models/martial_template.dart';

class UpdateSport extends DBHelper {
  Future<MartialTemplate?> call(MartialTemplate martialTemplate) async {
    var dbClient = await db;
    Map<String, dynamic> requestObj = {
      DataConstant.name: martialTemplate.name,
      DataConstant.breakTime: martialTemplate.breakTime,
      DataConstant.prepareTime: martialTemplate.prepareTime,
      DataConstant.roundTime: martialTemplate.roundTime,
      DataConstant.totalRounds: martialTemplate.totalRounds,
    };
    if (dbClient != null) {
      await dbClient.update(DataConstant.tableSport, requestObj,
          where: '${DataConstant.id} =?', whereArgs: [martialTemplate.id]);
      return martialTemplate;
    }
    return null;
  }
}
