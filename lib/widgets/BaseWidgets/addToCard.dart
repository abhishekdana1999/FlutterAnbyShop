import 'package:anbyshop/util/colors.dart';
import 'package:anbyshop/util/font_family.dart';
import 'package:anbyshop/util/size_config.dart';
import 'package:flutter/material.dart';

class AnbyAddToCartButton extends StatelessWidget {
  final String btnText;
  final Color color;
  final bool outline;
  final double fontSize;
  final TextAlign textAlign;
  final IconData icon;
  final double width;
  const AnbyAddToCartButton(
      {Key key,
      this.btnText,
      this.color,
      this.fontSize,
      this.textAlign,
      this.icon,
      this.outline,
      this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Border border = outline ? Border.all(color: color, width: 1.5) : null;
    final Color bakgroundColor = !outline ? AnbyColors.PrimaryColor : null;
    final Color textcolor = !outline ? Colors.white : AnbyColors.PrimaryColor;

    return Container(
        width: width,
        decoration: BoxDecoration(
          color: bakgroundColor,
          borderRadius: BorderRadius.circular(AnbySize.baseSize / 3),
          border: border,
        ),
        padding: EdgeInsets.symmetric(
            vertical: AnbySize.basePadding * 1.3,
            horizontal: AnbySize.basePadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              btnText,
              textAlign: textAlign,
              style: TextStyle(
                  color: textcolor,
                  fontSize: AnbySize.baseFontSize * 1.2,
                  fontFamily: AnbyfontFamily.anbyFontRegular),
            ),
            Icon(
              icon,
              size: AnbySize.baseFontSize * 2,
              color: textcolor,
            )
          ],
        ));
  }
}
