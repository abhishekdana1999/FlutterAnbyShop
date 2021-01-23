import 'package:anbyshop/services/product.service.dart';
import 'package:anbyshop/util/font_family.dart';
import 'package:anbyshop/util/size_config.dart';
import 'package:anbyshop/widgets/productCard/productVerticalCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_shimmer/flutter_shimmer.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class TrendingProducts extends StatefulWidget {
  TrendingProducts({Key key}) : super(key: key);

  @override
  _TrendingProductsState createState() => _TrendingProductsState();
}

class _TrendingProductsState extends State<TrendingProducts>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  final ProductService productService = Get.find();
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

    _getTopProducts() async {
      var value = await productService.getTrendingProducts();
      if (value == true) {
        recentProduct = productService.trendingProducts;
        return recentProduct;
      }
    }

    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(
          vertical: AnbySize.basePadding, horizontal: AnbySize.basePadding),
      color: Colors.white,
      child: Column(
        children: [
          Container(
              padding: EdgeInsets.all(AnbySize.basePadding),
              alignment: Alignment.centerLeft,
              child: Text(
                "Trending Products",
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
          //     debugPrint(snapshot.hasData.toString());
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
        ],
      ),
    );
  }
}
