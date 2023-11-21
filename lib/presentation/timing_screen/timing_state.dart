part of 'timing_cubit.dart';

class TimingState {
  int trainingTime;
  int restTime;
  bool isRunning;
  int currentRound;
  int roundTotal;
  ExerciseStatus exerciseStatus;
  int reminderFinishTime;

  TimingState({
    this.trainingTime = 10,
    this.isRunning = false,
    this.currentRound = 1,
    this.restTime = 5,
    this.roundTotal = 5,
    this.exerciseStatus = ExerciseStatus.prepare,
    this.reminderFinishTime = 30,
  });
  TimingState copyWith({
    int? roundTime,
    bool? isRunning,
    int? currentRound,
    int? restTime,
    int? roundTotal,
    ExerciseStatus? exerciseStatus,
    int? reminderFinishTime,
  }) {
    return TimingState(
      restTime: restTime ?? this.restTime,
      trainingTime: roundTime ?? this.trainingTime,
      isRunning: isRunning ?? this.isRunning,
      currentRound: currentRound ?? this.currentRound,
      roundTotal: roundTotal ?? this.roundTotal,
      exerciseStatus: exerciseStatus ?? this.exerciseStatus,
      reminderFinishTime: reminderFinishTime ?? this.reminderFinishTime,
    );
  }
}
