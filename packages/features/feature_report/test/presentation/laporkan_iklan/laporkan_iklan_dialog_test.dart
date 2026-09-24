import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:components/components.dart';

void main() {
  Future<void> pumpDialog(WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (context) => ElevatedButton(
              onPressed: () =>
                  LaporkanIklanDialog.show(context, onSubmit: (_) {}),
              child: const Text('open'),
            ),
          ),
        ),
      ),
    );
    await tester.tap(find.text('open'));
    await tester.pumpAndSettle();
  }

  testWidgets(
    'given alasan under 50 characters, then submit button is disabled',
    (tester) async {
      await pumpDialog(tester);

      await tester.enterText(find.byType(TextField), 'terlalu pendek');
      await tester.pump();

      final button = tester.widget<ElevatedButton>(
        find.widgetWithText(ElevatedButton, 'Kirim Laporan'),
      );
      expect(button.onPressed, isNull);
    },
  );

  testWidgets(
    'given alasan within 50-255 characters, then submit button is enabled',
    (tester) async {
      await pumpDialog(tester);

      await tester.enterText(
        find.byType(TextField),
        'a' * 60, // 60 karakter, dalam rentang valid
      );
      await tester.pump();

      final button = tester.widget<ElevatedButton>(
        find.widgetWithText(ElevatedButton, 'Kirim Laporan'),
      );
      expect(button.onPressed, isNotNull);
    },
  );
}
