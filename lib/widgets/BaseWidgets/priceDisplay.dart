import 'package:anbyshop/screen/Home/home.dart';
import 'package:anbyshop/util/font_family.dart';
import 'package:anbyshop/util/size_config.dart';
import 'package:anbyshop/widgets/Gap/anbyGap.dart';
import 'package:flutter/material.dart';

class ProductPrice extends StatelessWidget {
  final baseFontSize;

  const ProductPrice({
    Key key,
    @required this.product,
    @required this.baseFontSize,
  }) : super(key: key);

  final product;

  @override
  Widget build(BuildContext context) {
    String _calculatePrice(product) {
      double result = double.parse(((double.parse(product.price.toString()) -
                  double.parse(product.sellingPrice.toString())) /
              double.parse(product.price.toString()) *
              100)
          .toString());
      return result.toStringAsFixed(1);
    }

    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            '\₹ ${product.sellingPrice}',
            style: new TextStyle(
                color: Colors.black,
                fontFamily: AnbyfontFamily.anbyFontMedium,
                fontSize: baseFontSize * 1.8),
          ),
          AnbyGap(side: 'H', size: 'SM'),
          double.parse(product.price.toString()) >
                  double.parse(product.sellingPrice.toString())
              ? Text(
                  '${product.price.toString()}',
                  style: new TextStyle(
                      color: Colors.grey,
                      fontSize: AnbySize.baseFontSize * 1.5,
                      decoration: TextDecoration.lineThrough),
                )
              : Text(""),
          AnbyGap(side: 'H', size: 'SM'),
          double.parse(product.price.toString()) >
                  double.parse(product.sellingPrice.toString())
              ? Text(
                  _calculatePrice(product) + "% off",
                  style: new TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.w600,
                    fontSize: AnbySize.baseFontSize * 1.4,
                  ),
                )
              : Text(""),
        ],
      ),
    );
  }
}
