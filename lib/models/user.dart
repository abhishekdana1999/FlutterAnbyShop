// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.useraddress,
    this.role,
    this.recentProducts,
    this.favProd,
    this.highResolutionImage,
    this.lowResolutionImage,
    this.id,
    this.phone,
    this.updatedAt,
    this.createdAt,
    this.v,
    this.cart,
    this.refer,
    this.lastOtpDetail,
    this.email,
    this.name,
    this.deviceDetail,
  });

  List<Useraddress> useraddress;
  String role;
  List<String> recentProducts;
  List<dynamic> favProd;
  List<dynamic> highResolutionImage;
  List<dynamic> lowResolutionImage;
  String id;
  String phone;
  DateTime updatedAt;
  DateTime createdAt;
  int v;
  Cart cart;
  Refer refer;
  dynamic lastOtpDetail;
  String email;
  String name;
  DeviceDetail deviceDetail;

  factory User.fromJson(Map<String, dynamic> json) => User(
        useraddress: List<Useraddress>.from(
            json["useraddress"].map((x) => Useraddress.fromJson(x))),
        role: json["role"],
        recentProducts: List<String>.from(
            json["recentProducts"].map((x) => x == null ? null : x)),
        favProd: List<dynamic>.from(json["favProd"].map((x) => x)),
        highResolutionImage:
            List<dynamic>.from(json["highResolutionImage"].map((x) => x)),
        lowResolutionImage:
            List<dynamic>.from(json["lowResolutionImage"].map((x) => x)),
        id: json["_id"],
        phone: json["phone"],
        updatedAt: DateTime.parse(json["updatedAt"]),
        createdAt: DateTime.parse(json["createdAt"]),
        v: json["__v"],
        cart: Cart.fromJson(json["cart"]),
        refer: Refer.fromJson(json["refer"]),
        lastOtpDetail: json["lastOtpDetail"],
        email: json["email"],
        name: json["name"],
        deviceDetail: DeviceDetail.fromJson(json["deviceDetail"]),
      );

  Map<String, dynamic> toJson() => {
        "useraddress": List<dynamic>.from(useraddress.map((x) => x.toJson())),
        "role": role,
        "recentProducts":
            List<dynamic>.from(recentProducts.map((x) => x == null ? null : x)),
        "favProd": List<dynamic>.from(favProd.map((x) => x)),
        "highResolutionImage":
            List<dynamic>.from(highResolutionImage.map((x) => x)),
        "lowResolutionImage":
            List<dynamic>.from(lowResolutionImage.map((x) => x)),
        "_id": id,
        "phone": phone,
        "updatedAt": updatedAt.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
        "__v": v,
        "cart": cart.toJson(),
        "refer": refer.toJson(),
        "lastOtpDetail": lastOtpDetail,
        "email": email,
        "name": name,
        "deviceDetail": deviceDetail.toJson(),
      };
}

class Cart {
  Cart({
    this.discountCode,
    this.products,
    this.user,
  });

  String discountCode;
  List<CartProduct> products;
  String user;

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        discountCode: json["discountCode"],
        products: List<CartProduct>.from(
            json["products"].map((x) => CartProduct.fromJson(x))),
        user: json["user"],
      );

  Map<String, dynamic> toJson() => {
        "discountCode": discountCode,
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
        "user": user,
      };
}

class CartProduct {
  int qty;

  CartProduct(
      {this.id,
      this.productName,
      this.productBrand,
      this.productVariant,
      this.productCategory,
      this.productSubCategory,
      this.productClassification,
      this.productImage,
      this.productDealer,
      this.tax,
      this.qty});

  String id;
  String productName;
  String productBrand;
  List<ProductVariant> productVariant;
  String productCategory;
  String productSubCategory;
  String productClassification;
  ProductImage productImage;
  String productDealer;
  List<dynamic> tax;

