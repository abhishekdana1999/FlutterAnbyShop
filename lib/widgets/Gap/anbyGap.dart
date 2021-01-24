import 'package:anbyshop/util/size_config.dart';
import 'package:flutter/material.dart';

class AnbyGap extends StatelessWidget {
  final size;
  final side;
  final color;
  const AnbyGap({
    Key key,
    this.size,
    this.side,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = AnbySize.baseSize;
    var marginSideIsVerticle = true;
    var bColor = color != null ? color : Colors.white;
    switch (this.color) {
      case 'D':
        bColor = Colors.grey[200];
        break;
      default:
    }
    switch (this.size) {
      case 'SM':
        height = height * 0.8;
        break;
      case 'XL':
        height = height * 1.5;
        break;
      default:
    }
    switch (this.side) {
      case 'H':
        marginSideIsVerticle = false;
        break;
      default:
    }

    return Container(
      color: bColor,
      width: !marginSideIsVerticle ? height : MediaQuery.of(context).size.width,
      height: marginSideIsVerticle ? height : 0,
    );
  }
}
