import 'package:flutter/material.dart';
import 'package:software_client/src/app.dart';
import 'package:software_client/src/preferences/user_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final preferences = new UserPreferences();
  await preferences.initPreferences();

  runApp(MyApp());
}
