import 'package:anbyshop/services/checkout.service.dart';
import 'package:anbyshop/services/user.service.dart';
import 'package:anbyshop/util/colors.dart';
import 'package:anbyshop/util/font_family.dart';
import 'package:anbyshop/util/size_config.dart';
import 'package:anbyshop/widgets/Gap/anbyGap.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckOutPage extends StatefulWidget {
  CheckOutPage({Key key}) : super(key: key);

  @override
  _CheckOutPageState createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  CheckoutService checkoutService = Get.find();

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          leading: new IconButton(
              icon: new Icon(Icons.arrow_back),
              onPressed: () {
                Get.back();
              }),
          backgroundColor: Colors.white,
          title: Text(
            "CHECKOUT",
            style: TextStyle(
                fontSize: AnbySize.baseFontSize * 1.5,
                fontFamily: AnbyfontFamily.anbyFontMedium),
          ),
          elevation: 0,
        ),
        body: Obx(() => checkoutService.isCheckoutLoading.isfalse
            ? SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(AnbySize.basePadding),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: AnbySize.basePadding * 1.5,
                            vertical: AnbySize.basePadding * 2),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Ship to",
                              style: TextStyle(
                                  fontSize: AnbySize.baseFontSize * 1.8,
                                  color: Colors.black54,
                                  fontFamily: AnbyfontFamily.anbyFontRegular),
                            ),
                            AnbyGap(
                              color: Colors.transparent,
                            ),
                            Text(
                              checkoutService
                                      .checkout.value.shippingAddress.roomNo +
                                  ' ' +
                                  checkoutService.checkout.value.shippingAddress
                                      .buildingName +
                                  ' ' +
                                  checkoutService.checkout.value.shippingAddress
                                      .addressLine1 +
                                  ' ' +
                                  checkoutService
                                      .checkout.value.shippingAddress.landMark +
                                  ' ' +
                                  checkoutService
                                      .checkout.value.shippingAddress.city +
                                  ' ' +
                                  checkoutService
                                      .checkout.value.shippingAddress.district +
                                  ' ' +
                                  checkoutService
                                      .checkout.value.shippingAddress.state +
                                  ' ' +
                                  checkoutService
                                      .checkout.value.shippingAddress.pincode
                                      .toString(),
                              style: TextStyle(
                                fontSize: AnbySize.baseFontSize * 1.8,
                                color: Colors.black54,
                              ),
                              maxLines: 3,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: AnbySize.basePadding * 1.5,
                            vertical: AnbySize.basePadding),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Order",
                              style: TextStyle(
                                  fontSize: AnbySize.baseFontSize * 1.8,
                                  color: Colors.black54,
                                  fontFamily: AnbyfontFamily.anbyFontRegular),
                            ),
                            AnbyGap(
                              color: Colors.transparent,
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: List.generate(
                                  checkoutService
                                      .checkout.value.products.length,
                                  (index) => Container(
                                      width: MediaQuery.of(context).size.width /
                                          1.2,
                                      margin: EdgeInsets.symmetric(
                                          horizontal: AnbySize.baseMargin / 2),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(
                                              AnbySize.baseSize / 5),
                                          border: Border.all(
                                              color: AnbyColors.PrimaryColor,
                                              width: 1)),
                                      child: Row(
                                        children: [
                                          Flexible(
                                              flex: 1,
                                              fit: FlexFit.tight,
                                              child: Container(
                                                height: 100,
                                                width: 100,
                                                child: Image.network(
                                                    checkoutService
                                                        .checkout
                                                        .value
                                                        .products[index]
                                                        .productImage
                                                        .url),
                                              )),
                                          Expanded(
                                              child: Column(
                                            children: [],
                                          ))
                                        ],
                                      )),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "      Apply Discount",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, top: 10),
                        child: Row(
                          children: [
                            FlatButton(
                              height: 45,
                              minWidth: MediaQuery.of(context).size.width / 1.8,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                Radius.circular(25),
                              )),
                              color: Colors.black12,
                              onPressed: () {},
                              child: Padding(
                                padding: const EdgeInsets.only(right: 90),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.mic_off_outlined,
                                      color: Colors.black26,
                                      size: 20,
                                    ),
                                    Text(
                                      "    COUPON CODE",
                                      style: TextStyle(color: Colors.black26),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Text(
                              "   APPLY",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.orange[800],
                              ),
                            )
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Text(
                                "     Total Amount",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                "                      Rs.1289.6",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                              Icon(
                                Icons.arrow_upward,
                                size: 20,
                                color: Colors.black,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 42,
                          ),
                          FlatButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(22),
                              ),
                            ),
                            height: 50,
                            minWidth: 350,
                            color: Colors.orange[900],
                            onPressed: () {},
                            child: Text(
                              "CHECKOUT",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            : Center(
                child: CircularProgressIndicator(),
              )));
  }
}
