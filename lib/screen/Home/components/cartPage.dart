import 'package:anbyshop/models/checkout.dart';
import 'package:anbyshop/screen/Home/components/checkoutPage.dart';
import 'package:anbyshop/services/cart.service.dart';
import 'package:anbyshop/services/checkout.service.dart';
import 'package:anbyshop/services/user.service.dart';
import 'package:anbyshop/util/colors.dart';
import 'package:anbyshop/util/font_family.dart';
import 'package:anbyshop/util/size_config.dart';
import 'package:anbyshop/widgets/BaseWidgets/AnbyPrimaryButton.dart';
import 'package:anbyshop/widgets/Gap/anbyGap.dart';
import 'package:anbyshop/widgets/productCard/productCartVerticalCard.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartComponent extends StatefulWidget {
  const CartComponent({Key key}) : super(key: key);

  @override
  _CartComponentState createState() => _CartComponentState();
}

class _CartComponentState extends State<CartComponent> {
  CheckoutService checkoutService = Get.put(CheckoutService(), permanent: true);

  @override
  void dispose() {
    checkoutService.makeOrder().then((value) => print(value));
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    CartService cartService = Get.find();
    UserService userService = Get.find();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          height: MediaQuery.of(context).size.height / 1.5,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(
              //  top: AnbySize.basePadding * 5,
              left: AnbySize.basePadding / 4,
              right: AnbySize.basePadding / 4),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10))),
          child:
              Stack(overflow: Overflow.visible, fit: StackFit.loose, children: [
            SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(top: AnbySize.baseMargin * 4),
                child: Obx(
                  () => cartService.isCartProductLoding.isfalse
                      ? Column(
                          children: List.generate(
                            userService.user.value.cart.products.length,
                            (index) => ProductCartVerticalCard(
                              product:
                                  userService.user.value.cart.products[index],
                              productIndex: index,
                            ),
                          ),
                        )
                      : Container(
                          height: MediaQuery.of(context).size.height / 2,
                          width: MediaQuery.of(context).size.width,
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                ),
              ),
            ),
          ])),
      persistentFooterButtons: [
        Container(
          child: GestureDetector(
            onTap: () async {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return CheckOutPage();
                },
              ));
            },
            child: AnbyPrimaryButton(
              btnText: "Checkout",
              outline: false,
              color: AnbyColors.PrimaryColor,
              fontSize: AnbySize.baseFontSize,
              icon: Icons.arrow_right,
              textAlign: null,
            ),
          ),
        )
      ],
    );
  }
}

// Obx(() => cartService.isCartProductLoding.isfalse &&
//                   userService.user.value.cart.products.length != 0
//               ? Container(
//                   width: MediaQuery.of(context).size.width,
//                   decoration: BoxDecoration(
//                       border: Border(
//                           bottom:
//                               BorderSide(width: 1, color: Colors.grey[300]))),
//                   child: Row(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       Container(
//                         height: 120,
//                         width: 100,
//                         child: Image.network(
//                           userService
//                               .user.value.cart.products[index].productImage.url,
//                           fit: BoxFit.contain,
//                         ),
//                       ),
//                       Container(
//                         width: MediaQuery.of(context).size.width / 1.8,
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               userService
//                                   .user.value.cart.products[index].productName,
//                               overflow: TextOverflow.ellipsis,
//                               style: TextStyle(
//                                   fontSize: AnbySize.baseFontSize * 1.5,
//                                   fontWeight: FontWeight.w600),
//                             ),
//                             AnbyGap(),
//                             Column(
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               children: List.generate(
//                                 userService.user.value.cart.products[index]
//                                     .productVariant.length,
//                                 (varIndex) => Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   crossAxisAlignment: CrossAxisAlignment.center,
//                                   children: [
//                                     Container(
//                                       child: RichText(
//                                         text: new TextSpan(children: [
//                                           new TextSpan(
//                                             text: '₹ ' +
//                                                 userService
//                                                     .user
//                                                     .value
//                                                     .cart
//                                                     .products[index]
//                                                     .productVariant[varIndex]
//                                                     .sellingPrice
//                                                     .toString() +
//                                                 ' x ',
//                                             style: TextStyle(
//                                                 color: Colors.green,
//                                                 fontSize:
//                                                     AnbySize.baseFontSize * 1.5,
//                                                 fontFamily: AnbyfontFamily
//                                                     .anbyFontMedium),
//                                           ),
//                                           new TextSpan(
//                                             text: userService
//                                                     .user
//                                                     .value
//                                                     .cart
//                                                     .products[index]
//                                                     .productVariant[varIndex]
//                                                     .qty
//                                                     .toString() +
//                                                 ' x ',
//                                             style: TextStyle(
//                                                 color: Colors.black,
//                                                 fontSize:
//                                                     AnbySize.baseFontSize * 1.5,
//                                                 fontFamily: AnbyfontFamily
//                                                     .anbyFontMedium),
//                                           ),
//                                           new TextSpan(
//                                             text: userService
//                                                 .user
//                                                 .value
//                                                 .cart
//                                                 .products[index]
//                                                 .productVariant[varIndex]
//                                                 .value
//                                                 .toString(),
//                                             style: TextStyle(
//                                                 color: Colors.black,
//                                                 fontSize:
//                                                     AnbySize.baseFontSize * 1.5,
//                                                 fontFamily: AnbyfontFamily
//                                                     .anbyFontMedium),
//                                           )
//                                         ]),
//                                       ),
//                                     ),
//                                     Container(
//                                       child: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceAround,
//                                         children: [
//                                           GestureDetector(
//                                             onTap: () {
//                                               setState(() {
//                                                 cartService.removeItemCart(
//                                                     index, varIndex);
//                                               });
//                                             },
//                                             child: Chip(
//                                               label: Text("-"),
//                                               materialTapTargetSize:
//                                                   MaterialTapTargetSize
//                                                       .shrinkWrap,
//                                             ),
//                                           ),
//                                           Text(' ' +
//                                               userService
//                                                   .user
//                                                   .value
//                                                   .cart
//                                                   .products[index]
//                                                   .productVariant[varIndex]
//                                                   .qty
//                                                   .toString() +
//                                               ' '),
//                                           GestureDetector(
//                                             onTap: () {
//                                               setState(() {
//                                                 cartService.addItemToCart(
//                                                     userService.user.value.cart
//                                                         .products[index],
//                                                     varIndex);
//                                               });
//                                             },
//                                             child: Chip(
//                                               label: Text("+"),
//                                               materialTapTargetSize:
//                                                   MaterialTapTargetSize
//                                                       .shrinkWrap,
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             )
//                           ],
//                         ),
//                       )
//                     ],
//                   ),
//                 )
//               : userService.user.value.cart.products.length == 0
//                   ? Center(
//                       child: Text("No Products Found"),
//                     )
//                   : CircularProgressIndicator());
