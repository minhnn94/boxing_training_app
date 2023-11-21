import 'package:bloc/bloc.dart';
import 'package:boxing_traning/common/kdbug_log.dart';
import 'package:boxing_traning/data/repository/sport_repositories.dart';
import 'package:boxing_traning/domain/models/martial_template.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState()){
    getAllSport();
  }
  final SportRepository _repository = SportRepositoryImplement();

  Future<void> getAllSport() async {
    final data = await _repository.getAllSports();
    kDebugLog('Data: $data');
    emit(state.copyWith(data: data));
  }

  void createMMA() {
    final mixMartialArt = MartialTemplate(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      name: 'MMA',
      breakTime: 10,
      prepareTime: 5,
      roundTime: 60,
      totalRounds: 5,
    );
    Future<void> getAllSport() async {
      final data = await _repository.getAllSports();
      kDebugLog('Data: $data');
      emit(state.copyWith(data: data));
    }

    _repository.createSport(mixMartialArt);
  }
}
