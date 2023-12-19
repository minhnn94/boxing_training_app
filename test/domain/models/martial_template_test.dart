import 'package:boxing_traning/domain/models/martial_template.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('MartialTemplate Tests', () {
    test('fromJson should create a valid MartialTemplate object', () {
      final json = {
        'id': '1',
        'name': 'Karate',
        'prepareTime': 10,
        'breakTime': 5,
        'roundTime': 120,
        'totalRounds': 3,
      };

      final result = MartialTemplate.fromJson(json);

      expect(result.id, '1');
      expect(result.name, 'Karate');
      expect(result.prepareTime, 10);
      expect(result.breakTime, 5);
      expect(result.roundTime, 120);
      expect(result.totalRounds, 3);
    });

    test('fromJsonList should create a list of valid MartialTemplate objects',
        () {
      final dataList = [
        {
          'id': '1',
          'name': 'Karate',
          'prepareTime': 10,
          'breakTime': 5,
          'roundTime': 120,
          'totalRounds': 3,
        },
        // Add more test data as needed
      ];

      final result = MartialTemplate.fromJsonList(dataList);

      expect(result, isA<List<MartialTemplate>>());
      expect(result.length, dataList.length);

      // Verify the contents of the list
      for (var i = 0; i < dataList.length; i++) {
        expect(result[i].id, dataList[i]['id']);
        expect(result[i].name, dataList[i]['name']);
        expect(result[i].prepareTime, dataList[i]['prepareTime']);
        expect(result[i].breakTime, dataList[i]['breakTime']);
        expect(result[i].roundTime, dataList[i]['roundTime']);
        expect(result[i].totalRounds, dataList[i]['totalRounds']);
      }
    });

    test('Equatable should correctly compare objects', () {
      final template1 = MartialTemplate(
        id: '1',
        name: 'Karate',
        prepareTime: 10,
        breakTime: 5,
        roundTime: 120,
        totalRounds: 3,
      );

      final template2 = MartialTemplate(
        id: '1',
        name: 'Karate',
        prepareTime: 10,
        breakTime: 5,
        roundTime: 120,
        totalRounds: 3,
      );

      final template3 = MartialTemplate(
        id: '2',
        name: 'Judo',
        prepareTime: 15,
        breakTime: 7,
        roundTime: 150,
        totalRounds: 4,
      );

      expect(template1, equals(template2));
      expect(template1 == template3, isFalse);
    });
  });
}
