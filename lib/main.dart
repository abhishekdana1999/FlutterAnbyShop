import 'package:anbyshop/screen/Home/home.dart';
import 'package:anbyshop/screen/onBoarding/onboarding.dart';
import 'package:anbyshop/services/auth.service.dart';
import 'package:anbyshop/util/sharedPref.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

AuthService authService = new AuthService();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPrefs prefs = new SharedPrefs();
  prefs.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Nunito",
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: OnBoardingScreen(),
    );
  }
}
