import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String _baseUrl = "https://your-fastapi-url.com"; // Replace with deployed FastAPI URL

  static Future<double> predictCalories(Map<String, dynamic> inputData) async {
    final response = await http.post(
      Uri.parse("$_baseUrl/predict"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(inputData),
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return json['prediction'];
    } else {
      throw Exception("Failed to get prediction");
    }
  }
}