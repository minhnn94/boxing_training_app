import 'package:equatable/equatable.dart';

class MartialTemplate extends Equatable {
  String id;
  int? breakTime;
  int? prepareTime;
  int? roundTime;
  int? totalRounds;
  String? name;

  MartialTemplate({
    required this.id,
    this.name,
    this.breakTime,
    this.prepareTime,
    this.roundTime,
    this.totalRounds,
  });

  @override
  List<Object?> get props => [id];
}