  factory CartProduct.fromJson(Map<String, dynamic> json) => CartProduct(
        id: json["id"],
        productName: json["productName"],
        productBrand: json["productBrand"],
        productVariant: List<ProductVariant>.from(
            json["productVariant"].map((x) => ProductVariant.fromJson(x))),
        productCategory: json["productCategory"],
        productSubCategory: json["productSubCategory"],
        productClassification: json["productClassification"],
        productImage: ProductImage.fromJson(json["productImage"]),
        productDealer: json["productDealer"],
        tax: List<dynamic>.from(json["tax"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "productName": productName,
        "productBrand": productBrand,
        "productVariant":
            List<dynamic>.from(productVariant.map((x) => x.toJson())),
        "productCategory": productCategory,
        "productSubCategory": productSubCategory,
        "productClassification": productClassification,
        "productImage": productImage.toJson(),
        "productDealer": productDealer,
        "tax": List<dynamic>.from(tax.map((x) => x)),
      };
}

class ProductImage {
  ProductImage({
    this.bucketName,
    this.url,
  });

  String bucketName;
  String url;

  factory ProductImage.fromJson(Map<String, dynamic> json) => ProductImage(
        bucketName: json["bucketName"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "bucketName": bucketName,
        "url": url,
      };
}

class ProductVariant {
  ProductVariant({
    this.images,
    this.type,
    this.value,
    this.sellingPrice,
    this.stock,
    this.id,
    this.price,
    this.qty,
  });

  List<dynamic> images;
  String type;
  String value;
  double sellingPrice;
  Stock stock;
  String id;
  int price;
  int qty;

  factory ProductVariant.fromJson(Map<String, dynamic> json) => ProductVariant(
        images: List<dynamic>.from(json["images"].map((x) => x)),
        type: json["type"],
        value: json["value"],
        sellingPrice: json["sellingPrice"].toDouble(),
        stock: Stock.fromJson(json["stock"]),
        id: json["id"],
        price: json["price"],
        qty: json["qty"],
      );

  Map<String, dynamic> toJson() => {
        "images": List<dynamic>.from(images.map((x) => x)),
        "type": type,
        "value": value,
        "sellingPrice": sellingPrice,
        "stock": stock.toJson(),
        "id": id,
        "price": price,
        "qty": qty,
      };
}

class Stock {
  Stock({
    this.totalQty,
  });

  int totalQty;

  factory Stock.fromJson(Map<String, dynamic> json) => Stock(
        totalQty: json["totalQty"],
      );

  Map<String, dynamic> toJson() => {
        "totalQty": totalQty,
      };
}

class DeviceDetail {
  DeviceDetail({
    this.deviceToken,
    this.platform,
  });

  String deviceToken;
  String platform;

  factory DeviceDetail.fromJson(Map<String, dynamic> json) => DeviceDetail(
        deviceToken: json["deviceToken"],
        platform: json["platform"],
      );

  Map<String, dynamic> toJson() => {
        "deviceToken": deviceToken,
        "platform": platform,
      };
}

class Refer {
  Refer({
    this.referCode,
  });

  String referCode;

  factory Refer.fromJson(Map<String, dynamic> json) => Refer(
        referCode: json["referCode"],
      );

  Map<String, dynamic> toJson() => {
        "referCode": referCode,
      };
}

class Useraddress {
  Useraddress({
    this.addressLine1,
    this.buildingName,
    this.city,
    this.landMark,
    this.pincode,
    this.roomNo,
    this.state,
    this.isDefault,
    this.addressName,
    this.district,
  });

  String addressLine1;
  String buildingName;
  String city;
  String landMark;
  int pincode;
  String roomNo;
  String state;
  bool isDefault;
  String addressName;
  String district;

  factory Useraddress.fromJson(Map<String, dynamic> json) => Useraddress(
        addressLine1: json["addressLine1"],
        buildingName: json["buildingName"],
        city: json["city"],
        landMark: json["landMark"],
        pincode: json["pincode"],
        roomNo: json["roomNo"],
        state: json["state"],
        isDefault: json["isDefault"],
        addressName: json["addressName"],
        district: json["district"],
      );

  Map<String, dynamic> toJson() => {
        "addressLine1": addressLine1,
        "buildingName": buildingName,
        "city": city,
        "landMark": landMark,
        "pincode": pincode,
        "roomNo": roomNo,
        "state": state,
        "isDefault": isDefault,
        "addressName": addressName,
        "district": district,
      };
}
