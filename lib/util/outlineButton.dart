import 'package:anbyshop/util/colors.dart';
import 'package:flutter/material.dart';

class CustomOutlineButton extends StatelessWidget {
  final String btnText;
  const CustomOutlineButton({Key key, this.btnText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: CustomColors.PrimaryColor, width: 2),
          borderRadius: BorderRadius.circular(50)),
      padding: EdgeInsets.all(20),
      child: Center(
        child: Text(
          btnText,
          style: TextStyle(color: CustomColors.PrimaryColor, fontSize: 16),
        ),
      ),
    );
  }
}
