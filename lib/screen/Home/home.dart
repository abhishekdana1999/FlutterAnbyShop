import 'package:anbyshop/screen/Home/components/categoryList.dart';
import 'package:anbyshop/screen/Home/components/header.dart';
import 'package:anbyshop/screen/Home/components/offerList.dart';

import 'package:anbyshop/util/colors.dart';
import 'package:anbyshop/util/size.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.black));
    super.initState();
  }

  final TextEditingController _searchBarController =
      new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AnbyColors.pageBackgroundColor,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Positioned(top: 0, child: Header()),
              OfferList(),
              AnbyGap(),
              CategoryList()
            ],
          ),
        ),
      ),
    );
  }
}

class AnbyGap extends StatelessWidget {
  const AnbyGap({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AnbySize.baseSize * 1.2,
      decoration: BoxDecoration(color: AnbyColors.pageBackgroundColor),
    );
  }
}
