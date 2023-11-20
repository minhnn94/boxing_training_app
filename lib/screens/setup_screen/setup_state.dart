part of 'setup_cubit.dart';

class SetupState {
  int? breakTime;
  int? roundTime;
  int? prepareTime;
  int? totalRounds;

  SetupState({
    this.breakTime,
    this.roundTime,
    this.prepareTime,
    this.totalRounds,
  });
  SetupState copyWith({
    int? breakTime,
    int? roundTime,
    int? prepareTime,
    int? totalRounds,
  }) {
    return SetupState(
      breakTime: breakTime ?? this.breakTime,
      roundTime: roundTime ?? this.roundTime,
      prepareTime: prepareTime ?? this.prepareTime,
      totalRounds: totalRounds ?? this.totalRounds,
    );
  }
}
