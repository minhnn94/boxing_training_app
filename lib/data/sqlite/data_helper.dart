import 'dart:io' as io;

import 'package:boxing_traning/common/kdbug_log.dart';
import 'package:boxing_traning/domain/models/martial_template.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'data_constant.dart';

class DBHelper {
  Database? _db;
  late List<String> _columnsRequest;
  Future<Database?> get db async {
    if (_db != null) return _db;
    _db = await initDb();
    return _db;
  }

  List<String> get columnsRequest => _columnsRequest;

  DBHelper() {
    _columnsRequest = [
      DataConstant.id,
      DataConstant.name,
      DataConstant.breakTime,
      DataConstant.roundTime,
      DataConstant.prepareTime
    ];
  }

  List<String>? get columnRequest => _columnsRequest;

  initDb() async {
    io.Directory documentsDirectory;
    try {
      documentsDirectory = await getApplicationDocumentsDirectory();
      String path = join(documentsDirectory.path, DataConstant.dbName);
      var db = await openDatabase(path, version: 1, onCreate: _onCreate);
      _addDefaultMMA(db);
      return db;
    } catch (e) {
      kDebugLog('Error $e');
    }
  }

  _onCreate(Database db, int version) async {
    await db.execute('''
        Create table ${DataConstant.tableSport} (${DataConstant.id} TEXT primary key, 
         ${DataConstant.name} TEXT, ${DataConstant.breakTime} INTEGER,
          ${DataConstant.prepareTime} INTEGER, ${DataConstant.roundTime} INTEGER,
          ${DataConstant.totalRounds} INTEGER
          )
        ''');
    await db.execute('''
        Create table ${DataConstant.tableHistory} (${DataConstant.historyId} TEXT primary key,
         ${DataConstant.sportId} TEXT, ${DataConstant.dateTime} INTEGER)
        ''');
  }

  void _addDefaultMMA(Database dataBase) {
    MartialTemplate model = MartialTemplate(
      id: '1',
      breakTime: 60,
      totalRounds: 3,
      roundTime: 300,
      prepareTime: 5,
    );
    Map<String, dynamic> requestObj = model.toJson();
    dataBase.insert(DataConstant.tableSport, requestObj);
  }


  Future<MartialTemplate> update(MartialTemplate planItem) async {
    var dbClient = await db;
    // Map<String, dynamic> map = planItem.toJson();
    // print('data map $map');
    await dbClient!.update(
        DataConstant.tableSport,
        {
          DataConstant.name: planItem.name,
          DataConstant.breakTime: planItem.breakTime,
          DataConstant.prepareTime: planItem.prepareTime,
          DataConstant.roundTime: planItem.roundTime
        },
        where: '${DataConstant.id} =?',
        whereArgs: [planItem.id]);
    return planItem;
  }

  Future<int> delete(int id) async {
    var dbClient = await db;
    return dbClient!.delete(DataConstant.tableSport,
        where: '${DataConstant.id} =?', whereArgs: [id]);
  }
}
