import 'dart:convert';
import 'package:http/http.dart' as http;
import 'profile_model.dart';

class ProfileRepository {
  final String token;

  ProfileRepository({required this.token});

  Future<ProfileModel> fetchProfile() async {
    final response = await http.get(
      Uri.parse('https://skilltestflutter.zybotechlab.com/api/user-data/'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return profileModelFromJson(response.body);
    } else {
      throw Exception('Failed to load profile');
    }
  }
}
