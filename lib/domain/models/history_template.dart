class HistoryTemplate {
  String? historyId;
  String? nameSport;
  int? dateTime;
  int? totalRound;
  int? roundTime;
  int? breakTime;

  HistoryTemplate({
    this.historyId,
    this.nameSport,
    this.dateTime,
    this.totalRound,
    this.roundTime,
    this.breakTime,
  }); // HistoryModel({this.historyId, this.sportId, this.dateTime});

  static List<HistoryTemplate> fromJsonList(List<Map<String, dynamic>> data) {
    return data.map((e) => HistoryTemplate.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    return {
      'historyId': historyId ?? '',
      'nameSport': nameSport ?? '',
      'dateTime': dateTime ?? 0,
      'totalRound': totalRound ?? 0,
      'roundTime': roundTime ?? 0,
      'breakTime': breakTime ?? 0,
    };
  }

  factory HistoryTemplate.fromJson(Map<String, dynamic> map) {
    return HistoryTemplate(
      historyId: map['historyId'] as String?,
      nameSport: map['nameSport'] as String?,
      dateTime: map['dateTime'] as int?,
      totalRound: map['totalRound'] as int?,
      roundTime: map['roundTime'] as int?,
      breakTime: map['breakTime'] as int?,
    );
  }
}
