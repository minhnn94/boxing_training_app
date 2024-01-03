class HistoryModel {
  String? historyId;
  String? sportId;
  int? dateTime;

  HistoryModel({this.historyId, this.sportId, this.dateTime});

  Map<String, dynamic> toJson() {
    return {
      'historyId': historyId ?? '',
      'sportId': sportId ?? '',
      'dateTime': dateTime ?? DateTime.now().microsecondsSinceEpoch,
    };
  }

  factory HistoryModel.fromJson(Map<String, dynamic> map) {
    return HistoryModel(
      historyId: map['historyId'] as String?,
      sportId: map['sportId'] as String?,
      dateTime: map['dateTime'] as int?,
    );
  }
}
