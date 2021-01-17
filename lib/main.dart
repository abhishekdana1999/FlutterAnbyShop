import 'package:anbyshop/screen/Home/home.dart';
import 'package:anbyshop/screen/onBoarding/onboarding.dart';
import 'package:anbyshop/services/auth.service.dart';
import 'package:anbyshop/util/sharedPref.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

AuthService authService = new AuthService();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  Widget _defaultHome = new OnBoardingScreen();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  runApp(FutureBuilder(
      future: authService.checkAuthState(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return GetMaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              fontFamily: "NHaasGroteskTXPro-RG",
              primarySwatch: Colors.orange,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: HomeScreen());
      }));
}
