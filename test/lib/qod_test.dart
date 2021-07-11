import 'package:flutter_test/flutter_test.dart';
import 'package:kyu/src/qod/qod.dart';

void main() {
  group('test qod function', () {
    test('it should be working', () async {
      final r = await getQuoteOfTheDay();

      expect(r, isNotNull);
    });
  });
}
