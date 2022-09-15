import 'dart:async';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:uni/main.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_driver/driver_extension.dart';
import 'package:uni/globals.dart';
import 'package:uni/utils/peopleApi.dart';

void main() async {
  enableFlutterDriverExtension();
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterDownloader.initialize();
  runApp(MyApp());
}