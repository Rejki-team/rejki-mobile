import 'package:shared_preferences/shared_preferences.dart';
import 'package:test/test.dart';
import 'package:local/local.dart';

void main() {
  late AdImpressionStorage storage;
  final today = DateTime(2026, 9, 21);
  final tomorrow = DateTime(2026, 9, 22);

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    storage = AdImpressionStorage(await SharedPreferences.getInstance());
  });

  test('given belum ada impression hari ini, when canShowAd, then true', () {
    expect(storage.canShowAd(now: today), isTrue);
  });

  test(
    'given impression ke-10 sudah tercatat hari ini, when canShowAd ke-11, then false',
    () async {
      for (var i = 0; i < AdImpressionStorage.maxImpressionsPerDay; i++) {
        await storage.recordImpressionShown(now: today);
      }

      expect(storage.canShowAd(now: today), isFalse);
    },
  );

  test(
    'given kuota habis hari ini, when tanggal kalender berganti, then reset ke true',
    () async {
      for (var i = 0; i < AdImpressionStorage.maxImpressionsPerDay; i++) {
        await storage.recordImpressionShown(now: today);
      }
      expect(storage.canShowAd(now: today), isFalse);

      expect(storage.canShowAd(now: tomorrow), isTrue);
      await storage.recordImpressionShown(now: tomorrow);
      expect(storage.canShowAd(now: tomorrow), isTrue);
    },
  );
}
