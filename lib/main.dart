import 'package:anbyshop/screen/Home/home.dart';
import 'package:anbyshop/screen/Transport.dart';
import 'package:anbyshop/screen/onBoarding/onboarding.dart';
import 'package:anbyshop/services/auth.service.dart';
import 'package:anbyshop/services/cart.service.dart';
import 'package:anbyshop/services/product.service.dart';
import 'package:anbyshop/services/user.service.dart';
import 'package:anbyshop/util/colors.dart';
import 'package:anbyshop/util/sharedPref.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

AuthService authService = new AuthService();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  UserService userService = Get.put(UserService(), permanent: true);

  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  var token = sharedPreferences.getString("token");

  runApp(GetMaterialApp(
      title: 'AnbyShop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AnbyColors.pageBackgroundColor,
        fontFamily: "NHaasGroteskTXPro-RG",
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: token == null ? OnBoardingScreen() : HomeScreen()));
}
