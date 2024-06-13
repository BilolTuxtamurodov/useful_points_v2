import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:usefulpoints/app.dart';
import 'package:usefulpoints/set_up.dart';

Future<void> main() async {
  await Future.delayed(const Duration(seconds: 3));
  FlutterNativeSplash.remove();
  await setup();
  runApp(const MyApp());
}

