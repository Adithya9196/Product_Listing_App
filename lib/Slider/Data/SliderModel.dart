
import 'dart:convert';

List<SliderModel> sliderModelFromJson(String str) => List<SliderModel>.from(json.decode(str).map((x) => SliderModel.fromJson(x)));

String sliderModelToJson(List<SliderModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SliderModel {
  int id;
  Product? product;
  Category? category;
  String name;
  String image;
  int showingOrder;

  SliderModel({
    required this.id,
    required this.product,
    required this.category,
    required this.name,
    required this.image,
    required this.showingOrder,
  });

  factory SliderModel.fromJson(Map<String, dynamic> json) => SliderModel(
    id: json["id"],
    product: json["product"] == null ? null : Product.fromJson(json["product"]),
    category: json["category"] == null ? null : Category.fromJson(json["category"]),
    name: json["name"],
    image: json["image"],
    showingOrder: json["showing_order"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "product": product?.toJson(),
    "category": category?.toJson(),
    "name": name,
    "image": image,
    "showing_order": showingOrder,
  };
}

class Category {
  int id;
  String name;
  String image;
  bool isActive;
  int showingOrder;
  String slug;
  List<Product> products;
  dynamic hexcode1;
  dynamic hexcode2;

  Category({
    required this.id,
    required this.name,
    required this.image,
    required this.isActive,
    required this.showingOrder,
    required this.slug,
    required this.products,
    required this.hexcode1,
    required this.hexcode2,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    name: json["name"],
    image: json["image"],
    isActive: json["is_active"],
    showingOrder: json["showing_order"],
    slug: json["slug"],
    products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
    hexcode1: json["hexcode_1"],
    hexcode2: json["hexcode_2"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
    "is_active": isActive,
    "showing_order": showingOrder,
    "slug": slug,
    "products": List<dynamic>.from(products.map((x) => x.toJson())),
    "hexcode_1": hexcode1,
    "hexcode_2": hexcode2,
  };
}

class Product {
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

  Product({
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

  factory Product.fromJson(Map<String, dynamic> json) => Product(
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
