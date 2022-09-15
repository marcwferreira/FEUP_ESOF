import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:mockito/mockito.dart';
import 'package:uni/view/Pages/profile_page_view.dart';
import 'package:uni/view/Pages/home_page_view.dart';
import 'package:uni/view/Widgets/profile_info_preview_card.dart';
import 'package:uni/view/Pages/profile_page_view.dart';
import '../../../testable_widget.dart';
import 'package:uni/model/entities/course.dart';

class MockBuildContext extends Mock implements BuildContext {}

void main(){

    group('ProfileInfoPage', () {

      MockBuildContext _mockContext;

      final name = 'Joao Aluno';
      final email = 'joaoAluno@gmail.com';
      final Map<String, String> currentState = null;
      final List<Course> courses = [];

      ProfilePageViewState profilePage;

      setUp(() {
        profilePage = ProfilePageViewState(name: name, email: email, currentState: currentState, courses: courses);
        _mockContext = MockBuildContext();
      });
        
      testWidgets('Test information card was loaded', (WidgetTester tester) async {

        final widget = makeTestableWidget(
              child: profilePage.getProfilePreview()
        );

        await tester.pumpWidget(widget);
        expect(find.byKey(Key('dados_preview_card')),findsOneWidget);
        expect(find.byKey(Key('profile_info_Nome:_row')), findsOneWidget);
        expect(find.byKey(Key('profile_info_Sexo:_row')), findsOneWidget);
        expect(find.byKey(Key('profile_info_Data de nascimento:_row')), findsOneWidget);

      });

    });
}
