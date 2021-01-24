import 'package:anbyshop/constant/app.constant.dart';
import 'package:anbyshop/models/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as HTTP;
import 'package:shared_preferences/shared_preferences.dart';

class UserService extends GetxController {
  var http = new HTTP.Client();
  var user = User().obs;
  var isUserLoading = false.obs;
  var userError = "".obs;

  UserService();
  SharedPreferences sharedPreferences;

  @override
  void onInit() {
    super.onInit();
    getUserDetail().then((value) => print(value));
  }

  Future getUserDetail() async {
    isUserLoading(true);

    sharedPreferences = await SharedPreferences.getInstance();
    var id = sharedPreferences.getString("id");
    var token = sharedPreferences.getString("token");
    var response = await http.get(AnbyConstant.anbyAPI + "user/$id",
        headers: {'Authorization': 'Bearer $token'});

    if (response.statusCode == 200) {
      var jsonString = response.body;
      user = userFromJson(jsonString).obs;

      isUserLoading(false);
      return Future.value(true);
    } else {
      isUserLoading(false);
      userError = "Error while retriving user profile.".obs;
      return Future.value(false);
    }
  }

  Future<bool> updateUser(userToUpdate) async {
    isUserLoading(true);
    sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString("token");

    var response = await http.put(
        AnbyConstant.anbyAPI + 'user/' + user.value.id,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-type': 'application/json'
        },
        body: userToJson(userToUpdate));

    if (response.statusCode == 200) {
      isUserLoading(false);

      this.getUserDetail();
      return Future.value(true);
    } else {
      debugPrint(response.body.toString());
      isUserLoading(false);
      userError = "Error while retriving user profile.".obs;
      return Future.value(false);
    }
  }
}
