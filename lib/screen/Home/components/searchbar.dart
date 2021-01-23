import 'package:anbyshop/util/inputWithIcon.dart';
import 'package:anbyshop/util/font_family.dart';
import 'package:anbyshop/util/size_config.dart';
import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomInputWithIcon(
      icon: Icons.search,
      hint: "Search Product",
      controller: null,
      disable: true,
      fontSize: AnbySize.baseFontSize,
      isPassword: false,
      key: null,
      type: TextInputType.text,
      maxLength: null,
      suffix: null,
    );
  }
}
