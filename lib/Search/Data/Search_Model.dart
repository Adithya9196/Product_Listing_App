import 'dart:convert';

List<SearchModel> searchModelFromJson(String str) => List<SearchModel>.from(json.decode(str).map((x) => SearchModel.fromJson(x)));

String searchModelToJson(List<SearchModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SearchModel {
  int id;
  List<dynamic> variations;
  bool inWishlist;
  int avgRating;
  List<String> images;
  bool variationExists;
  int salePrice;
  String name;
  String description;
  String caption;
  String featuredImage;
  int mrp;
  int stock;
  bool isActive;
  String discount;
  DateTime createdDate;
  String productType;
  dynamic showingOrder;
  String variationName;
  int category;
  int taxRate;

  SearchModel({
    required this.id,
    required this.variations,
    required this.inWishlist,
    required this.avgRating,
    required this.images,
    required this.variationExists,
    required this.salePrice,
    required this.name,
    required this.description,
    required this.caption,
    required this.featuredImage,
    required this.mrp,
    required this.stock,
    required this.isActive,
    required this.discount,
    required this.createdDate,
    required this.productType,
    required this.showingOrder,
    required this.variationName,
    required this.category,
    required this.taxRate,
  });

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
    id: json["id"],
    variations: List<dynamic>.from(json["variations"].map((x) => x)),
    inWishlist: json["in_wishlist"],
    avgRating: json["avg_rating"],
    images: List<String>.from(json["images"].map((x) => x)),
    variationExists: json["variation_exists"],
    salePrice: json["sale_price"],
    name: json["name"],
    description: json["description"],
    caption: json["caption"],
    featuredImage: json["featured_image"],
    mrp: json["mrp"],
    stock: json["stock"],
    isActive: json["is_active"],
    discount: json["discount"],
    createdDate: DateTime.parse(json["created_date"]),
    productType: json["product_type"],
    showingOrder: json["showing_order"],
    variationName: json["variation_name"],
    category: json["category"],
    taxRate: json["tax_rate"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "variations": List<dynamic>.from(variations.map((x) => x)),
    "in_wishlist": inWishlist,
    "avg_rating": avgRating,
    "images": List<dynamic>.from(images.map((x) => x)),
    "variation_exists": variationExists,
    "sale_price": salePrice,
    "name": name,
    "description": description,
    "caption": caption,
    "featured_image": featuredImage,
    "mrp": mrp,
    "stock": stock,
    "is_active": isActive,
    "discount": discount,
    "created_date": createdDate.toIso8601String(),
    "product_type": productType,
    "showing_order": showingOrder,
    "variation_name": variationName,
    "category": category,
    "tax_rate": taxRate,
  };
}
