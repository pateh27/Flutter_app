import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'package:flutter_application_1/main.dart';

void main() {
  testWidgets('WordPair should change when Next button is pressed',
      (WidgetTester tester) async {
    // Build app dengan Provider agar context.watch bekerja
    await tester.pumpWidget(
      ChangeNotifierProvider<MyAppState>(
        create: (context) => MyAppState(),
        child: const MyApp(),
      ),
    );

    // Pastikan teks awal ada
    expect(find.text('A random AWESOME idea:'), findsOneWidget);

    // Ambil kata awal
    final firstWordFinder = find.byType(BigCard);
    expect(firstWordFinder, findsOneWidget);
    final firstWordWidget = tester.widget<BigCard>(firstWordFinder);
    final firstWord = firstWordWidget.pair;

    // Tekan tombol Next
    await tester.tap(find.text('Next'));
    await tester.pump();

    // Pastikan kata berubah
    final newWordWidget = tester.widget<BigCard>(firstWordFinder);
    final newWord = newWordWidget.pair;

    expect(newWord, isNot(equals(firstWord)));
  });
}
