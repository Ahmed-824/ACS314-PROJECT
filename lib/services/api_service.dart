import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/song_model.dart';

class ApiService {
  static const String baseUrl = "http://10.0.2.2/api"; // Android Emulator Localhost

  static Future<List<Song>> fetchSongs() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/get_songs.php'));
      if (response.statusCode == 200) {
        List data = json.decode(response.body);
        return data.map((item) => Song.fromJson(item)).toList();
      }
      return [];
    } catch (e) {
      return []; // Return empty list on error
    }
  }

  static Future<Map<String, dynamic>> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login.php'),
      body: {"email": email, "password": password},
    );
    return json.decode(response.body);
  }
}