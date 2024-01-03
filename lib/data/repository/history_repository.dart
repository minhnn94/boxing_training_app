import 'package:boxing_traning/data/sqlite/history_crud/create_history.dart';
import 'package:boxing_traning/data/sqlite/history_crud/read_history.dart';
import 'package:boxing_traning/domain/models/history_model.dart';
import 'package:boxing_traning/domain/models/history_template.dart';

abstract class HistoryRepository {
  // Future<void> deleteSport(String id);
  // Future<MartialTemplate> getDetail(String id);
  // Future<void> updateSport(MartialTemplate martialTemplate);
  Future<void> createHistory(HistoryModel historyModel);

  Future<List<HistoryTemplate>> getAllHistory();
}

class HistoryRepositoryImpl implements HistoryRepository {
  @override
  Future<void> createHistory(HistoryModel historyModel) {
    return CreateHistory().call(model: historyModel);
  }

  @override
  Future<List<HistoryTemplate>> getAllHistory() async {
    final result = await ReadHistory().getAll();
    return HistoryTemplate.fromJsonList(result);
  }
}
