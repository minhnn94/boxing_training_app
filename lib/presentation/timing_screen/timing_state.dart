part of 'timing_cubit.dart';

abstract class TimingState {}

class TimingPlayState extends TimingState {
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
  bool isFinished;

  TimingPlayState({
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
    this.isFinished = false,
  });

  TimingPlayState copyWith({
    int? roundTime,
    int? breakTime,
    bool? isRunning,
    int? currentRound,
    int? roundTotal,
    ExerciseStatus? exerciseStatus,
    int? prepareTime,
    String? name,
    bool? isPreparing,
    bool? isPause,
    bool? isFinished,
  }) {
    return TimingPlayState(
      roundTime: roundTime ?? this.roundTime,
      breakTime: breakTime ?? this.breakTime,
      isRunning: isRunning ?? this.isRunning,
      currentRound: currentRound ?? this.currentRound,
      roundTotal: roundTotal ?? this.roundTotal,
      exerciseStatus: exerciseStatus ?? this.exerciseStatus,
      prepareTime: prepareTime ?? this.prepareTime,
      name: name ?? this.name,
      isPreparing: isPreparing ?? this.isPreparing,
      isPause: isPause ?? this.isPause,
      isFinished: isFinished ?? this.isFinished,
    );
  }
}
