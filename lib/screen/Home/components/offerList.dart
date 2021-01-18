import 'dart:math';

import 'package:anbyshop/util/colors.dart';
import 'package:anbyshop/util/size.dart';
import 'package:anbyshop/widgets/offer/offer.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

final offerList = [
  {
    'color': Colors.black87,
    "image":
        "https://images.unsplash.com/photo-1610812035082-c14ee33cab1e?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=735&q=80"
  },
  {
    'color': Colors.black87,
    "image":
        "https://images.unsplash.com/photo-1610827294854-ca615b1620bb?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxMHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"
  },
  {
    'color': Colors.black87,
    "image":
        "https://images.unsplash.com/photo-1610822393951-572e0b8ae474?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxM3x8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"
  },
  {
    'color': Colors.black87,
    "image":
        "https://images.unsplash.com/photo-1610876371094-244b637600da?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxNnx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"
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
              child: Container(
                decoration: BoxDecoration(
                    color: offerList[i]['color'],
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          offset: Offset(3.0, 6.0),
                          blurRadius: 10.0)
                    ]),
                child: AspectRatio(
                  aspectRatio: cardAspactRatio,
                  child: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[],
                  ),
                ),
              ),
            ),
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
