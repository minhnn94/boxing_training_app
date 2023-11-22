part of 'timing_cubit.dart';

class TimingState {
  int roundTime;
  int breakTime;
  bool isRunning;
  int currentRound;
  int roundTotal;
  ExerciseStatus exerciseStatus;
  int prepareTime;
  String name;
  bool isPreparing;
  bool isPause;

  TimingState({
    this.roundTime = 10,
    this.isRunning = false,
    this.currentRound = 1,
    this.breakTime = 5,
    this.roundTotal = 5,
    this.exerciseStatus = ExerciseStatus.prepare,
    this.prepareTime = 30,
    this.name = '',
    this.isPreparing = true,
    this.isPause = false,
  });
  TimingState copyWith({
    int? roundTime,
    bool? isRunning,
    bool? isPreparing,
    int? currentRound,
    int? breakTime,
    int? roundTotal,
    ExerciseStatus? exerciseStatus,
    int? prepareTime,
    String? name,
    bool? isPause,
  }) {
    return TimingState(
      prepareTime: prepareTime ?? this.prepareTime,
      breakTime: breakTime ?? this.breakTime,
      roundTime: roundTime ?? this.roundTime,
      isRunning: isRunning ?? this.isRunning,
      currentRound: currentRound ?? this.currentRound,
      roundTotal: roundTotal ?? this.roundTotal,
      exerciseStatus: exerciseStatus ?? this.exerciseStatus,
      name: name ?? this.name,
      isPreparing: isPreparing ?? this.isPreparing,
      isPause: isPause ?? this.isPause,
    );
  }
}
