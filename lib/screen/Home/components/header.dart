import 'package:anbyshop/screen/Home/components/searchbar.dart';
import 'package:anbyshop/screen/Search/search.dart';

import 'package:anbyshop/services/user.service.dart';
import 'package:anbyshop/util/colors.dart';

import 'package:anbyshop/util/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'cartPage.dart';

class Header extends StatefulWidget {
  Header({Key key}) : super(key: key);

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  UserService userService = Get.put(UserService());

  void openSearch() async {
    await showSearch(context: context, delegate: ShopSearch(), query: '');
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _openCart() {
      Get.bottomSheet(CartComponent(), enableDrag: true);
    }

    return Container(
        color: AnbyColors.PrimaryColor,
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
                        icon: new Stack(
                          children: [
                            IconButton(
                              onPressed: _openCart,
                              icon: Icon(Icons.shopping_bag_outlined),
                              color: Colors.white,
                            ),
                            new Positioned(
                              right: 0,
                              top: 10,
                              child: new Container(
                                padding: EdgeInsets.all(1),
                                decoration: new BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                constraints: BoxConstraints(
                                  minWidth: 12,
                                  minHeight: 12,
                                ),
                                child: Obx(() => Text(
                                      userService.isUserLoading.isfalse
                                          ? userService
                                              .user.value.cart.products.length
                                              .toString()
                                          : "",
                                      style: new TextStyle(
                                        color: Colors.white,
                                        fontSize: 8,
                                      ),
                                      textAlign: TextAlign.center,
                                    )),
                              ),
                            )
                          ],
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
                child: GestureDetector(
                  child: SearchField(),
                  onTap: () {
                    openSearch();
                  },
                ))
          ],
        ));
  }
}
