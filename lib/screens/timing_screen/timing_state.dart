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
  int roundTotal;
  ExerciseStatus exerciseStatus;

  TimingState({
    this.trainingTime = 10,
    this.isRunning = false,
    this.currentRound = 1,
    this.restTime = 5,
    this.roundTotal = 5,
    this.exerciseStatus = ExerciseStatus.prepare,
  });
  TimingState copyWith(
      {int? trainingTime,
      bool? isRunning,
      int? currentRound,
      int? restTime,
      int? roundTotal,
      ExerciseStatus? exerciseStatus}) {
    return TimingState(
      restTime: restTime ?? this.restTime,
      trainingTime: trainingTime ?? this.trainingTime,
      isRunning: isRunning ?? this.isRunning,
      currentRound: currentRound ?? this.currentRound,
      roundTotal: roundTotal ?? this.roundTotal,
      exerciseStatus: exerciseStatus ?? this.exerciseStatus,
    );
  }
}
