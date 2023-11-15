import 'dart:async';

import 'package:bloc/bloc.dart';

part 'timing_state.dart';

class TimingCubit extends Cubit<TimingState> {
  TimingCubit() : super(TimingState());
  Timer? _timer;
  void onInit() {}
  void startTime() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      _changeTimer,
    );
  }

  void startToRest() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      _changeTimer,
    );
  }

  void handleOnPressButtonProcess() {
    if (state.isRunning) {
      pause();
    } else {
      startTime();
    }
  }

  void _changeTimer(Timer timer) {
    if (state.trainingTime == 0) {
      _timer?.cancel();
    } else {
      final timing = state.trainingTime - 1;
      emit(state.copyWith(trainingTime: timing, isRunning: true));
    }
  }

  void _changeTimeRest(Timer timer) {
    emit(state.copyWith(isRunning: false));
    startTime();
  }

  void _handleWhenEndTime() {
    if (state.currentRound > 0) {
      final currentRound = state.currentRound--;
      emit(state.copyWith(
        currentRound: currentRound,
        isResting: true,
        isRunning: false,
      ));
    } else {
      _timer?.cancel();
    }
  }

  void pause() {
    _timer?.cancel();
    emit(state.copyWith(isRunning: false));
  }

  void onDispose() {}
}
