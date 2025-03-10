import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConfig {
  static String apiUrl = dotenv.env['API_URL'] ?? 'https://default-api.com';
}
