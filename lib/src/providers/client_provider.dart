import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:software_client/src/models/client_model.dart';
import 'package:software_client/src/preferences/user_preferences.dart';

class ClientProvider {
  final String _url = 'https://pharmacyclient-287606.firebaseio.com/';
  final _preferences = new UserPreferences();

  Future<bool> createClient(Client client) async {
    final url = '$_url/client.json?auth=${_preferences.token}';

    final response = await http.post(url, body: clientToJson(client));

    final decodedData = json.decode(response.body);

    print(decodedData);

    return true;
  }

  Future<List<Client>> getClientList() async {
    final url = '$_url/client.json?auth=${_preferences.token}';

    final response = await http.get(url);

    final Map<String, dynamic> decodedData = json.decode(response.body);
    final List<Client> clients = new List();

    if (decodedData == null) return [];

    decodedData.forEach((id, client) {
      final clientTemp = Client.fromJson(client);
      clientTemp.id = id;
      clients.add(clientTemp);
    });

    return clients;
  }

  Future<int> deleteClient(String id) async {
    final url = '$_url/client/$id.json?auth=${_preferences.token}';

    final response = await http.delete(url);

    print(json.decode(response.body));

    return 1;
  }

  Future<bool> editClient(Client client) async {
    final url = '$_url/client/${client.id}.json?auth=${_preferences.token}';

    final response = await http.put(url, body: clientToJson(client));

    final decodedData = json.decode(response.body);

    print(decodedData);

    return true;
  }
}
