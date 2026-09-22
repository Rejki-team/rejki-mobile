import 'package:flutter_test/flutter_test.dart';
import 'package:feature_report/presentation/pelaporan_masalah/cubit/pelaporan_masalah_cubit.dart';

void main() {
  group('exceedsMaxBuktiSize', () {
    test('given exactly 300000 bytes, then returns false (batas inklusif)', () {
      expect(exceedsMaxBuktiSize(300000), isFalse);
    });

    test('given 300001 bytes, then returns true', () {
      expect(exceedsMaxBuktiSize(300001), isTrue);
    });

    test('given well under the limit, then returns false', () {
      expect(exceedsMaxBuktiSize(1000), isFalse);
    });
  });
}
