import 'dart:math';

import 'package:anbyshop/util/colors.dart';
import 'package:anbyshop/util/font_family.dart';
import 'package:anbyshop/widgets/offer/offer.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

final offerList = [
  {
    'color': Colors.black87,
    "image":
        "https://static.soft-impressions.com/softimpression/offer/big%20grocery%20sale%20%281%29-compressed.jpg"
  },
  {
    'color': Colors.black87,
    "image":
        "https://static.soft-impressions.com/softimpression/offer/snaks%20%281%29.png"
  },
  {
    'color': Colors.black87,
    "image":
        "https://static.soft-impressions.com/softimpression/offer/healthy%20breakfast%20%281%29.png"
  },
  {
    'color': Colors.black87,
    "image":
        "https://static.soft-impressions.com/softimpression/offer/banner%20havells-compressed.jpg"
  }
];

class OfferList extends StatefulWidget {
  OfferList({Key key}) : super(key: key);

  @override
  _OfferListState createState() => _OfferListState();
}

var cardAspactRatio = 16.0 / 14.0;
var widgetAspactRatio = cardAspactRatio * 1.2;

class _OfferListState extends State<OfferList>
    with SingleTickerProviderStateMixin {
  var currentPage = offerList.length - 1.0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    PageController controller =
        PageController(initialPage: offerList.length - 1);
    controller.addListener(() {
      setState(() {
        currentPage = controller.page;
      });
    });

    return Container(
      color: Colors.white,
      child: Stack(
        children: <Widget>[
          CardScrollWidget(currentPage),
          Positioned.fill(
            child: PageView.builder(
              itemCount: offerList.length,
              controller: controller,
              reverse: true,
              itemBuilder: (context, index) {
                return Container();
              },
            ),
          )
        ],
      ),
    );
  }
}

class CardScrollWidget extends StatelessWidget {
  var currentPage;
  var padding = 20.0;
  var verticalInset = 10.0;

  CardScrollWidget(this.currentPage);

  @override
  Widget build(BuildContext context) {
    return new AspectRatio(
      aspectRatio: widgetAspactRatio,
      child: LayoutBuilder(builder: (context, contraints) {
        var width = contraints.maxWidth;
        var height = contraints.maxHeight;

        var safeWidth = width - 2 * padding;
        var safeHeight = height - 2 * padding;

        var heightOfPrimaryCard = safeHeight;
        var widthOfPrimaryCard = heightOfPrimaryCard * cardAspactRatio;

        var primaryCardLeft = safeWidth - widthOfPrimaryCard;
        var horizontalInset = primaryCardLeft / 3.5;

        List<Widget> cardList = new List();

        for (var i = 0; i < offerList.length; i++) {
          var delta = (i - currentPage);
          bool isOnRight = delta > 0;

          var start = padding +
              max(
                  primaryCardLeft -
                      horizontalInset * -delta * (isOnRight ? 15 : 1),
                  0.0);

          var cardItem = Positioned.directional(
            top: padding + verticalInset * max(-delta, 0.0),
            bottom: padding + verticalInset * max(-delta, 0.0),
            start: start,
            textDirection: TextDirection.rtl,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Offer(
                  offer: offerList[i],
                )),
          );
          cardList.add(cardItem);
        }
        return Stack(
          children: cardList,
        );
      }),
    );
  }
}
