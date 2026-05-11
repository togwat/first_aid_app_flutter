import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:first_aid_app/widgets/cpr_timer_content.dart';

Widget _wrap(Widget child) => MaterialApp(home: Scaffold(body: child));

void main() {
  group('CPRTimer widget', () {
    testWidgets('shows Start button before timer is running', (tester) async {
      await tester.pumpWidget(_wrap(const CPRTimer(100, 30, 2, 1500)));
      expect(find.widgetWithText(ElevatedButton, 'Start'), findsOneWidget);
    });

    testWidgets('shows Compressions label before timer is running', (tester) async {
      await tester.pumpWidget(_wrap(const CPRTimer(100, 30, 2, 1500)));
      expect(find.text('Compressions'), findsOneWidget);
    });

    testWidgets('elapsed shows 0:00 before timer starts', (tester) async {
      await tester.pumpWidget(_wrap(const CPRTimer(100, 30, 2, 1500)));
      expect(find.text('0:00'), findsOneWidget);
    });

    testWidgets('displays the BPM passed in', (tester) async {
      await tester.pumpWidget(_wrap(const CPRTimer(110, 30, 2, 1500)));
      expect(find.text('110 BPM'), findsOneWidget);
    });

    testWidgets('tapping Start changes button label to Stop', (tester) async {
      await tester.pumpWidget(_wrap(const CPRTimer(100, 30, 2, 1500)));
      await tester.tap(find.widgetWithText(ElevatedButton, 'Start'));
      await tester.pump();
      expect(find.widgetWithText(ElevatedButton, 'Stop'), findsOneWidget);
    });

    testWidgets(
      'tapping Stop after Start resets button label to Start', (tester) async {
        await tester.pumpWidget(_wrap(const CPRTimer(100, 30, 2, 1500)));
        // start the timer
        await tester.tap(find.widgetWithText(ElevatedButton, 'Start'));
        await tester.pump(Duration(milliseconds: 500));
        // stop the timer
        await tester.tap(find.widgetWithText(ElevatedButton, 'Stop'));
        await tester.pump();
        expect(find.widgetWithText(ElevatedButton, 'Start'), findsOneWidget);
      });

    testWidgets('compression count increments on each tick', (tester) async {
      await tester.pumpWidget(_wrap(const CPRTimer(100, 30, 2, 1500)));
      await tester.tap(find.widgetWithText(ElevatedButton, 'Start'));
      await tester.pump();
      expect(find.text('1'), findsOneWidget);

      await tester.pump(const Duration(milliseconds: 600)); // one tick
      expect(find.text('2'), findsOneWidget);

      await tester.pump(const Duration(milliseconds: 600)); // two ticks
      expect(find.text('3'), findsOneWidget);
    });

    testWidgets('label switches to Rescue Breaths after compression cycle completes', (tester) async {
      await tester.pumpWidget(_wrap(const CPRTimer(100, 30, 2, 1500)));
      await tester.tap(find.widgetWithText(ElevatedButton, 'Start'));
      await tester.pump();
      expect(find.text('Compressions'), findsOneWidget);

      await tester.pump(const Duration(milliseconds: 600 * 30)); // 30 ticks
      expect(find.text('Rescue Breaths'), findsOneWidget);
    });
  });
}
