import 'package:boxing_traning/data/sqlite/sport_manage_crud/create_sport.dart';
import 'package:boxing_traning/data/sqlite/sport_manage_crud/delete_sport.dart';
import 'package:boxing_traning/data/sqlite/sport_manage_crud/read_sport.dart';
import 'package:boxing_traning/data/sqlite/sport_manage_crud/update_sport.dart';
import 'package:boxing_traning/domain/models/martial_template.dart';

abstract class SportRepository {
  Future<void> createSport(MartialTemplate martialTemplate);
  Future<void> updateSport(MartialTemplate martialTemplate);
  Future<void> deleteSport(String id);
  Future<MartialTemplate> getDetail(String id);
  Future<List<MartialTemplate>> getAllSports();
}

class SportRepositoryImplement implements SportRepository {
  @override
  Future<void> createSport(MartialTemplate martialTemplate) async {
    await CreateSport().call(martialTemplate: martialTemplate);
  }

  @override
  Future<void> deleteSport(String id) async {
    await DeleteSport().call(id);
  }

  @override
  Future<List<MartialTemplate>> getAllSports() async {
    final result = await ReadSport().getAll();
    return MartialTemplate.fromJsonList(result);
  }

  @override
  Future<MartialTemplate> getDetail(String id) async {
    final result = await ReadSport().getDetail(id);
    final data = MartialTemplate.fromJsonList(result);
    return data.first;
  }

  @override
  Future<void> updateSport(MartialTemplate martialTemplate) async {
    await UpdateSport().call(martialTemplate);
  }
}
