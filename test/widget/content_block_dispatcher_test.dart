import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:first_aid_app/models/content_block.dart';
import 'package:first_aid_app/widgets/content_block_dispatcher.dart';
import 'package:first_aid_app/widgets/text_content.dart';
import 'package:first_aid_app/widgets/warning_content.dart';
import 'package:first_aid_app/widgets/hint_content.dart';
import 'package:first_aid_app/widgets/numbered_list_content.dart';
import 'package:first_aid_app/widgets/image_content.dart';
import 'package:first_aid_app/widgets/cpr_timer_content.dart';

Widget _wrap(Widget child) => MaterialApp(home: Scaffold(body: child));

void main() {
  group('ContentBlockDispatcher', () {
    testWidgets('TextBlock renders TextContent', (tester) async {
      await tester.pumpWidget(_wrap(ContentBlockDispatcher(TextBlock('text'))));
      expect(find.byType(TextContent), findsOneWidget);
    });

    testWidgets('WarningBlock renders WarningContent', (tester) async {
      await tester.pumpWidget(_wrap(ContentBlockDispatcher(WarningBlock('warning'))));
      expect(find.byType(WarningContent), findsOneWidget);
    });

    testWidgets('HintBlock renders HintContent', (tester) async {
      await tester.pumpWidget(_wrap(ContentBlockDispatcher(HintBlock('hint'))));
      expect(find.byType(HintContent), findsOneWidget);
    });

    testWidgets('NumberedListBlock renders NumberedListContent', (tester) async {
      await tester.pumpWidget(_wrap(ContentBlockDispatcher(NumberedListBlock(['step 1', 'step 2']))));
      expect(find.byType(NumberedListContent), findsOneWidget);
    });

    testWidgets('ImageBlock renders ImageContent', (tester) async {
      await tester.pumpWidget(_wrap(ContentBlockDispatcher(ImageBlock('images/bleeding.png'))));
      expect(find.byType(ImageContent), findsOneWidget);
    });

    testWidgets('CPRTimerBlock renders CPRTimer', (tester) async {
      await tester.pumpWidget(_wrap(ContentBlockDispatcher(CPRTimerBlock(100, 30, 2, 1500))));
      expect(find.byType(CPRTimer), findsOneWidget);
    });
  });
}
