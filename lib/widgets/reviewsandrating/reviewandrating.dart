import 'package:anbyshop/util/font_family.dart';
import 'package:anbyshop/util/size_config.dart';
import 'package:anbyshop/widgets/BaseWidgets/AnbyIconBadge.dart';
import 'package:flutter/material.dart';

class RatingsAndReview extends StatelessWidget {
  final size;
  final rating;
  final text;
  const RatingsAndReview({
    Key key,
    product,
    this.size,
    this.rating,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var fontSize = AnbySize.baseFontSize;

    switch (this.size) {
      case 'SM':
        fontSize = fontSize * 0.9;
        break;
      case 'LG':
        fontSize = fontSize * 1.2;
        break;
      default:
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        AnbyIconBadge(
          text: rating.toString(),
          borderRadius: fontSize / 4,
          color: Colors.green,
          fontSize: fontSize * 1.5,
          height: fontSize * 3,
          width: fontSize * 7,
          iconData: Icons.star,
          textColor: Colors.white,
        ),
        Container(
            margin: EdgeInsets.only(left: fontSize / 2),
            child: Text(
              text,
              style: TextStyle(
                  fontSize: fontSize * 1.5,
                  fontFamily: AnbyfontFamily.anbyFontMedium,
                  color: Colors.black54),
            )),
      ],
    );
  }
}
