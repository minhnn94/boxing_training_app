import 'package:boxing_traning/domain/models/history_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('HistoryModel Tests', () {
    test('toJson should return a valid map', () {
      final historyModel = HistoryModel(
        historyId: '1',
        sportId: 'football',
        dateTime: 123456789, // Replace with a valid timestamp
      );

      final result = historyModel.toJson();

      expect(result['historyId'], '1');
      expect(result['sportId'], 'football');
      expect(result['dateTime'], 123456789);
    });

    test('fromJson should create a valid HistoryModel object', () {
      final map = {
        'historyId': '1',
        'sportId': 'football',
        'dateTime': 123456789, // Replace with a valid timestamp
      };

      final result = HistoryModel.fromJson(map);

      expect(result.historyId, '1');
      expect(result.sportId, 'football');
      expect(result.dateTime, 123456789);
    });

    test('fromJson should handle null values', () {
      final map = {
        'historyId': null,
        'sportId': null,
        'dateTime': null,
      };

      final result = HistoryModel.fromJson(map);

      expect(result.historyId, isNull);
      expect(result.sportId, isNull);
      expect(result.dateTime, isNull);
    });
  });
}
