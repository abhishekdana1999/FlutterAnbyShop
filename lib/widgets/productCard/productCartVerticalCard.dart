import 'package:anbyshop/models/user.dart';
import 'package:anbyshop/services/cart.service.dart';
import 'package:anbyshop/services/user.service.dart';
import 'package:anbyshop/util/colors.dart';
import 'package:anbyshop/util/font_family.dart';
import 'package:anbyshop/util/size_config.dart';
import 'package:anbyshop/widgets/BaseWidgets/AnbyBadge.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCartVerticalCard extends StatefulWidget {
  final CartProduct product;
  final int productIndex;
  const ProductCartVerticalCard({Key key, this.product, this.productIndex})
      : super(key: key);

  @override
  _ProductCartVerticalCardState createState() =>
      _ProductCartVerticalCardState();
}

class _ProductCartVerticalCardState extends State<ProductCartVerticalCard> {
  @override
  Widget build(BuildContext context) {
    UserService userService = Get.find();
    CartService cartService = Get.find();
    return Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(AnbySize.basePadding),
        decoration: BoxDecoration(
            border:
                Border(bottom: BorderSide(width: 1, color: Colors.black12))),
        child: Obx(
          () => cartService.isCartProductLoding.isfalse
              ? Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.product.productName,
                                  style: TextStyle(
                                    fontSize: AnbySize.baseFontSize * 1.8,
                                    fontFamily: AnbyfontFamily.anbyFontRegular,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                              ],
                            )),
                        Flexible(
                            flex: 1,
                            fit: FlexFit.tight,
                            child: Container(
                              alignment: Alignment.center,
                              height: 100,
                              // width: 100,
                              child: Image.network(
                                widget.product.productImage.url,
                                fit: BoxFit.contain,
                                alignment: Alignment.center,
                              ),
                            ))
                      ],
                    ),
                    Column(
                      children: List.generate(
                          widget.product.productVariant.length,
                          (prodVar) => Container(
                                padding: EdgeInsets.only(
                                    bottom: AnbySize.basePadding,
                                    top: AnbySize.basePadding),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '₹ ' +
                                          widget.product.productVariant[prodVar]
                                              .sellingPrice
                                              .toString(),
                                      style: TextStyle(
                                          fontSize: AnbySize.baseFontSize * 1.8,
                                          fontFamily:
                                              AnbyfontFamily.anbyFontMedium),
                                    ),
                                    AnbyBadge(
                                      borderRadius: 100,
                                      color: AnbyColors.PrimaryColor,
                                      fontSize: AnbySize.baseFontSize * 1.5,
                                      height: 30,
                                      width: 65,
                                      iconData: null,
                                      text: widget
                                          .product.productVariant[prodVar].value
                                          .toString(),
                                      textColor: Colors.white,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              cartService.removeItemCart(
                                                  widget.productIndex, prodVar);
                                            });
                                          },
                                          child: Chip(
                                            label: Text("-"),
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                          ),
                                        ),
                                        Text(
                                          '  ' +
                                              widget.product
                                                  .productVariant[prodVar].qty
                                                  .toString() +
                                              '  ',
                                          style: TextStyle(
                                              fontSize:
                                                  AnbySize.baseFontSize * 1.8,
                                              fontFamily: AnbyfontFamily
                                                  .anbyFontMedium),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              cartService.addItemToCart(
                                                  userService.user.value.cart
                                                          .products[
                                                      widget.productIndex],
                                                  prodVar);
                                            });
                                          },
                                          child: Chip(
                                            label: Text("+"),
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              )),
                    )
                  ],
                )
              : Center(
                  child: CircularProgressIndicator(),
                ),
        ));
  }
}
