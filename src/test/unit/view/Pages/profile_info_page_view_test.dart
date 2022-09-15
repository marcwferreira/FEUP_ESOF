import 'dart:async';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:mockito/mockito.dart';
import 'package:tuple/tuple.dart';
import 'package:uni/controller/networking/network_router.dart';
import 'package:uni/model/app_state.dart';
import 'package:uni/redux/action_creators.dart';
import 'package:uni/view/Pages/profile_info_page_view.dart';

import 'package:flutter/material.dart';
import '../../../testable_widget.dart';

class MockBuildContext extends Mock implements BuildContext {}

void main(){

  group('Basic info card tests', () {

    MockBuildContext _mockContext;

    final name = 'Joao Aluno';
    final email = 'joaoAluno@gmail.com';

    ProfilePageInfoViewState profilePage;

    setUp(() {
      profilePage = ProfilePageInfoViewState(name: name, email: email);
      _mockContext = MockBuildContext();
    });

    testWidgets('Test if basic info card loaded', (WidgetTester tester) async {

      final widget = makeTestableWidget(
            child: profilePage.getBodyMock(1)
      );

      await tester.pumpWidget(widget);
      expect(find.byKey(Key('profile_info_basic')),findsOneWidget);

      expect(find.byKey(Key('profile_info_Nome_row')), findsOneWidget);

      expect(find.byKey(Key('profile_info_Sexo_row')), findsOneWidget);

      expect(find.byKey(Key('profile_info_Data de Nascimento_row')), findsOneWidget);

      expect(find.byKey(Key('profile_info_Estado civil_row')), findsOneWidget);

      expect(find.byKey(Key('profile_info_Nome do pai_row')), findsOneWidget);

      expect(find.byKey(Key('profile_info_Nome da mãe_row')), findsOneWidget);

    });

  });

  group('Nationality card tests', () {

    MockBuildContext _mockContext;

    final name = 'Joao Aluno';
    final email = 'joaoAluno@gmail.com';

    ProfilePageInfoViewState profilePage;

    setUp(() {
      profilePage = ProfilePageInfoViewState(name: name, email: email);
      _mockContext = MockBuildContext();
    });

    testWidgets('Test if nacionality card loaded', (WidgetTester tester) async {

      final widget = makeTestableWidget(
          child: profilePage.getBodyMock(2)
      );

      await tester.pumpWidget(widget);
      expect(find.byKey(Key('profile_info_nationality')),findsOneWidget);

      expect(find.byKey(Key('profile_info_1_row')), findsOneWidget);

    });

  });

  group('Documents card tests', () {

    MockBuildContext _mockContext;

    final name = 'Joao Aluno';
    final email = 'joaoAluno@gmail.com';

    ProfilePageInfoViewState profilePage;

    setUp(() {
      profilePage = ProfilePageInfoViewState(name: name, email: email);
      _mockContext = MockBuildContext();
    });

    testWidgets('Test if documents card loaded', (WidgetTester tester) async {

      final widget = makeTestableWidget(
          child: profilePage.getBodyMock(3)
      );

      await tester.pumpWidget(widget);
      expect(find.byKey(Key('profile_info_documents')),findsOneWidget);

    });

  });

  group('Contacts card tests', () {

    MockBuildContext _mockContext;

    final name = 'Joao Aluno';
    final email = 'joaoAluno@gmail.com';

    ProfilePageInfoViewState profilePage;

    setUp(() {
      profilePage = ProfilePageInfoViewState(name: name, email: email);
      _mockContext = MockBuildContext();
    });

    testWidgets('Test if contacts card loaded', (WidgetTester tester) async {

      final widget = makeTestableWidget(
          child: profilePage.getBodyMock(4)
      );

      await tester.pumpWidget(widget);
      expect(find.byKey(Key('profile_info_contacts')),findsOneWidget);
      expect(find.byKey(Key('profile_info_Telemóvel_row')),findsOneWidget);
      expect(find.byKey(Key('profile_info_Email_row')),findsOneWidget);
    });

  });

  group('Addresses card tests', () {

    MockBuildContext _mockContext;

    final name = 'Joao Aluno';
    final email = 'joaoAluno@gmail.com';

    ProfilePageInfoViewState profilePage;

    setUp(() {
      profilePage = ProfilePageInfoViewState(name: name, email: email);
      _mockContext = MockBuildContext();
    });

    testWidgets('Test if addresses card loaded', (WidgetTester tester) async {

      final widget = makeTestableWidget(
          child: profilePage.getBodyMock(5)
      );

      await tester.pumpWidget(widget);
      expect(find.byKey(Key('profile_info_address')),findsOneWidget);
      expect(find.byKey(Key('profile_info_Residência oficial_row')), findsOneWidget);
      expect(find.byKey(Key('profile_info_Residência em tempo de aulas_row')), findsOneWidget);
    });

  });

}