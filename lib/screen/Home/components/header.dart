import 'package:anbyshop/screen/Home/components/searchbar.dart';
import 'package:anbyshop/util/inputWithIcon.dart';
import 'package:anbyshop/util/size.dart';
import 'package:flutter/material.dart';

class Header extends StatefulWidget {
  Header({Key key}) : super(key: key);

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black,
        padding: EdgeInsets.only(
            top: AnbySize.basePadding * 4,
            left: AnbySize.basePadding * 2,
            right: AnbySize.basePadding * 2,
            bottom: AnbySize.basePadding * 2),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    icon: Icon(Icons.menu, color: Colors.white),
                    onPressed: () {}),
                Row(
                  children: [
                    IconButton(
                        icon: Icon(
                          Icons.shopping_bag_outlined,
                          color: Colors.white,
                        ),
                        onPressed: () {}),
                    IconButton(
                        icon: Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                        onPressed: () {}),
                  ],
                )
              ],
            ),
            Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.black,
                child: SearchField())
          ],
        ));
  }
}
