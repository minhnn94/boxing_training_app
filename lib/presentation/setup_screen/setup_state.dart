part of 'setup_cubit.dart';

class SetupState {
  int? breakTime;
  int? roundTime;
  int? prepareTime;
  int? totalRounds;
  String? name;

  SetupState({
    this.breakTime,
    this.roundTime,
    this.prepareTime,
    this.totalRounds,
    this.name,
  });
  SetupState copyWith({
    int? breakTime,
    int? roundTime,
    int? prepareTime,
    int? totalRounds,
    String? name,
  }) {
    return SetupState(
      breakTime: breakTime ?? this.breakTime,
      roundTime: roundTime ?? this.roundTime,
      prepareTime: prepareTime ?? this.prepareTime,
      totalRounds: totalRounds ?? this.totalRounds,
      name: name ?? this.name,
    );
  }
}
