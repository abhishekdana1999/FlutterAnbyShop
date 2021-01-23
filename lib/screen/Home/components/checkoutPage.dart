import 'package:flutter/material.dart';

class CheckOutPage extends StatefulWidget {
  CheckOutPage({Key key}) : super(key: key);

  @override
  _CheckOutPageState createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: Container(
        child: Text("Checkout Page"),
      ),
    );
  }
}
