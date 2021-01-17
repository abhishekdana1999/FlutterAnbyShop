import 'package:anbyshop/util/colors.dart';
import 'package:anbyshop/util/size.dart';
import 'package:flutter/material.dart';

class CustomInputWithIcon extends StatelessWidget {
  final TextEditingController controller;
  final IconData icon;
  final String hint;
  final TextInputType type;
  final bool isPassword;
  final int maxLength;
  final double fontSize;
  final Widget suffix;
  final bool disable;

  const CustomInputWithIcon({
    Key key,
    this.controller,
    this.icon,
    this.hint,
    this.type,
    this.isPassword,
    this.maxLength,
    this.fontSize,
    this.disable,
    this.suffix,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isSuffix = suffix != null ? true : false;
    final InputBorder border = new OutlineInputBorder(
      borderSide: new BorderSide(color: Colors.grey[500], width: 1),
    );

    var inputDecoration = InputDecoration(
        contentPadding: EdgeInsets.symmetric(
            vertical: AnbySize.baseSize, horizontal: AnbySize.baseSize * 3),
        border: border,
        isDense: true,
        enabledBorder: border,
        disabledBorder: border,
        focusedBorder: border,
        filled: true,
        fillColor: Colors.white,
        prefixIcon: Icon(
          icon,
          size: AnbySize.baseFontSize * 3,
          color: AnbyColors.PrimaryColor,
        ),
        suffix: isSuffix ? suffix : null,
        hintText: hint);
    return TextFormField(
      enabled: !this.disable,
      controller: controller,
      obscureText: isPassword,
      keyboardType: type,
      style: TextStyle(
          fontSize: AnbySize.baseFontSize * 1.7,
          fontFamily: AnbyfontFamily.anbyFontRegular),
      maxLength: type == TextInputType.phone ? maxLength : null,
      buildCounter: (BuildContext context,
              {int currentLength, int maxLength, bool isFocused}) =>
          null,
      decoration: inputDecoration,
    );
  }
}
