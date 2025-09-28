import 'dart:convert';
import 'package:product_listing_app/Search/Data/Search_Model.dart';
import 'package:http/http.dart' as http;

class SearchRepository {
  Future<List<SearchModel>> searchProducts(String query) async {
    final url = 'http://skilltestflutter.zybotechlab.com/api/search/?query=$query';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((e) => SearchModel.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load products");
    }
  }
}
