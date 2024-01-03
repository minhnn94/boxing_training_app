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

  static MartialTemplate fromJson(Map<String, dynamic> json) {
    return MartialTemplate(
      id: (json['id'] ?? '') as String,
      name: json['name'] as String?,
      prepareTime: json['prepareTime'] as int?,
      breakTime: json['breakTime'] as int?,
      roundTime: json['roundTime'] as int?,
      totalRounds: json['totalRounds'] as int?,
    );
  }

  static List<MartialTemplate> fromJsonList(List<Map<String, dynamic>> data) {
    return data.map((e) => fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'breakTime': breakTime ?? 0,
      'prepareTime': prepareTime ?? 0,
      'roundTime': roundTime ?? 0,
      'totalRounds': totalRounds ?? 0,
      'name': name ?? '',
    };
  }
}
