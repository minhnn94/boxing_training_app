import 'package:boxing_traning/data/repository/sport_repositories.dart';
import 'package:boxing_traning/domain/models/martial_template.dart';
import 'package:boxing_traning/presentation/setup_screen/setup_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'setup_state.dart';

class SetupCubit extends Cubit<SetupState> {
  SetupCubit({this.martial}) : super(SetupState()) {
    initState();
  }
  final SportRepository _repository = SportRepositoryImplement();
  void initState() {
    final breakTime = martial?.breakTime;
    final roundTime = martial?.roundTime;
    final totalRounds = martial?.totalRounds;
    final prepareTime = martial?.prepareTime;
    final name = martial?.name;
    emit(
      state.copyWith(
        breakTime: breakTime,
        roundTime: roundTime,
        totalRounds: totalRounds,
        prepareTime: prepareTime,
        name: name,
      ),
    );
  }

  String getId() {
    if (martial != null) {
      return martial?.id ?? "";
    } else {
      return DateTime.now().microsecondsSinceEpoch.toString();
    }
  }

  Future<void> handleOnPressDone(SetupScreenType type) async {
    if (type == SetupScreenType.edit) {
      await onUpdateMartialArt();
    } else {
      await onCreateMartialArt();
    }
  }

  Future<void> onUpdateMartialArt() async {
    await _repository.updateSport(getMaritalToRequest());
  }

  Future<void> onCreateMartialArt() async {
    await _repository.createSport(getMaritalToRequest());
  }

  MartialTemplate getMaritalToRequest() {
    return MartialTemplate(
      id: getId(),
      breakTime: state.breakTime,
      roundTime: state.roundTime,
      totalRounds: state.totalRounds,
      prepareTime: state.prepareTime,
      name: state.name,
    );
  }

  final MartialTemplate? martial;
  void onChangedName(String name) {
    emit(state.copyWith(name: name));
  }

  void handleOnPressChangeBreakTime(int breakTime) {
    emit(state.copyWith(breakTime: breakTime));
  }

  void handleOnPressChangeRoundTime(int roundTime) {
    emit(state.copyWith(roundTime: roundTime));
  }

  void handleOnPressChangePrepareTime(int prepareTime) {
    emit(state.copyWith(prepareTime: prepareTime));
  }

  void handleOnPressChangeTotalRounds(int totalRounds) {
    emit(state.copyWith(totalRounds: totalRounds));
  }
}
