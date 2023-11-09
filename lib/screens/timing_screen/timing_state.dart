part of 'timing_cubit.dart';

// @immutable
// abstract class TimingState {
//   final int seconds;
//
//   const TimingState(this.seconds);
// }
//
// class TimingInitial extends TimingState {}

class TimingState {
  int seconds;
  bool isRunning;
  int currentRound;

  TimingState({
    this.seconds = 0,
    this.isRunning = false,
    this.currentRound = 1,
  });
  TimingState copyWith({
    int? seconds,
    bool? isRunning,
    int? currentRound,
  }) {
    return TimingState(
      seconds: seconds ?? this.seconds,
      isRunning: isRunning ?? this.isRunning,
      currentRound: currentRound ?? this.currentRound,
    );
  }
}
