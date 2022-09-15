import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:mockito/mockito.dart';
import 'package:tuple/tuple.dart';
import 'package:uni/controller/networking/network_router.dart';
import 'package:uni/model/app_state.dart';
import 'package:uni/redux/action_creators.dart';
import 'package:uni/view/Widgets/multiDec_preview_pdf.dart';
import 'package:uni/view/Pages/multidec_page_view.dart';
import '../../../testable_widget.dart';


void main(){
//PDFViewerCachedFromUrl
  group('multideclaration', () {

    final multidecPage = MultiDecViewState();

    testWidgets('When given url to pdf', (WidgetTester tester) async {
      final widget = makeTestableWidget(
          child: multidecPage.getPDFPreview()
      );
      await tester.pumpWidget(widget);
      expect(find.byKey(Key("pdf_preview")), findsOneWidget);

    });

    testWidgets('Test if button exists', (WidgetTester tester) async {
      final widget = makeTestableWidget(
          child: multidecPage.getDownloadButton()
      );

      await tester.pumpWidget(widget);
      expect(
          find.byKey( Key("multiDec_download_button")), findsOneWidget);
      await tester.tap(find.byKey( Key("multiDec_download_button")));

    });

  });

}