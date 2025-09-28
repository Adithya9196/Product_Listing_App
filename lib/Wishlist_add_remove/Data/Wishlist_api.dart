import 'dart:convert';
import 'package:http/http.dart' as http;
import 'wishlist_model.dart';

class WishlistRepository {
  final String token;

  WishlistRepository(this.token);

  Future<WishlistModel> toggleWishlist(int productId) async {
    final response = await http.post(
      Uri.parse("https://skilltestflutter.zybotechlab.com/api/add-remove-wishlist/"),
      headers: {
        "Authorization": "Bearer $token",
        "Accept": "application/json",
      },
      body: {"product_id": productId.toString()},
    );

    if (response.statusCode == 200) {
      return wishlistModelFromJson(response.body);
    } else {
      throw Exception("Failed to update wishlist: ${response.body}");
    }
  }


  Future<List<int>> fetchWishlist() async {
    final response = await http.get(
      Uri.parse("https://skilltestflutter.zybotechlab.com/api/wishlist/"), // adjust if different
      headers: {
        "Authorization": "Bearer $token",
        "Content-Type": "application/json",
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      return List<int>.from(data["wishlist"].map((e) => e["id"]));
    } else {
      throw Exception("Failed to load wishlist: ${response.body}");
    }
  }
}
