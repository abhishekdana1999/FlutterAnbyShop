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
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Color(0xFFBC7C7C7), width: 2),
          borderRadius: BorderRadius.circular(50)),
      child: Row(
        children: <Widget>[
          Container(
              width: 60,
              child: Icon(
                icon,
                size: 20,
                color: Color(0xFFBB9B9B9),
              )),
          Expanded(
            child: TextField(
              controller: controller,
              obscureText: isPassword,
              keyboardType: type,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 20),
                  border: InputBorder.none,
                  hintText: hint),
            ),
          )
        ],
      ),
    );
  }
}
