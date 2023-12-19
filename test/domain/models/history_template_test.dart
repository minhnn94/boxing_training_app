import 'package:boxing_traning/domain/models/history_template.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('HistoryTemplate Tests', () {
    test('toJson should return a valid map', () {
      final historyTemplate = HistoryTemplate(
        historyId: '1',
        nameSport: 'Football',
        dateTime: 123456789, // Replace with a valid timestamp
        totalRound: 3,
        roundTime: 60,
        breakTime: 15,
      );

      final result = historyTemplate.toJson();

      expect(result['historyId'], '1');
      expect(result['nameSport'], 'Football');
      expect(result['dateTime'], 123456789);
      expect(result['totalRound'], 3);
      expect(result['roundTime'], 60);
      expect(result['breakTime'], 15);
    });

    test('fromJson should create a valid HistoryTemplate object', () {
      final map = {
        'historyId': '1',
        'nameSport': 'Football',
        'dateTime': 123456789, // Replace with a valid timestamp
        'totalRound': 3,
        'roundTime': 60,
        'breakTime': 15,
      };

      final result = HistoryTemplate.fromJson(map);

      expect(result.historyId, '1');
      expect(result.nameSport, 'Football');
      expect(result.dateTime, 123456789);
      expect(result.totalRound, 3);
      expect(result.roundTime, 60);
      expect(result.breakTime, 15);
    });

    test('fromJsonList should create a list of valid HistoryTemplate objects',
        () {
      final dataList = [
        {
          'historyId': '1',
          'nameSport': 'Football',
          'dateTime': 123456789, // Replace with a valid timestamp
          'totalRound': 3,
          'roundTime': 60,
          'breakTime': 15,
        },
        // Add more test data as needed
      ];

      final result = HistoryTemplate.fromJsonList(dataList);

      expect(result, isA<List<HistoryTemplate>>());
      expect(result.length, dataList.length);

      // Verify the contents of the list
      for (var i = 0; i < dataList.length; i++) {
        expect(result[i].historyId, dataList[i]['historyId']);
        expect(result[i].nameSport, dataList[i]['nameSport']);
        expect(result[i].dateTime, dataList[i]['dateTime']);
        expect(result[i].totalRound, dataList[i]['totalRound']);
        expect(result[i].roundTime, dataList[i]['roundTime']);
        expect(result[i].breakTime, dataList[i]['breakTime']);
      }
    });

    test('fromJson should handle null values', () {
      final map = {
        'historyId': null,
        'nameSport': null,
        'dateTime': null,
        'totalRound': null,
        'roundTime': null,
        'breakTime': null,
      };

      final result = HistoryTemplate.fromJson(map);

      expect(result.historyId, isNull);
      expect(result.nameSport, isNull);
      expect(result.dateTime, isNull);
      expect(result.totalRound, isNull);
      expect(result.roundTime, isNull);
      expect(result.breakTime, isNull);
    });
  });
}
