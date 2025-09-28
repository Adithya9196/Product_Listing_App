// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
//
// class AuthRepository {
//
//   Future<String?> login(String phone) async {
//     final response = await http.post(
//       Uri.parse("http://skilltestflutter.zybotechlab.com/api/login-register/"),
//       body: {"phone_number": phone},
//     );
//
//     print("Login Response: ${response.statusCode} -> ${response.body}");
//
//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);
//       return data['token']; // user exists
//     } else {
//       return null; // user not found
//     }
//   }
//
//   Future<String> register(String phone, String name) async {
//     final response = await http.post(
//       Uri.parse("http://skilltestflutter.zybotechlab.com/api/login-register/"),
//       body: {"phone_number": phone, "first_name": name},
//     );
//
//     print("Register Response: ${response.statusCode} -> ${response.body}");
//
//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);
//       return data['token'];
//     } else {
//       throw Exception("Register failed: ${response.body}");
//     }
//   }
//
//   // Save token
//   Future<void> saveToken(String token) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString("auth_token", token);
//   }
//
//   // Get token
//   Future<String?> getToken() async {
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.getString("auth_token");
//   }
//
//   // Clear token
//   Future<void> clearToken() async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.remove("auth_token");
//   }
// }

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {
  final String baseUrl = "https://skilltestflutter.zybotechlab.com/api/login-register/";

  Future<String?> login(String phone) async {
    try {
      final response = await http.post(
        Uri.parse(baseUrl),
        body: {"phone_number": phone},
      );

      print("Login Response: ${response.statusCode} -> ${response.body}");

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['token'];
      } else if (response.statusCode == 404) {
        return null;
      } else {
        throw Exception("Login failed: ${response.body}");
      }
    } catch (e) {
      print("Login Exception: $e");
      return null;
    }
  }

  Future<String?> register(String phone, String name) async {
    try {
      final response = await http.post(
        Uri.parse(baseUrl),
        body: {"phone_number": phone, "first_name": name},
      );

      print("Register Response: ${response.statusCode} -> ${response.body}");

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['token']['access'];
      } else {
        print("Register failed: ${response.body}");
        return null;
      }
    } catch (e) {
      print("Register Exception: $e");
      return null;
    }
  }


  // Save token
  Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("auth_token", token);
  }

  // Get token
  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("auth_token");
  }

  // Clear token
  Future<void> clearToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove("auth_token");
  }

  // Helper: Login or register automatically
  Future<String?> loginOrRegister(String phone, {String? name}) async {
    String? token = await login(phone);
    if (token != null) {
      return token; // user exists
    }

    if (name != null) {
      token = await register(phone, name);
      return token; // newly registered
    }

    return null; // cannot register without name
  }
}
