import 'package:http/http.dart' as http;
import 'dart:convert';
import '../config.dart';  // Importer le fichier de config

class ApiService {
  static Future<Map<String, dynamic>> fetchData() async {
    final response = await http.get(Uri.parse('${AppConfig.apiUrl}/endpoint'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Échec du chargement des données');
    }
  }
}
