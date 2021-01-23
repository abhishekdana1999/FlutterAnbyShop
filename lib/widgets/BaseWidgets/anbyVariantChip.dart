import 'package:anbyshop/util/colors.dart';
import 'package:anbyshop/util/font_family.dart';
import 'package:anbyshop/util/size_config.dart';
import 'package:anbyshop/widgets/BaseWidgets/AnbyIconBadge.dart';
import 'package:flutter/material.dart';

class AnbyVariantChip extends StatelessWidget {
  final isActive;
  final variant;
  final size;
  const AnbyVariantChip({
    this.variant,
    Key key,
    this.isActive = false,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (this.isActive) {
      return ActiveVariant(variant: variant, size: size);
    } else {
      return InActiveVariant(variant: variant, size: size);
    }
  }
}

class InActiveVariant extends StatelessWidget {
  final variant;
  final size;

  const InActiveVariant({
    Key key,
    this.variant,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var fontSize = AnbySize.baseFontSize;
    switch (size) {
      case 'SM':
        fontSize = AnbySize.baseFontSize / 1.2;
        break;
      default:
    }

    return AnbyIconBadge(
      text: this.variant.value.toString(),
      borderRadius: fontSize * 4,
      color: Colors.grey[300],
      fontSize: fontSize * 1.5,
      height: fontSize * 3,
      width: fontSize * 9,
      showIcon: false,
      textColor: Colors.grey[900],
    );
  }
}

class ActiveVariant extends StatelessWidget {
  final variant;
  final size;

  const ActiveVariant({
    Key key,
    this.variant,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var fontSize = AnbySize.baseFontSize;
    switch (size) {
      case 'SM':
        fontSize = AnbySize.baseFontSize / 1.2;
        break;
      default:
    }
    return AnbyIconBadge(
      text: this.variant.value.toString(),
      borderRadius: fontSize * 4,
      color: AnbyColors.PrimaryColor,
      fontSize: fontSize * 1.2,
      height: fontSize * 3,
      width: fontSize * 9,
      showIcon: true,
      iconData: Icons.check,
      textColor: Colors.white,
    );
  }
}
