import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:product_listing_app/Show_wishlist/Data/show_wishlist_model.dart';

class ShowWishlistRepository {
  final String baseUrl = "https://skilltestflutter.zybotechlab.com/api/wishlist/";

  Future<String?> _getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("auth_token"); // token should be saved after login
  }

  Future<List<ShowWishlistModel>> fetchWishlist() async {
    final token = await _getToken();

    final response = await http.get(
      Uri.parse(baseUrl),
      headers: {
        "Authorization": "Bearer $token",
        "Content-Type": "application/json",
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((e) => ShowWishlistModel.fromJson(e)).toList();
    } else {
      throw Exception("Failed to fetch wishlist (Error ${response.statusCode})");
    }
  }
}
