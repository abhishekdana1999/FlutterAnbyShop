import 'dart:convert';

import 'package:anbyshop/models/user.dart';
import 'package:anbyshop/screen/Home/home.dart';
import 'package:anbyshop/services/cart.service.dart';
import 'package:anbyshop/util/colors.dart';
import 'package:anbyshop/util/font_family.dart';
import 'package:anbyshop/util/size_config.dart';
import 'package:anbyshop/widgets/BaseWidgets/AnbyIconBadge.dart';
import 'package:anbyshop/widgets/BaseWidgets/AnbyPrimaryButton.dart';
import 'package:anbyshop/widgets/BaseWidgets/anbyCustomAppBar.dart';
import 'package:anbyshop/widgets/BaseWidgets/anbyVariantChip.dart';
import 'package:anbyshop/widgets/BaseWidgets/priceDisplay.dart';
import 'package:anbyshop/widgets/BaseWidgets/review.dart';
import 'package:anbyshop/widgets/Gap/anbyGap.dart';
import 'package:anbyshop/widgets/reviewsandrating/reviewandrating.dart';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';

class ProductDetail extends StatefulWidget {
  final product;
  ProductDetail({Key key, this.product}) : super(key: key);

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail>
    with SingleTickerProviderStateMixin {
  CartService cartService = Get.find();
  int selectedImage = 0;
  AnimationController controller;
  Animation<double> animation;
  var activeVariant;
  @override
  void initState() {
    activeVariant = widget.product.variants[0];
    print(jsonEncode(widget.product).toString());
    super.initState();
    controller =
        new AnimationController(duration: Duration(seconds: 3), vsync: this)
          ..addListener(() => setState(() {}));
    animation = Tween(begin: -500.0, end: 500.0).animate(controller);
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Future<void> _addItemToCart() async {
      CartProduct cartItem = new CartProduct();
      cartItem.id = widget.product.id;
      cartItem.productName = widget.product.productName;
      cartItem.productBrand = widget.product.productBrand;
      cartItem.productVariant = new List<ProductVariant>();
      ProductVariant prodVariant = new ProductVariant(
          id: activeVariant.id,
          images: activeVariant.images,
          price: activeVariant.price,
          stock: new Stock(
              totalQty: int.parse(activeVariant.stock.totalQty.toString())),
          type: activeVariant.type.toString(),
          value: activeVariant.value.toString(),
          qty: 1,
          sellingPrice: double.parse(activeVariant.sellingPrice.toString()));
      cartItem.productVariant.add(prodVariant);
      cartItem.productCategory = widget.product.productCategory;
      cartItem.productSubCategory = widget.product.productSubCategory;
      cartItem.productClassification = widget.product.productClassification;
      cartItem.productImage = ProductImage(
          bucketName: widget.product.images[0].bucketName.toString(),
          url: widget.product.images[0].url.toString());

      cartItem.productDealer = widget.product.productDealer.toString();
      cartItem.tax = widget.product.tax;

      cartService.addItemToCart(cartItem);
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(4.5, Colors.white),
      body: SingleChildScrollView(
        child: Column(
          children: [
            productImageDisplay(),
            TopRoundedContainer(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.product.productName,
                      style: TextStyle(
                          fontFamily: AnbyfontFamily.anbyFontRegular,
                          fontSize: AnbySize.baseFontSize * 2)),
                  AnbyGap(),
                  Row(
                      children: List.generate(
                    widget.product.variants.length,
                    (index) {
                      var currentVariant = widget.product.variants[index];
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            activeVariant = widget.product.variants[index];
                          });
                        },
                        child: Row(
                          children: [
                            AnbyVariantChip(
                              variant: currentVariant,
                              isActive: currentVariant.id == activeVariant.id,
                            ),
                            AnbyGap(
                              side: "H",
                            )
                          ],
                        ),
                      );
                    },
                  )),
                  AnbyGap(),
                  ProductPrice(
                    product: activeVariant,
                    baseFontSize: AnbySize.baseFontSize * 1.2,
                  ),
                  AnbyGap(),
                  Text(
                    "Classfication",
                    style: TextStyle(
                        fontSize: AnbySize.baseFontSize * 2,
                        fontFamily: AnbyfontFamily.anbyFontMedium),
                  ),
                  Html(
                    data: widget.product.productClassification,
                  ),
                ],
              ),
            ),
            AnbyGap(
              color: 'D',
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(
                  vertical: AnbySize.basePadding,
                  horizontal: AnbySize.basePadding * 2),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 0.4, color: Colors.grey[400])),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.70,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Deliver To ",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: AnbySize.baseFontSize * 1.6,
                                  fontFamily: AnbyfontFamily.anbyFontRegular,
                                  color: Colors.grey),
                            ),
                            Text(
                              "Neeraj Dana,...",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: AnbySize.baseFontSize * 1.6,
                                fontFamily: AnbyfontFamily.anbyFontMedium,
                              ),
                            ),
                            Text(
                              "307026",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: AnbySize.baseFontSize * 1.6,
                                fontFamily: AnbyfontFamily.anbyFontMedium,
                              ),
                            ),
                            Container(
                              height: 25,
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              alignment: Alignment.center,
                              child: Text('home'),
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(8)),
                            )
                          ],
                        ),
                        Text(
                          "D-122 New Townm Ganka ",
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 32,
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    alignment: Alignment.center,
                    child: Text('Change'),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(width: 0.5),
                        borderRadius: BorderRadius.circular(2)),
                  )
                ],
              ),
            ),
            AnbyGap(
              color: 'D',
            ),
            widget.product.reviews.length != 0
                ? Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border:
                            Border.all(width: 0.4, color: Colors.grey[400])),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                              left: AnbySize.basePadding,
                              right: AnbySize.basePadding,
                              top: AnbySize.basePadding * 2),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Reviews & Ratings",
                              style: TextStyle(
                                  fontSize: AnbySize.baseFontSize * 2,
                                  fontFamily: AnbyfontFamily.anbyFontMedium),
                            ),
                          ),
                        ),
                        AnbyGap(),
                        Container(
                          padding: EdgeInsets.zero,
                          child: Column(
                            children: List.generate(
                              widget.product.reviews.length,
                              (index) => Review(
                                review: widget.product.reviews[index],
                              ),
                            ),
                          ),
                        )
                      ],
                    ))
                : Container(),
          ],
        ),
      ),
      persistentFooterButtons: [
        Container(
          padding: EdgeInsets.all(AnbySize.basePadding),
          child: GestureDetector(
            onTap: () {
              _addItemToCart();
            },
            child: AnbyPrimaryButton(
              btnText: "Add To Cart",
              outline: false,
              color: AnbyColors.PrimaryColor,
              fontSize: AnbySize.baseFontSize,
              icon: Icons.shopping_cart,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }

  Column productImageDisplay() {
    return Column(
      children: [
        Hero(
          tag: widget.product.productName.toString(),
          child: Container(
            height: 250,
            width: MediaQuery.of(context).size.width,
            child: Image.network(
              widget.product.images[selectedImage].url,
              fit: BoxFit.contain,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...List.generate(
                  widget.product.images.length,
                  (index) =>
                      buildSmallImage(index, widget.product.images[index].url))
            ],
          ),
        ),
      ],
    );
  }

  GestureDetector buildSmallImage(int index, String url) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedImage = index;
        });
      },
      child: Container(
        margin: EdgeInsets.only(
            right: (15 / 375.0) * MediaQuery.of(context).size.width),
        padding:
            EdgeInsets.all((8 / 812.0) * MediaQuery.of(context).size.height),
        height: (58 / 812.0) * MediaQuery.of(context).size.height,
        width: (58 / 375.0) * MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
                color: selectedImage == index
                    ? AnbyColors.PrimaryColor
                    : Colors.transparent),
            boxShadow: [BoxShadow(blurRadius: 2, color: Colors.grey[300])],
            borderRadius: BorderRadius.circular(10)),
        child: Image.network(url),
      ),
    );
  }
}

class TopRoundedContainer extends StatelessWidget {
  const TopRoundedContainer({
    Key key,
    this.color,
    this.child,
  }) : super(key: key);
  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: (20 / 375.0) * MediaQuery.of(context).size.width),
      padding: EdgeInsets.all((16 / 375.0) * MediaQuery.of(context).size.width),
      width: double.infinity,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40))),
      child: child,
    );
  }
}
