import 'dart:convert';
import 'package:product_listing_app/Search/Data/Search_Model.dart';
import 'package:http/http.dart' as http;
import 'package:product_listing_app/Slider/Data/SliderModel.dart';

class BannerRepository {
  Future<List<SliderModel>> bannerList() async {
    final url = 'http://skilltestflutter.zybotechlab.com/api/banners/';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((e) => SliderModel.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load products");
    }
  }
}
