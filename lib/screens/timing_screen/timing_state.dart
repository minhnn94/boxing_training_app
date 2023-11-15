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
  int trainingTime;
  int restTime;
  bool isRunning;
  int currentRound;
  bool isResting;

  TimingState({
    this.trainingTime = 300,
    this.isRunning = false,
    this.currentRound = 1,
    this.restTime = 30,
    this.isResting = false,
  });
  TimingState copyWith({
    int? trainingTime,
    bool? isRunning,
    int? currentRound,
    int? restTime,
    bool? isResting,
  }) {
    return TimingState(
      restTime: restTime ?? this.restTime,
      trainingTime: trainingTime ?? this.trainingTime,
      isRunning: isRunning ?? this.isRunning,
      currentRound: currentRound ?? this.currentRound,
      isResting: isResting ?? this.isResting,
    );
  }
}
