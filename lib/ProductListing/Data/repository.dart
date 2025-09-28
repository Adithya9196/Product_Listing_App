import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:product_listing_app/ProductListing/Data/List_Model.dart';


class ProductRepository {

  Future<List<Products>> fetchProducts() async {
    final response = await http.get(Uri.parse('http://skilltestflutter.zybotechlab.com/api/products/'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((e) => Products.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load products");
    }
  }
}
