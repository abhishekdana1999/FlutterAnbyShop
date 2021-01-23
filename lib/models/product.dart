// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

List<Product> productFromJson(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  Product({
    this.tax,
    this.productExtraInfo,
    this.reviews,
    this.images,
    this.id,
    this.variants,
    this.productSubCategory,
    this.productDetailSubCategory,
    this.discount,
    this.productCategory,
    this.productBrand,
    this.productClassification,
    this.productName,
    this.productExtraInfoExits,
    this.productDealer,
  });

  List<dynamic> tax;
  List<dynamic> productExtraInfo;
  List<Review> reviews;
  List<Image> images;
  String id;
  List<Variant> variants;
  String productSubCategory;
  ProductDetailSubCategory productDetailSubCategory;
  double discount;
  String productCategory;
  String productBrand;
  String productClassification;
  String productName;
  bool productExtraInfoExits;
  ProductDealer productDealer;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        tax: List<dynamic>.from(json["tax"].map((x) => x)),
        productExtraInfo:
            List<dynamic>.from(json["productExtraInfo"].map((x) => x)),
        reviews:
            List<Review>.from(json["reviews"].map((x) => Review.fromJson(x))),
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        id: json["_id"],
        variants: List<Variant>.from(
            json["variants"].map((x) => Variant.fromJson(x))),
        productSubCategory: json["productSubCategory"],
        productDetailSubCategory: productDetailSubCategoryValues
            .map[json["productDetailSubCategory"]],
        discount: json["discount"].toDouble(),
        productCategory: json["productCategory"],
        productBrand: json["productBrand"],
        productClassification: json["productClassification"],
        productName: json["productName"],
        productExtraInfoExits: json["productExtraInfoExits"],
        productDealer: productDealerValues.map[json["productDealer"]],
      );

  Map<String, dynamic> toJson() => {
        "tax": List<dynamic>.from(tax.map((x) => x)),
        "productExtraInfo": List<dynamic>.from(productExtraInfo.map((x) => x)),
        "reviews": List<dynamic>.from(reviews.map((x) => x.toJson())),
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "_id": id,
        "variants": List<dynamic>.from(variants.map((x) => x.toJson())),
        "productSubCategory": productSubCategory,
        "productDetailSubCategory":
            productDetailSubCategoryValues.reverse[productDetailSubCategory],
        "discount": discount,
        "productCategory": productCategory,
        "productBrand": productBrand,
        "productClassification": productClassification,
        "productName": productName,
        "productExtraInfoExits": productExtraInfoExits,
        "productDealer": productDealerValues.reverse[productDealer],
      };
}

class Image {
  Image({
    this.bucketName,
    this.url,
  });

  BucketName bucketName;
  String url;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        bucketName: bucketNameValues.map[json["bucketName"]],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "bucketName": bucketNameValues.reverse[bucketName],
        "url": url,
      };
}

enum BucketName { SOFTIMPRESSION }

final bucketNameValues =
    EnumValues({"softimpression": BucketName.SOFTIMPRESSION});

enum ProductDealer { SHITAL_PRASAD_MUKANDI_LAL_JAIN }

final productDealerValues = EnumValues({
  "Shital Prasad Mukandi Lal Jain": ProductDealer.SHITAL_PRASAD_MUKANDI_LAL_JAIN
});

enum ProductDetailSubCategory { BASMATI_RICE, EMPTY }

final productDetailSubCategoryValues = EnumValues({
  "Basmati Rice": ProductDetailSubCategory.BASMATI_RICE,
  "": ProductDetailSubCategory.EMPTY
});

class Review {
  Review({
    this.name,
    this.email,
    this.phone,
    this.message,
    this.rate,
    this.date,
  });

  String name;
  String email;
  String phone;
  String message;
  int rate;
  int date;

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        message: json["message"],
        rate: json["rate"],
        date: json["date"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "phone": phone,
        "message": message,
        "rate": rate,
        "date": date,
      };
}

class Variant {
  Variant({
    this.images,
    this.type,
    this.value,
    this.sellingPrice,
    this.stock,
    this.id,
    this.price,
  });

  List<dynamic> images;
  Type type;
  String value;
  double sellingPrice;
  Stock stock;
  String id;
  dynamic price;

  factory Variant.fromJson(Map<String, dynamic> json) => Variant(
        images: List<dynamic>.from(json["images"].map((x) => x)),
        type: typeValues.map[json["type"]],
        value: json["value"],
        sellingPrice: json["sellingPrice"].toDouble(),
        stock: Stock.fromJson(json["stock"]),
        id: json["id"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "images": List<dynamic>.from(images.map((x) => x)),
        "type": typeValues.reverse[type],
        "value": value,
        "sellingPrice": sellingPrice,
        "stock": stock.toJson(),
        "id": id,
        "price": price,
      };
}

class Stock {
  Stock({
    this.totalQty,
  });

  dynamic totalQty;

  factory Stock.fromJson(Map<String, dynamic> json) => Stock(
        totalQty: json["totalQty"],
      );

  Map<String, dynamic> toJson() => {
        "totalQty": totalQty,
      };
}

enum Type { SIZE }

final typeValues = EnumValues({"Size": Type.SIZE});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
