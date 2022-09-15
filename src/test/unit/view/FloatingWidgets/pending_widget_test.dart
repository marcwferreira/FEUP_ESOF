import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:uni/controller/profile_info/profile_info_database.dart';

import 'package:uni/view/FloatingWidgets/pending_widget.dart';
import '../../../testable_widget.dart';

void main() {
  group('PendingPopup', () {
    testWidgets('Pending Widget test', (WidgetTester tester) async {
        ProfileAttribute pAttribute = ProfileAttribute('TestType', 'TestAttribute', 'TestValueOld');
        pAttribute.changeTo('TestValueNew');
        final widget = makeTestableWidget(
          child: PendingAlterationWindow(pAttribute));

        await tester.pumpWidget(widget);

        expect(find.byKey(Key('pending_window_popup')),findsOneWidget);
        expect(find.byKey(Key('pending_window_atributo_row')),findsOneWidget);
        expect(find.byKey(Key('pending_window_mudarValor_row')),findsOneWidget);
        expect(find.byKey(Key('pending_window_novoValor_row')),findsOneWidget);
        expect(find.byKey(Key('pending_window_estado_row')),findsOneWidget);
        expect(find.byKey(Key('pending_window_cancel_button')),findsOneWidget);
        expect(find.byKey(Key('pending_window_return_button')),findsOneWidget);
    });
  });
}

