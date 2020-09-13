import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:software_client/src/models/information_model.dart';
import 'package:software_client/src/preferences/user_preferences.dart';

class InformationProvider {
  final String _url = 'https://pharmacyclient-287606.firebaseio.com/';
  final _preferences = new UserPreferences();

  Future<bool> createInformation(Information information) async {
    final url = '$_url/information.json?auth=${_preferences.token}';

    final response = await http.post(url, body: informationToJson(information));

    final decodedData = json.decode(response.body);

    print(decodedData);

    return true;
  }

  Future<List<Information>> getInformationList() async {
    final url = '$_url/information.json?auth=${_preferences.token}';

    final response = await http.get(url);

    final Map<String, dynamic> decodedData = json.decode(response.body);
    final List<Information> informationS = new List();

    if (decodedData == null) return [];

    decodedData.forEach((id, information) {
      final informationTemp = Information.fromJson(information);
      informationTemp.id = id;
      informationS.add(informationTemp);
    });

    return informationS;
  }

  Future<int> deleteInformation(String id) async {
    final url = '$_url/information/$id.json?auth=${_preferences.token}';

    final response = await http.delete(url);

    print(json.decode(response.body));

    return 1;
  }

  Future<bool> editClient(Information information) async {
    final url =
        '$_url/information/${information.id}.json?auth=${_preferences.token}';

    final response = await http.put(url, body: informationToJson(information));

    final decodedData = json.decode(response.body);

    print(decodedData);

    return true;
  }
}
