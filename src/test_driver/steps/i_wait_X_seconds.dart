import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';
import 'dart:io';

StepDefinitionGeneric waiting() {
  return when1<int, FlutterWorld> (
    'I wait {int} seconds',
        (counter, context) async {
          sleep(Duration(seconds: counter));
    },
  );
}