// To parse this JSON data, do
//
//     final checkout = checkoutFromJson(jsonString);

import 'dart:convert';

Checkout checkoutFromJson(String str) => Checkout.fromJson(json.decode(str));

String checkoutToJson(Checkout data) => json.encode(data.toJson());

class Checkout {
  Checkout({
    this.billingAddress,
    this.shippingAddress,
    this.user,
    this.products,
    this.priceDetail,
  });

  IngAddress billingAddress;
  IngAddress shippingAddress;
  String user;
  List<Product> products;
  PriceDetail priceDetail;

  factory Checkout.fromJson(Map<String, dynamic> json) => Checkout(
        billingAddress: IngAddress.fromJson(json["billingAddress"]),
        shippingAddress: IngAddress.fromJson(json["shippingAddress"]),
        user: json["user"],
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
        priceDetail: PriceDetail.fromJson(json["priceDetail"]),
      );

  Map<String, dynamic> toJson() => {
        "billingAddress": billingAddress.toJson(),
        "shippingAddress": shippingAddress.toJson(),
        "user": user,
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
        "priceDetail": priceDetail.toJson(),
      };
}

class IngAddress {
  IngAddress({
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

  factory IngAddress.fromJson(Map<String, dynamic> json) => IngAddress(
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

class PriceDetail {
  PriceDetail({
    this.netAmount,
    this.taxAmount,
    this.totalAmount,
    this.deliveryCharge,
  });

  double netAmount;
  int taxAmount;
  double totalAmount;
  int deliveryCharge;

  factory PriceDetail.fromJson(Map<String, dynamic> json) => PriceDetail(
        netAmount: json["NetAmount"].toDouble(),
        taxAmount: json["TaxAmount"],
        totalAmount: json["TotalAmount"].toDouble(),
        deliveryCharge: json["deliveryCharge"],
      );

  Map<String, dynamic> toJson() => {
        "NetAmount": netAmount,
        "TaxAmount": taxAmount,
        "TotalAmount": totalAmount,
        "deliveryCharge": deliveryCharge,
      };
}

class Product {
  Product({
    this.id,
    this.productName,
    this.productBrand,
    this.productVariant,
    this.productCategory,
    this.productSubCategory,
    this.productClassification,
    this.productImage,
    this.productDealer,
    this.tax,
    this.taxList,
  });

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
  List<dynamic> taxList;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
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
        taxList: List<dynamic>.from(json["taxList"].map((x) => x)),
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
        "taxList": List<dynamic>.from(taxList.map((x) => x)),
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
