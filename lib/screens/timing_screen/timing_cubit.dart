import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:boxing_traning/common/singletons/sound_play.dart';
import 'package:boxing_traning/models/martial_art_model.dart';
import 'package:boxing_traning/screens/timing_screen/states/excercise_status.dart';

part 'timing_state.dart';

// const trainingSeconds = 10;
// const restingSeconds = 5;
// const totalRound = 5;

class TimingCubit extends Cubit<TimingState> {
  TimingCubit(this.martialArtModel) : super(TimingState()) {
    _initState();
  }
  void _initState() {
    final trainingTime = martialArtModel.trainingModel.trainingTime;
    final restingTime = martialArtModel.restingModel.restingTime;
    final roundTotal = martialArtModel.trainingModel.roundTotal;
    final reminderFinishTime = martialArtModel.trainingModel.reminderFinishTime;
    emit(state.copyWith(
      restTime: restingTime,
      trainingTime: trainingTime,
      roundTotal: roundTotal,
      reminderFinishTime: reminderFinishTime,
    ));
  }

  final MartialArtModel martialArtModel;
  Timer? _trainingTimer;
  Timer? _restingTimer;
  void onInit() {}
  void handleOnPressButtonProcess() {
    if (state.currentRound >= state.roundTotal) {
      return;
    }
    if (state.isRunning) {
      pause();
    } else {
      emit(state.copyWith(isRunning: true));
      startTime();
    }
  }

/*   ======================= Running Time ==============================*/
  void startTime() {
    SoundPlay().playSound();
    const oneSec = Duration(seconds: 1);
    _trainingTimer = Timer.periodic(
      oneSec,
      _changeTimer,
    );
  }

  void _changeTimer(Timer timer) {
    if (state.trainingTime == 0) {
      _handleWhenFinishRound();
    } else {
      final timing = state.trainingTime - 1;
      if (timing == state.reminderFinishTime) {
        SoundPlay().playReminderSound();
      }
      emit(state.copyWith(
        trainingTime: timing,
      ));
    }
  }

  void _handleWhenFinishRound() {
    _trainingTimer?.cancel();
    if (state.currentRound < state.roundTotal) {
      final currentRound = state.currentRound + 1;
      final restingTime = martialArtModel.restingModel.restingTime;
      emit(state.copyWith(
        restTime: restingTime,
        currentRound: currentRound,
        isRunning: false,
      ));
      startToRest();
    }
  }
/*   ======================= Resting Time ==============================*/

  void startToRest() {
    if (state.currentRound >= state.roundTotal) {
      return;
    }
    SoundPlay().playSound();
    const oneSec = Duration(seconds: 1);
    _restingTimer = Timer.periodic(
      oneSec,
      _changeTimeRest,
    );
  }

  void _changeTimeRest(Timer timer) {
    if (state.restTime == 0) {
      _handleWhenFinishRestTime();
    } else {
      final timing = state.restTime - 1;
      emit(state.copyWith(
        restTime: timing,
      ));
    }
  }

  void _handleWhenFinishRestTime() {
    _restingTimer?.cancel();
    final trainingTime = martialArtModel.trainingModel.trainingTime;
    emit(state.copyWith(trainingTime: trainingTime, isRunning: true));

    startTime();
  }

  void pause() {
    _restingTimer?.cancel();
    _trainingTimer?.cancel();
    emit(state.copyWith(isRunning: false));
  }

  void onDispose() {}
  @override
  Future<void> close() {
    _restingTimer?.cancel();
    _trainingTimer?.cancel();
    return super.close();
  }
}
