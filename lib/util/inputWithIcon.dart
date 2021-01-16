import 'package:anbyshop/util/colors.dart';
import 'package:flutter/material.dart';

class CustomInputWithIcon extends StatelessWidget {
  final TextEditingController controller;
  final IconData icon;
  final String hint;
  final TextInputType type;
  final bool isPassword;
  const CustomInputWithIcon(
      {Key key,
      this.controller,
      this.icon,
      this.hint,
      this.type,
      this.isPassword})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      keyboardType: type,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          border: new OutlineInputBorder(
            borderSide:
                new BorderSide(color: CustomColors.PrimaryColor, width: 2),
          ),
          focusedBorder: new OutlineInputBorder(
            borderSide:
                new BorderSide(color: CustomColors.PrimaryColor, width: 2),
          ),
          prefixIcon: Icon(
            icon,
            size: 16,
            color: CustomColors.PrimaryColor,
          ),
          hintText: hint),
    );
  }
}
