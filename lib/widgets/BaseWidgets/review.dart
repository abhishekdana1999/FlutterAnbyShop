import 'package:anbyshop/util/font_family.dart';
import 'package:anbyshop/util/size_config.dart';
import 'package:anbyshop/widgets/Gap/anbyGap.dart';
import 'package:anbyshop/widgets/reviewsandrating/reviewandrating.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Review extends StatelessWidget {
  const Review({
    Key key,
    @required this.review,
  }) : super(key: key);
  final review;

  @override
  Widget build(BuildContext context) {
    debugPrint(review.toString());
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1.0, color: Colors.grey[300]),
        ),
      ),
      padding: EdgeInsets.all(AnbySize.basePadding * 2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RatingsAndReview(
            product: "4.5",
            text: "",
            rating: review.rate,
          ),
          AnbyGap(),
          Text(
            review.message,
            style: TextStyle(
                fontSize: AnbySize.baseFontSize * 1.5,
                color: Colors.black54,
                fontFamily: AnbyfontFamily.anbyFontMedium),
          ),
          AnbyGap(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                review.name,
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: AnbySize.baseFontSize * 1.6, color: Colors.grey),
              ),
              Text(
                DateFormat(review.date.toString()).format(DateTime.now()),
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: AnbySize.baseFontSize * 1.4, color: Colors.grey),
              )
            ],
          )
        ],
      ),
    );
  }
}
