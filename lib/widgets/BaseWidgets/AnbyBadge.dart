import 'package:anbyshop/util/font_family.dart';
import 'package:flutter/material.dart';

class AnbyBadge extends StatelessWidget {
  final double height;
  final double width;
  final String text;
  final Color color;
  final Color textColor;
  final double fontSize;
  final double borderRadius;
  final IconData iconData;

  const AnbyBadge(
      {Key key,
      this.height,
      this.width,
      this.text,
      this.color,
      this.textColor,
      this.fontSize,
      this.borderRadius,
      this.iconData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(borderRadius)),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
              color: textColor,
              fontSize: fontSize,
              fontFamily: AnbyfontFamily.anbyFontRegular),
        ),
      ),
    );
  }
}
