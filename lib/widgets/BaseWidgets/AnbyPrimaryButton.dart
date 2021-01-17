import 'package:anbyshop/util/colors.dart';
import 'package:anbyshop/util/size.dart';
import 'package:flutter/material.dart';

class AnbyPrimaryButton extends StatelessWidget {
  final String btnText;
  final Color color;
  final bool outline;
  final double fontSize;
  final TextAlign textAlign;
  final IconData icon;
  const AnbyPrimaryButton(
      {Key key,
      this.btnText,
      this.color,
      this.fontSize,
      this.textAlign,
      this.icon,
      this.outline})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Border border = outline ? Border.all(color: color, width: 1.5) : null;
    final Color bakgroundColor = !outline ? color : null;
    final Color textcolor = !outline ? Colors.white : AnbyColors.PrimaryColor;

    return Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: bakgroundColor,
          borderRadius: BorderRadius.circular(AnbySize.baseSize / 3),
          border: border,
        ),
        padding: EdgeInsets.symmetric(
            vertical: AnbySize.basePadding * 2,
            horizontal: AnbySize.basePadding * 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              btnText,
              textAlign: textAlign,
              style: TextStyle(
                  color: textcolor,
                  fontSize: AnbySize.baseFontSize * 1.7,
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
