import 'package:anbyshop/util/size.dart';
import 'package:flutter/material.dart';

class Offer extends StatelessWidget {
  const Offer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AnbySize.basePadding / 1.2),
      width: MediaQuery.of(context).size.width / 1.1,
      height: 200,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(AnbySize.baseSize / 4)),
      ),
    );
  }
}
