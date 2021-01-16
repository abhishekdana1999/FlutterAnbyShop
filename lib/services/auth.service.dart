import 'dart:convert';

import 'package:anbyshop/util/sharedPref.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as HTTP;
import 'package:shared_preferences/shared_preferences.dart';

String token;

class AuthService {
  final http = new HTTP.Client();
  bool isLoggedIn = false;
  AuthService();

  SharedPrefs prefs = new SharedPrefs();

  Future<bool> checkAuthState() async {
    WidgetsFlutterBinding.ensureInitialized();

    if (prefs.token.isNotEmpty) {
      isLoggedIn = true;
    } else {
      isLoggedIn = false;
    }
  }

  Future<bool> sendOTP(String phonenumber) async {
    if (!phonenumber.contains("+91")) {
      phonenumber = "+91" + phonenumber;
    }

    var obj = {"phone": phonenumber};

    var response = await http.post("https://api.soft-impressions.com/user",
        headers: null, body: obj);
    if (response.statusCode == 201) {
      return Future.value(true);
    } else {
      return Future.value(false);
    }
  }

  Future login(phonenumber, otp) async {
    if (!phonenumber.contains("+91")) {
      phonenumber = "+91" + phonenumber;
    }

    var obj = {"phone": phonenumber, "otp": otp};

    debugPrint(obj.toString());
    var response = await http.post(
        "https://api.soft-impressions.com/user/auth/login",
        headers: null,
        body: obj);

    debugPrint(response.body.toString());
    if (response.statusCode == 201) {
      var parsed = jsonDecode(response.body);
      token = parsed["token"];

      prefs.settoken(token);
      return Future.value(true);
    } else {
      return Future.value(false);
    }
  }
}
