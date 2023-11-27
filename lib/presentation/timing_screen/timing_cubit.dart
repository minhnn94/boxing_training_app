import 'dart:async';

import 'package:boxing_traning/common/singletons/sound_play.dart';
import 'package:boxing_traning/domain/models/martial_template.dart';
import 'package:boxing_traning/presentation/timing_screen/states/excercise_status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'timing_state.dart';

class TimingCubit extends Cubit<TimingPlayState> {
  TimingCubit(this.martialArt) : super(TimingPlayState()) {
    _initState();
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
  void onInit() {}
  void onPrepareDone() {
    emit(state.copyWith(isPreparing: false, isRunning: true));
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
  void startTime() {
    SoundPlay().playSound();
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
      final timing = state.roundTime - 1;
      if (timing == state.prepareTime) {
        SoundPlay().playReminderSound();
      }
      emit(state.copyWith(
        roundTime: timing,
      ));
    }
  }

  void _handleWhenFinishRound() {
    _trainingTimer?.cancel();
    if (state.currentRound < state.roundTotal) {
      final restingTime = martialArt.breakTime;
      emit(state.copyWith(
        breakTime: restingTime,
        // currentRound: currentRound,
        isRunning: false,
      ));
      startToRest();
    } else {
      emit(state.copyWith(isFinished: true));
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
