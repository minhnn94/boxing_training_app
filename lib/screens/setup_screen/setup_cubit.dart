import 'package:boxing_traning/models/martial_template.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'setup_state.dart';

class SetupCubit extends Cubit<SetupState> {
  SetupCubit({this.martial}) : super(SetupState()) {
    initState();
  }
  void initState() {
    final breakTime = martial?.breakTime;
    final roundTime = martial?.roundTime;
    final totalRounds = martial?.totalRounds;
    final prepareTime = martial?.prepareTime;
    emit(
      state.copyWith(
        breakTime: breakTime,
        roundTime: roundTime,
        totalRounds: totalRounds,
        prepareTime: prepareTime,
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

  MartialTemplate getMaritalToRequest() {
    return MartialTemplate(
      id: getId(),
      breakTime: state.breakTime,
      roundTime: state.roundTime,
      totalRounds: state.totalRounds,
      prepareTime: state.prepareTime,
    );
  }

  final MartialTemplate? martial;
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
