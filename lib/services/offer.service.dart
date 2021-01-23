import 'dart:convert';

import 'package:anbyshop/constant/app.constant.dart';
import 'package:http/http.dart' as HTTP;

class OfferService {
  var http = HTTP.Client();
  OfferService();

  var offers;

  Future<bool> getOffers() async {
    var response =
        await http.get(AnbyConstant.anbyAPI + "offer?size=5&currentPage=1");

    if (response.statusCode == 200) {
      var parsed = jsonDecode(response.body);
      offers = parsed["docs"];
      return Future.value(true);
    } else {
      return Future.value(false);
    }
  }
}
