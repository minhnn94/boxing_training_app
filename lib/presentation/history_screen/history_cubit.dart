import 'package:bloc/bloc.dart';
import 'package:boxing_traning/data/repository/history_repository.dart';
import 'package:boxing_traning/domain/models/history_template.dart';
import 'package:meta/meta.dart';

part 'history_state.dart';

class HistoryCubit extends Cubit<HistoryState> {
  HistoryCubit() : super(HistoryInitial()) {
    initialData();
  }
  HistoryRepository repository = HistoryRepositoryImpl();
  void initialData() {
    loadingData();
  }

  Future<void> loadingData() async {
    emit(HistoryLoading());
    repository.getAllHistory().then((value) {
      emit(HistoryLoadingSuccess(value));
    }, onError: (_) {
      emit(HistoryLoadingError());
    });
  }
}
