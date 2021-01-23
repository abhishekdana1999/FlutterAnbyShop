import 'dart:convert';

import 'package:anbyshop/models/user.dart';
import 'package:anbyshop/screen/Home/product/productDetail/productDetails.dart';
import 'package:anbyshop/services/cart.service.dart';
import 'package:anbyshop/services/user.service.dart';
import 'package:anbyshop/util/colors.dart';
import 'package:anbyshop/util/font_family.dart';
import 'package:anbyshop/util/size_config.dart';
import 'package:anbyshop/widgets/BaseWidgets/AnbyBadge.dart';

import 'package:anbyshop/widgets/BaseWidgets/addToCard.dart';
import 'package:anbyshop/widgets/BaseWidgets/anbyVariantChip.dart';
import 'package:anbyshop/widgets/BaseWidgets/priceDisplay.dart';
import 'package:anbyshop/widgets/Gap/anbyGap.dart';
import 'package:anbyshop/widgets/bottomSheet/variantBottomSheet.dart';
import 'package:anbyshop/widgets/reviewsandrating/reviewandrating.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductVerticalCard extends StatefulWidget {
  final product;
  ProductVerticalCard({Key key, this.product}) : super(key: key);

  @override
  _ProductVerticalCardState createState() => _ProductVerticalCardState();
}

class _ProductVerticalCardState extends State<ProductVerticalCard> {
  UserService userService = Get.find();
  CartService cartService = Get.put(CartService(), permanent: true);
  var activeVariant;
  @override
  void initState() {
    activeVariant = widget.product.variants[0];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    isProductFav(element) {
      if (userService.user != null) {
        var favProd;
        for (var i = 0; i < userService.user.value.favProd.length; i++) {
          if (userService.user.value.favProd[i] == element.id) return true;
        }
      }
      return false;
    }

    addToFav(element) async {
      if (!userService.user.value.favProd.contains(element.id)) {
        setState(() {
          userService.user.value.favProd.add(element.id);
        });
        await userService.updateUser(userService.user);
      } else {
        setState(() {
          userService.user.value.favProd
              .removeWhere((prod) => prod == element.id);
        });
        await userService.updateUser(userService.user);
      }
    }

    openVariantBottomSheet() {
      Get.bottomSheet(VariantBottomSheet(
        product: widget.product,
      ));
    }

    return Container(
      padding: EdgeInsets.all(AnbySize.basePadding),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black26,
          width: 0.1,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            overflow: Overflow.visible,
            children: [
              GestureDetector(
                onTap: () {
                  Get.to(
                      ProductDetail(
                        product: widget.product,
                      ),
                      fullscreenDialog: true,
                      curve: Curves.fastOutSlowIn,
                      duration: Duration(seconds: 1));
                },
                child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: 100,
                      width: 120.0,
                      child: Image.network(
                        widget.product.images[0].url,
                        fit: BoxFit.contain,
                      ),
                    )),
              ),
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                    alignment: Alignment.center,
                    height: 30,
                    child: RatingsAndReview(
                      size: 'SM',
                      product: widget.product,
                      rating: "4.5",
                      text: "",
                    )),
              ),
              Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    alignment: Alignment.center,
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.circular(AnbySize.baseSize * 2),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 2,
                              color: Colors.black12,
                              spreadRadius: 2)
                        ]),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      icon: Icon(
                        isProductFav(widget.product)
                            ? Icons.favorite
                            : Icons.favorite_border_outlined,
                        size: AnbySize.baseFontSize * 2,
                      ),
                      color: isProductFav(widget.product)
                          ? Colors.red
                          : Colors.black,
                      onPressed: () {
                        addToFav(widget.product);
                      },
                    ),
                  )),

              // widget.product.variants.length > 1
              //     ? Positioned(
              //         bottom: 10,
              //         right: 0,
              //         child: GestureDetector(
              //           onTap: () {
              //             openVariantBottomSheet();
              //           },
              //           child: Container(
              //             decoration: BoxDecoration(
              //                 borderRadius:
              //                     BorderRadius.circular(AnbySize.baseSize * 2),
              //                 boxShadow: [
              //                   BoxShadow(
              //                       blurRadius: 2,
              //                       color: Colors.black12,
              //                       spreadRadius: 2)
              //                 ]),
              //             child: AnbyBadge(
              //               height: AnbySize.baseSize * 2.5,
              //               width: AnbySize.baseSize * 8,
              //               text: widget.product.variants.length.toString() +
              //                   " Variants",
              //               borderRadius: AnbySize.baseSize * 2,
              //               color: Colors.white,
              //               textColor: Colors.grey,
              //               fontSize: AnbySize.baseFontSize * 1.2,
              //               iconData: null,
              //             ),
              //           ),
              //         ))
              //     : Container()
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.product.productName.toString(),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontFamily: AnbyfontFamily.anbyFontRegular,
                        fontSize: AnbySize.baseFontSize * 1.6),
                  ),
                ),
              ),
              AnbyGap(
                size: 'SM',
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
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
                            size: 'SM',
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
              ),
              AnbyGap(
                size: 'SM',
              ),
              ProductPrice(
                product: activeVariant,
                baseFontSize: AnbySize.baseFontSize / 1.2,
              ),
              AnbyGap(
                size: 'SM',
              ),
              Align(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () {
                    _addItemToCart();
                  },
                  child: AnbyAddToCartButton(
                    btnText: "ADD TO CART",
                    color: AnbyColors.PrimaryColor,
                    fontSize: AnbySize.baseFontSize,
                    icon: Icons.shopping_cart,
                    outline: false,
                    textAlign: TextAlign.left,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

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
}
