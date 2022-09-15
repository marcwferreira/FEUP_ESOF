import 'dart:async';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';
import 'package:glob/glob.dart';
import 'package:uni/globals.dart';
import 'package:uni/utils/peopleApi.dart';
import 'steps/i_am_logged_in.dart';
import 'steps/i_wait_X_seconds.dart';
import 'steps/i_see_X.dart';
import 'steps/i_do_not_see_X.dart';

Future<void> main() async {

  isLogged = true;

  final config = FlutterTestConfiguration()
    ..features = [Glob(r"test_driver/features/search_people.feature")]
    ..reporters = [
      ProgressReporter(),
      TestRunSummaryReporter(),
      JsonReporter(path: './test_report.json')
    ]
    ..stepDefinitions = [LoggedIn(), waiting(), see(), notSee()]
    ..customStepParameterDefinitions = []
    ..restartAppBetweenScenarios = true
    ..targetAppPath = "test_driver/app.dart";
  return GherkinRunner().execute(config);
}