import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:gherkin/gherkin.dart';

StepDefinitionGeneric notSee() {

  return when1<String, FlutterWorld> (
    'I do not see {string}',
        (button, context) async {
        final locator = find.byValueKey(button);
        await FlutterDriverUtils.isAbsent(context.world.driver, locator);
    },
  );
}