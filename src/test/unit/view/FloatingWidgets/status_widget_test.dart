import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:uni/controller/profile_info/profile_info_database.dart';

import 'package:uni/view/FloatingWidgets/status_window.dart';
import '../../../testable_widget.dart';

void main() {
  group('StatusPopup', () {
    testWidgets('Status Widget test', (WidgetTester tester) async {
        ProfileAttribute pAttribute = ProfileAttribute('TestType', 'TestAttribute', 'TestValueOld');
        pAttribute.changeTo('TestValueNew');
        pAttribute.acceptAlteration();
        final widget = makeTestableWidget(
          child: StatusAlterationWindow(pAttribute));

        await tester.pumpWidget(widget);

        expect(find.byKey(Key('alteration_window_popup')),findsOneWidget);
        expect(find.byKey(Key('alteration_window_atributo_row')),findsOneWidget);
        expect(find.byKey(Key('alteration_window_mudarValor_row')),findsOneWidget);
        expect(find.byKey(Key('alteration_window_novoValor_row')),findsOneWidget);
        expect(find.byKey(Key('alteration_window_estado_row')),findsOneWidget);
        expect(find.byKey(Key('alteration_window_dismiss_button')),findsOneWidget);
    });
  });
}

