import 'dart:convert';

import 'package:anbyshop/constant/app.constant.dart';
import 'package:anbyshop/models/checkout.dart';
import 'package:anbyshop/models/user.dart';
import 'package:anbyshop/services/user.service.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as HTTP;
import 'package:shared_preferences/shared_preferences.dart';

class CheckoutService extends GetxController {
  var checkout = Checkout().obs;

  var isCheckoutLoading = false.obs;
  var checkoutError = ''.obs;
  final http = new HTTP.Client();
  UserService userService = Get.find();
  SharedPreferences sharedPreferences;

  @override
  void onInit() {
    super.onInit();
    makeOrder().then((value) => {
          if (value == false)
            {
              debugPrint(checkoutError.toString()),
              makeOrder().then((value) => debugPrint(value.toString()))
            }
        });
  }

  Future<bool> makeOrder() async {
    isCheckoutLoading(true);

    var token;
    var address;
    sharedPreferences = await SharedPreferences.getInstance();
    token = sharedPreferences.getString("token");

    var addressIndex = userService.user.value.useraddress
        .indexWhere((element) => element.isDefault);
    address = userService.user.value.useraddress[addressIndex];
    debugPrint("Before Response");
    // var response =
    //     await http.post(AnbyConstant.anbyAPI + "order/makeOrder", headers: {
    //   'Authorization': 'Bearer $token'
    // }, body: {
    //   "address": {
    //     "addressName": address.addressName,
    //     "buildingName": address.buildingName,
    //     "addressLine1": address.addressLine1,
    //     "landMark": address.landMark,
    //     "city": address.city,
    //     "district": address.district,
    //     "isDefault": address.isDefault,
    //     "roomNo": address.roomNo,
    //     "pincode": address.pincode,
    //     "state": address.state
    //   }
    // });

    var headers = {
      'Authorization': 'Bearer $token',
      'Content-type': 'application/json'
    };
    var response =
        await http.post('https://api.soft-impressions.com/order/makeOrder',
            headers: headers,
            body: jsonEncode({
              "address": {
                "addressName": address.addressName.toString(),
                "buildingName": address.buildingName.toString(),
                "addressLine1": address.addressLine1.toString(),
                "landMark": address.landMark.toString(),
                "city": address.city.toString(),
                "district": address.district.toString(),
                "isDefault": address.isDefault,
                "roomNo": address.roomNo.toString(),
                "pincode": address.pincode,
                "state": address.state.toString()
              }
            }));

    debugPrint(response.statusCode.toString());
    if (response.statusCode == 201) {
      var jsonString = response.body;
      checkout = checkoutFromJson(jsonString).obs;
      isCheckoutLoading(false);
      return Future.value(true);
    } else {
      isCheckoutLoading(false);
      checkoutError = "Error while making order.".obs;
      return Future.value(false);
    }
  }
}
