import 'package:anbyshop/screen/Home/components/header.dart';
import 'package:anbyshop/screen/Home/components/offerList.dart';

import 'package:anbyshop/util/colors.dart';

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
      body: Container(
        child: Column(
          children: [Header(), OfferList()],
        ),
      ),
    );
  }
}
