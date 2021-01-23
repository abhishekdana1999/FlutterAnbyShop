import 'package:anbyshop/models/user.dart';
import 'package:anbyshop/services/user.service.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class CartService extends GetxController {
  UserService userService = Get.find();
  var carterror = ''.obs;
  var isCartProductLoding = false.obs;
  CartService();

  @override
  void onInit() {
    super.onInit();
  }

  addItemToCart(CartProduct item, [int variantIndex]) async {
    try {
      isCartProductLoding(true);
      var productIndex = userService.user.value.cart.products
          .indexWhere((a) => a.id == item.id);
      if (productIndex == -1) {
        userService.user.value.cart.products.add(item);

        await userService.updateUser(userService.user.value);
        isCartProductLoding(false);
        return;
      } else {
        var product = userService.user.value.cart.products[productIndex];
        var findVarIndex = userService
            .user.value.cart.products[productIndex].productVariant
            .indexWhere((a) => a.id == item.productVariant[0].id);
        if (findVarIndex != -1) {
          if (variantIndex != null) {
            var productVariantFound = userService.user.value.cart
                .products[productIndex].productVariant[variantIndex];
            print(productVariantFound.value.toString());
            productVariantFound.qty = productVariantFound.qty + 1;
            await userService.updateUser(userService.user.value);
            isCartProductLoding(false);
          }
        } else {
          product.productVariant.add(item.productVariant[0]);
          await userService.updateUser(userService.user.value);
          isCartProductLoding(false);
        }

        return;
      }
    } catch (e) {
      isCartProductLoding(false);
      print(e);
    }
  }

  removeItemCart(productIndex, variantIndex) async {
    try {
      isCartProductLoding(true);
      var product = userService.user.value.cart.products[productIndex];
      if (product.productVariant[variantIndex].qty > 1) {
        product.productVariant[variantIndex].qty--;
        await userService.updateUser(userService.user.value);
        isCartProductLoding(false);
        return;
      } else {
        product.productVariant.removeAt(variantIndex);
        await userService.updateUser(userService.user.value);
        isCartProductLoding(false);
        if (userService
                .user.value.cart.products[productIndex].productVariant.length ==
            0) {
          userService.user.value.cart.products.removeAt(productIndex);
          await userService.updateUser(userService.user.value);
          isCartProductLoding(false);
        }

        return;
      }
    } catch (e) {
      isCartProductLoding(false);
      print(e);
    }
  }
}
