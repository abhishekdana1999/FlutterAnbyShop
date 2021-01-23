import 'package:anbyshop/screen/Home/components/cartPage.dart';
import 'package:anbyshop/screen/Home/components/categoryList.dart';
import 'package:anbyshop/screen/Home/components/header.dart';
import 'package:anbyshop/screen/Home/components/offerList.dart';
import 'package:anbyshop/screen/Home/components/topProducts.dart';
import 'package:anbyshop/screen/Home/components/trendingProducts.dart';
import 'package:anbyshop/screen/onBoarding/onboarding.dart';
import 'package:anbyshop/services/product.service.dart';

import 'package:anbyshop/util/colors.dart';
import 'package:anbyshop/util/size_config.dart';
import 'package:anbyshop/widgets/Gap/anbyGap.dart';

import 'package:flashy_tab_bar/flashy_tab_bar.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

ProductService productService = new ProductService();

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ProductService productService = Get.put(ProductService(), permanent: true);

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.black));

    productService.getTopProducts();

    super.initState();
  }

  final TextEditingController _searchBarController =
      new TextEditingController();

  int _page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    List recentProduct = [];

    _getTopProducts() async {
      var value = await productService.getTopProducts();
      if (value == true) {
        recentProduct = productService.topProducts;
        return recentProduct;
      }
    }

    logoutUser() async {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();

      setState(() {
        sharedPreferences.clear();
      });

      Get.to(OnBoardingScreen());
    }

    int _selectedIndex = 0;

    return Scaffold(
      backgroundColor: AnbyColors.pageBackgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(AnbySize.baseSize * 12),
        child: Header(),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          color: AnbyColors.pageBackgroundColor,
          child: Column(
            children: [
              OfferList(),
              AnbyGap(
                color: "D",
              ),
              CategoryList(),
              AnbyGap(
                color: "D",
              ),
              TopProducts(),
              AnbyGap(
                color: "D",
              ),
              TrendingProducts()
            ],
          ),
        ),
      ),
      bottomNavigationBar: FlashyTabBar(
        height: 65,
        backgroundColor: AnbyColors.PrimaryColor,
        selectedIndex: _selectedIndex,
        showElevation: true,
        onItemSelected: (index) => {
          setState(() {
            _selectedIndex = index;
          })
        },
        items: [
          FlashyTabBarItem(
              icon: Icon(Icons.shopping_bag_outlined),
              title: Text('Home'),
              activeColor: Colors.white,
              inactiveColor: Colors.white70),
          FlashyTabBarItem(
              icon: Icon(Icons.car_repair),
              title: Text('Taxi'),
              activeColor: Colors.white,
              inactiveColor: Colors.white70),
          FlashyTabBarItem(
              icon: Icon(Icons.home_repair_service_outlined),
              title: Text('Sevices'),
              activeColor: Colors.white,
              inactiveColor: Colors.white70),
          FlashyTabBarItem(
              icon: Icon(Icons.person_outline),
              title: Text('Settings'),
              activeColor: Colors.white,
              inactiveColor: Colors.white70),
        ],
      ),
    );
  }
}
