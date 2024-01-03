import 'dart:async';

import 'package:boxing_traning/common/singletons/sound_play.dart';
import 'package:boxing_traning/data/repository/history_repository.dart';
import 'package:boxing_traning/domain/models/history_model.dart';
import 'package:boxing_traning/domain/models/martial_template.dart';
import 'package:boxing_traning/presentation/timing_screen/states/excercise_status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'timing_state.dart';

class TimingCubit extends Cubit<TimingPlayState> {
  TimingCubit(this.martialArt) : super(TimingPlayState()) {
    onInit();
  }
  final HistoryRepository _repository = HistoryRepositoryImpl();
  Future<void> onSaveTraining() async {
    final historyModel = HistoryModel(
      historyId: DateTime.now().microsecondsSinceEpoch.toString(),
      dateTime: DateTime.now().microsecondsSinceEpoch,
      sportId: martialArt.id,
    );
    await _repository.createHistory(historyModel);
  }

  void _initState() {
    final roundTime = martialArt.roundTime;
    final breakTime = martialArt.breakTime;
    final roundTotal = martialArt.totalRounds;
    final prepareTime = martialArt.prepareTime;
    final name = martialArt.name;
    emit(state.copyWith(
      breakTime: breakTime,
      roundTime: roundTime,
      roundTotal: roundTotal,
      prepareTime: prepareTime,
      name: name,
    ));
  }

  final MartialTemplate martialArt;
  Timer? _trainingTimer;
  Timer? _restingTimer;
  void onInit() {
    _initState();
    SoundPlay().startPrepare();
  }

  void onPrepareDone() {
    final currentRound = state.currentRound + 1;
    emit(
      state.copyWith(
        isPreparing: false,
        isRunning: true,
        currentRound: currentRound,
      ),
    );
    startTime();
  }

  void handleOnPressButtonProcess() {
    if (state.currentRound >= state.roundTotal) {
      return;
    }
    if (state.isPause) {
      _handleResume();
    } else {
      _handlePause();
    }
  }

  void _handleResume() {
    if (state.isRunning) {
      startTime();
    } else {
      startToRest();
    }
    emit(state.copyWith(isPause: false));
  }

  void _handlePause() {
    pause();
    emit(state.copyWith(isPause: true));
  }

/*   ======================= Running Time ==============================*/
  Future<void> startTime() async {
    await SoundPlay().startBoxingBelt();
    const oneSec = Duration(seconds: 1);
    _trainingTimer = Timer.periodic(
      oneSec,
      _changeTimer,
    );
  }

  void _changeTimer(Timer timer) {
    if (state.roundTime == 0) {
      _handleWhenFinishRound();
    } else {
      _handleWhenStillTime();
    }
  }

  void _handleWhenStillTime() {
    final timing = state.roundTime - 1;
    if (timing == state.prepareTime) {
      SoundPlay().playReminderSound();
    }
    emit(state.copyWith(roundTime: timing));
  }

  void _handleWhenFinishRound() {
    _trainingTimer?.cancel();
    if (state.currentRound < state.roundTotal) {
      _handleWhenStillRound();
    } else {
      emit(state.copyWith(isFinished: true));
    }
  }

  void _handleWhenStillRound() {
    final restingTime = martialArt.breakTime;
    emit(state.copyWith(
      breakTime: restingTime,
      isRunning: false,
    ));
    startToRest();
  }
/*   ======================= Resting Time ==============================*/

  Future<void> startToRest() async {
    if (state.currentRound >= state.roundTotal) {
      return;
    }
    await SoundPlay().playFinishSound();
    const oneSec = Duration(seconds: 1);
    _restingTimer = Timer.periodic(
      oneSec,
      _changeTimeRest,
    );
  }

  void _changeTimeRest(Timer timer) {
    if (state.breakTime == 0) {
      _handleWhenFinishRestTime();
    } else {
      final timing = state.breakTime - 1;
      emit(state.copyWith(
        breakTime: timing,
      ));
    }
  }

  void _handleWhenFinishRestTime() {
    _restingTimer?.cancel();
    final roundTime = martialArt.roundTime;
    final currentRound = state.currentRound + 1;

    emit(state.copyWith(
      roundTime: roundTime,
      isRunning: true,
      currentRound: currentRound,
    ));
    startTime();
  }

  void pause() {
    _restingTimer?.cancel();
    _trainingTimer?.cancel();
    // emit(state.copyWith(isRunning: false));
  }

  void handleOnPressFinish() {
    pause();
    emit(state.copyWith(isFinished: true));
  }

  void onDispose() {}
  @override
  Future<void> close() {
    _restingTimer?.cancel();
    _trainingTimer?.cancel();
    return super.close();
  }
}
