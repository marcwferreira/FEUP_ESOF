import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:gherkin/gherkin.dart';

StepDefinitionGeneric see() {

  return when1<String, FlutterWorld> (
    'I see {string}',
        (button, context) async {
        final locator = find.byValueKey(button);
        await FlutterDriverUtils.isPresent(context.world.driver, locator);
    },
  );
}