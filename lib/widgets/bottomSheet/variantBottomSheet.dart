import 'package:anbyshop/util/size_config.dart';
import 'package:anbyshop/widgets/productCard/productVerticalCard.dart';
import 'package:flutter/material.dart';

class VariantBottomSheet extends StatelessWidget {
  final product;
  const VariantBottomSheet({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      padding: EdgeInsets.all(AnbySize.basePadding * 2),
      child: Center(
          child: GridView.builder(
        physics: ScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: MediaQuery.of(context).size.width /
              (MediaQuery.of(context).size.height / 1.2),
          mainAxisSpacing: 0.0,
          crossAxisSpacing: 0.0,
        ),
        shrinkWrap: true,
        itemCount: product.variants.length,
        itemBuilder: (context, index) {
          return Container(
              decoration: BoxDecoration(
                  image: DecorationImage(image: product.images[0].url)),
              child: Text("Hellow"));
        },
      )),
    );
  }
}
