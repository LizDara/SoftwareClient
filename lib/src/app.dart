import 'package:flutter/material.dart';

import 'package:software_client/src/routes/routes.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: 'login',
        routes: getApplicationRoutes());
  }
}
