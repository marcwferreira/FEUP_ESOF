import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:uni/controller/profile_info/profile_info_database.dart';
import 'package:uni/view/FloatingWidgets/edit_profile.dart';

import 'package:uni/view/FloatingWidgets/pending_widget.dart';
import '../../../testable_widget.dart';

void main() {
    group('EditProfile', () {
        testWidgets('Pending Widget test', (WidgetTester tester) async {
            ProfileAttribute pAttribute = ProfileAttribute('TestType', 'TestAttribute', 'TestValueOld');
            pAttribute.changeTo('TestValueNew');
            final widget = makeTestableWidget(
                child: EditProfileWindow('TestTitle', pAttribute)
            );

            await tester.pumpWidget(widget);

            expect(find.byKey(Key('edit_window_popup')),findsOneWidget);
            expect(find.byKey(Key('edit_window_title')),findsOneWidget);
            expect(find.byKey(Key('edit_window_attribute_title')),findsOneWidget);
            expect(find.byKey(Key('edit_window_form')),findsOneWidget);
            expect(find.byKey(Key('edit_window_form_text')),findsOneWidget);
            expect(find.byKey(Key('edit_window_cancel_button')),findsOneWidget);
            expect(find.byKey(Key('edit_window_save_button')),findsOneWidget);
        });
    });

    group('AddNationality', () {
        testWidgets('Pending Widget test', (WidgetTester tester) async {
            final widget = makeTestableWidget(
            child: AddNationalityWindow('TestTitle'));

            await tester.pumpWidget(widget);

            expect(find.byKey(Key('addNat_window_popup')),findsOneWidget);
            expect(find.byKey(Key('addNat_window_title')),findsOneWidget);
            expect(find.byKey(Key('addNat_window_attribute_title')),findsOneWidget);
            expect(find.byKey(Key('addNat_window_form')),findsOneWidget);
            expect(find.byKey(Key('addNat_window_form_text')),findsOneWidget);
            expect(find.byKey(Key('addNat_window_cancel_button')),findsOneWidget);
            expect(find.byKey(Key('addNat_window_save_button')),findsOneWidget);
        });
    });
}

