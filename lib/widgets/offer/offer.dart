import 'package:anbyshop/util/size.dart';
import 'package:flutter/material.dart';

class Offer extends StatelessWidget {
  final offer;
  const Offer({Key key, this.offer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AnbySize.basePadding / 1.2),
      width: MediaQuery.of(context).size.width / 1.3,
      height: 200,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.black,
            image: DecorationImage(
                image: NetworkImage(offer["image"]), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(AnbySize.baseSize)),
      ),
    );
  }
}
