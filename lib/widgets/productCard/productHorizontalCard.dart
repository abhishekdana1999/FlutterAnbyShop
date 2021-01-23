import 'dart:ffi';

import 'package:anbyshop/screen/Home/home.dart';
import 'package:anbyshop/util/font_family.dart';
import 'package:anbyshop/util/size_config.dart';
import 'package:anbyshop/widgets/BaseWidgets/AnbyBadge.dart';
import 'package:anbyshop/widgets/BaseWidgets/AnbyPrimaryButton.dart';
import 'package:anbyshop/widgets/BaseWidgets/addToCard.dart';
import 'package:flutter/material.dart';

class ProductHorizontalCard extends StatefulWidget {
  final product;
  ProductHorizontalCard({Key key, this.product}) : super(key: key);

  @override
  _ProductHorizontalCardState createState() => _ProductHorizontalCardState();
}

class _ProductHorizontalCardState extends State<ProductHorizontalCard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String _calculatePrice(product) {
      double result = double.parse(((widget.product["variants"][0]["price"] -
                  widget.product["variants"][0]["sellingPrice"]) /
              widget.product["variants"][0]["price"] *
              100)
          .toString());
      return result.toStringAsFixed(1);
    }

    return Container(
      margin: EdgeInsets.only(bottom: AnbySize.baseMargin),
      padding: EdgeInsets.symmetric(
          horizontal: AnbySize.basePadding, vertical: AnbySize.basePadding),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AnbySize.baseSize / 5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[200],
              blurRadius: 0.0, // soften the shadow
              spreadRadius: 0.8, //extend the shadow
              offset: Offset(
                0.0, // Move to right 10  horizontally
                0.0, // Move to bottom 5 Vertically
              ),
            )
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start, //change here don't //worked
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(AnbySize.basePadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.product["productName"].toString(),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(
                        fontFamily: AnbyfontFamily.anbyFontMedium,
                        fontSize: AnbySize.headingFontSize / 1.5),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: AnbySize.baseMargin, bottom: AnbySize.baseMargin),
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          '\Rs ${widget.product["variants"][0]["sellingPrice"]}',
                          style: new TextStyle(
                              color: Colors.black,
                              fontFamily: AnbyfontFamily.anbyFontMedium,
                              fontSize: AnbySize.baseFontSize * 1.5),
                        ),
                        widget.product["variants"][0]["price"] >
                                widget.product["variants"][0]["sellingPrice"]
                            ? Text(
                                '\Rs ${widget.product["variants"][0]["price"]}',
                                style: new TextStyle(
                                    color: Colors.red,
                                    fontSize: AnbySize.baseFontSize * 1.5,
                                    decoration: TextDecoration.lineThrough),
                              )
                            : Text(""),
                        widget.product["variants"][0]["price"] >
                                widget.product["variants"][0]["sellingPrice"]
                            ? Text(
                                'Save ' +
                                    _calculatePrice(widget.product) +
                                    " % OFF",
                                style: new TextStyle(
                                  color: Colors.green,
                                  fontSize: AnbySize.baseFontSize * 1.4,
                                ),
                              )
                            : Text(""),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () {},
                      child: AnbyAddToCartButton(
                        btnText: "ADD TO CART",
                        color: Colors.black,
                        fontSize: AnbySize.baseFontSize,
                        icon: Icons.shopping_cart,
                        outline: false,
                        textAlign: TextAlign.left,
                        width: MediaQuery.of(context).size.width / 3,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Stack(
            children: [
              Container(
                height: 100,
                width: 100,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(AnbySize.baseSize / 2),
                ),
                child: Image.network(
                  widget.product["images"][0]["url"],
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
