import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:software_client/src/preferences/user_preferences.dart';

class UserProvider {
  final String _firebaseToken = 'AIzaSyC97iwftCX3xQnwzdNA_C5rYVpluM2xykY';
  final _preferences = new UserPreferences();

  Future<Map<String, dynamic>> createUser(String email, String password) async {
    final authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true
    };

    final response = await http.post(
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$_firebaseToken',
        body: json.encode(authData));

    Map<String, dynamic> decodedData = json.decode(response.body);

    print(decodedData);

    if (decodedData.containsKey('idToken')) {
      _preferences.token = decodedData['idToken'];
      _preferences.lastPage = 'home';
      return {'ok': true};
    } else {
      return {'ok': false};
    }
  }

  Future<Map<String, dynamic>> login(String email, String password) async {
    final authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true
    };

    final response = await http.post(
        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$_firebaseToken',
        body: json.encode(authData));

    Map<String, dynamic> decodedData = json.decode(response.body);

    print(decodedData);

    if (decodedData.containsKey('idToken')) {
      _preferences.token = decodedData['idToken'];
      _preferences.lastPage = 'home';
      return {'ok': true};
    } else {
      return {'ok': false};
    }
  }
}
