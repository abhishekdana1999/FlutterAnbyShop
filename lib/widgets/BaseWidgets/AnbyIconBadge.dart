import 'package:anbyshop/util/font_family.dart';
import 'package:flutter/material.dart';

class AnbyIconBadge extends StatelessWidget {
  final double height;
  final double width;
  final String text;
  final Color color;
  final Color textColor;
  final double fontSize;
  final double borderRadius;
  final IconData iconData;
  final showIcon;
  const AnbyIconBadge(
      {Key key,
      this.height,
      this.width,
      this.text,
      this.color,
      this.textColor,
      this.fontSize,
      this.borderRadius,
      this.iconData,
      this.showIcon = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(borderRadius)),
      child: Center(
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                text,
                style: TextStyle(
                    color: textColor,
                    fontSize: fontSize,
                    fontFamily: AnbyfontFamily.anbyFontMedium),
              ),
              showIcon
                  ? Icon(
                      iconData,
                      size: fontSize + 3,
                      color: textColor,
                    )
                  : Text('')
            ]),
      ),
    );
  }
}
