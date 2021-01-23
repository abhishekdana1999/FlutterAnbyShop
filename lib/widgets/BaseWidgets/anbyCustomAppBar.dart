import 'package:anbyshop/util/font_family.dart';
import 'package:anbyshop/util/size_config.dart';
import 'package:anbyshop/widgets/BaseWidgets/roundedIconButton.dart';
import 'package:anbyshop/widgets/reviewsandrating/reviewandrating.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends PreferredSize {
  final double rating;
  final Color backgroundColor;

  CustomAppBar(this.rating, this.backgroundColor);

  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: backgroundColor,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AnbySize.basePadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RoundedIconButton(
                iconData: Icons.arrow_back_ios,
                press: () => Navigator.pop(context),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    RatingsAndReview(
                      product: null,
                      rating: "4.5",
                      text: "1,500 ratings",
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
