import 'package:flutter/material.dart';
import 'package:software_client/src/pages/dialog_page.dart';
import 'package:software_client/src/pages/home_page.dart';
import 'package:software_client/src/pages/login_page.dart';
import 'package:software_client/src/pages/medical_history_page.dart';
import 'package:software_client/src/pages/register_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    'login': (BuildContext context) => LoginPage(),
    'register': (BuildContext context) => RegisterPage(),
    'medicalHistory': (BuildContext context) => MedicalHistoryPage(),
    'home': (BuildContext context) => HomePage(),
    'dialog': (BuildContext context) => DialogPage(),
  };
}
