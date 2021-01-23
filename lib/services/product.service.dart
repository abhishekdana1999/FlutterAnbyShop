import 'dart:convert';

import 'package:anbyshop/constant/app.constant.dart';
import 'package:anbyshop/models/product.dart';

import 'package:http/http.dart' as HTTP;
import 'package:get/state_manager.dart';

class ProductService extends GetxController {
  final http = new HTTP.Client();
  var products = List<Product>().obs;

  var toperror = ''.obs;
  var isTopProductLoding = false.obs;
  var topProducts = List<Product>().obs;

  var trendingerror = ''.obs;
  var isTrendingProductLoding = false.obs;
  var trendingProducts = List<Product>().obs;

  var searcherror = ''.obs;
  var isSearchedProductLoding = false.obs;
  var searchProducts = List<Product>().obs;

  @override
  void onInit() {
    // called immediately after the widget is allocated memory
    getTopProducts();
    getTrendingProducts();
    searchProducts();
    super.onInit();
  }

  Future getTopProducts() async {
    isTopProductLoding(true);
    var response =
        await http.get(AnbyConstant.anbyAPI + 'product/GetTopNewProducts');
    if (response.statusCode == 200) {
      var jsonString = response.body;
      topProducts = productFromJson(jsonString).obs;
      isTopProductLoding(false);

      return Future.value(true);
    } else {
      isTopProductLoding(false);
      toperror = 'Network Issue'.obs;
      return Future.value(false);
    }
  }

  Future getTrendingProducts() async {
    isTrendingProductLoding(true);

    var response =
        await http.get(AnbyConstant.anbyAPI + 'product/GetTopTrendingProducts');
    if (response.statusCode == 200) {
      var jsonString = response.body;
      trendingProducts = productFromJson(jsonString).obs;
      isTrendingProductLoding(false);

      return Future.value(true);
    } else {
      isTrendingProductLoding(false);
      toperror = 'Network Issue'.obs;
      return Future.value(false);
    }
  }

  Future searchProduct(String searchTerm) async {
    isSearchedProductLoding(true);
    var response = await http.get(
        AnbyConstant.anbyAPI + 'product/filterwithCounts?query=$searchTerm');
    if (response.statusCode == 200) {
      var jsonString = response.body;
      searchProducts = productFromJson(jsonString);
      isSearchedProductLoding(false);
      return Future.value(true);
    } else {
      isSearchedProductLoding(false);
      searcherror = 'Some Error '.obs;
      Future.value(false);
    }
  }
}
