import 'package:anbyshop/services/product.service.dart';
import 'package:anbyshop/util/font_family.dart';
import 'package:anbyshop/util/size_config.dart';

import 'package:anbyshop/widgets/productCard/productVerticalCard.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class TopProducts extends StatefulWidget {
  TopProducts({Key key}) : super(key: key);

  @override
  _TopProductsState createState() => _TopProductsState();
}

class _TopProductsState extends State<TopProducts>
    with SingleTickerProviderStateMixin {
  final productService = Get.put(ProductService());
  AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double cardWidth = MediaQuery.of(context).size.width / 3.3;
    double cardHeight = MediaQuery.of(context).size.height / 3.6;
    List recentProduct = [];

    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(
          vertical: AnbySize.basePadding, horizontal: AnbySize.basePadding),
      color: Colors.white,
      child: Column(children: [
        Container(
            padding: EdgeInsets.all(AnbySize.basePadding),
            alignment: Alignment.centerLeft,
            child: Text(
              "Top Products",
              style: TextStyle(
                  fontSize: AnbySize.headingFontSize,
                  fontFamily: AnbyfontFamily.anbyFontMedium),
            )),
        Obx(() => productService.isTopProductLoding.isfalse
            ? GridView.builder(
                physics: ScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: MediaQuery.of(context).size.width /
                      (MediaQuery.of(context).size.height / 1.2),
                  mainAxisSpacing: 0.0,
                  crossAxisSpacing: 0.0,
                ),
                shrinkWrap: true,
                itemCount: productService.topProducts.length,
                itemBuilder: (context, index) {
                  return ProductVerticalCard(
                    product: productService.topProducts[index],
                  );
                },
              )
            : CircularProgressIndicator()),
        // FutureBuilder(
        //   future: _getTopProducts(),
        //   builder: (context, snapshot) {
        //     if (!snapshot.hasData) {
        //       return ProfileShimmer(
        //         hasCustomColors: true,
        //         colors: [
        //           // Dark color
        //           Color(0xFF1769aa),
        //           // light color
        //           Color(0xFF4dabf5),
        //           // Medium color
        //           Color(0xFF2196f3)
        //         ],
        //       );
        //     }
        //     return GridView.builder(
        //       physics: ScrollPhysics(),
        //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //         crossAxisCount: 2,
        //         childAspectRatio: MediaQuery.of(context).size.width /
        //             (MediaQuery.of(context).size.height / 1.2),
        //         mainAxisSpacing: 0.0,
        //         crossAxisSpacing: 0.0,
        //       ),
        //       shrinkWrap: true,
        //       itemCount: recentProduct.length,
        //       itemBuilder: (context, index) {
        //         return ProductVerticalCard(
        //           product: recentProduct[index],
        //         );
        //       },
        //     );
        //   },
        // ),
      ]),
    );
  }
}
