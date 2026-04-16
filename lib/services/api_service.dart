import 'dart:convert';
import 'package:flutter/foundation.dart'; // Add this for debugPrint
import 'package:http/http.dart' as http;
import '../models/song_model.dart';

class ApiService {
  // Use http://10.0.2.2 if using the standard Android Emulator
  // Use http://spotify.test if testing on Desktop/Ubuntu
  static const String baseUrl = "http://spotify.test"; 

  // --- FETCH SONGS ---
  static Future<List<Song>> fetchSongs() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/read.php'));
      
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        
        if (responseData['success'] == 1) {
          List songsList = responseData['data'];
          return songsList.map((item) => Song.fromJson(item)).toList();
        }
      }
      return [];
    } catch (e) {
      debugPrint("Error fetching songs: $e");
      return []; 
    }
  }

  // --- LOGIN ---
  static Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/login.php'),
        body: {
          "email": email,
          "password": password,
        },
      );
      
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        return {"code": 0, "message": "Server Error: ${response.statusCode}"};
      }
    } catch (e) {
      return {"code": 0, "message": "Connection Error: $e"};
    }
  }

  // --- SIGN UP ---
  static Future<Map<String, dynamic>> signUp(String name, String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/signup.php'),
        body: {
          "name": name,
          "email": email,
          "password": password,
        },
      );
      
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        return {"code": 0, "message": "Server Error: ${response.statusCode}"};
      }
    } catch (e) {
      return {"code": 0, "message": "Connection Error: $e"};
    }
  }
}