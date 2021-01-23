import 'package:anbyshop/util/font_family.dart';
import 'package:anbyshop/util/size_config.dart';
import 'package:flutter/material.dart';

class Offer extends StatelessWidget {
  final offer;
  const Offer({Key key, this.offer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.4,
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: NetworkImage(offer["image"]), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(AnbySize.baseSize)),
    );
  }
}
