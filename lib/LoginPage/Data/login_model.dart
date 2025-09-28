import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  Token token;
  String userId;
  String message;

  LoginModel({
    required this.token,
    required this.userId,
    required this.message,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    token: Token.fromJson(json["token"]),
    userId: json["user_id"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "token": token.toJson(),
    "user_id": userId,
    "message": message,
  };
}

class Token {
  String access;

  Token({
    required this.access,
  });

  factory Token.fromJson(Map<String, dynamic> json) => Token(
    access: json["access"],
  );

  Map<String, dynamic> toJson() => {
    "access": access,
  };
}
