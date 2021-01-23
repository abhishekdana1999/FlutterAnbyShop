import 'package:flutter/material.dart';

class RoundedIconButton extends StatelessWidget {
  const RoundedIconButton(
      {Key key, @required this.iconData, @required this.press})
      : super(key: key);

  final IconData iconData;
  final GestureTapCallback press;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 50,
      child: FlatButton(
        onPressed: press,
        child: Center(child: Icon(iconData)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      ),
    );
  }
}
