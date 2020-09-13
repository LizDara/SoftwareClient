import 'package:flutter/material.dart';
import 'package:software_client/src/blocs/provider.dart';
import 'package:software_client/src/preferences/user_preferences.dart';
import 'package:software_client/src/routes/routes.dart';

class MyApp extends StatelessWidget {
  final preferences = new UserPreferences();

  @override
  Widget build(BuildContext context) {
    return Provider(
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: preferences.lastPage,
            routes: getApplicationRoutes()));
  }
}
