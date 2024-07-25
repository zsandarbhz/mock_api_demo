import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:mock_api_demo/app/core/mobx/common/common_store.dart';
import 'package:mock_api_demo/app/core/mobx/dashboard/dashboard_store.dart';
import 'package:mock_api_demo/app/core/models/model.dart';
import 'package:mock_api_demo/utils/common_functions.dart';
import 'package:mock_api_demo/view/dashboard/response/cartModel.dart';

part 'product_store.g.dart';

class ProductStore = _ProductStore with _$ProductStore;

abstract class _ProductStore with Store {

  @observable
  List<ProductData> products = [];

  @observable
  List<CartModel> cartList = [];

  bool subLoaderShow = false;

  @observable
  int categoryId = 0;

  CommonStore? commonStore;

  ScrollController? categoryScrollController;

  @action
  loadInitProduct(DashboardStore store, CommonStore store2) {
    commonStore = store2;

    products = commonStore!.productsList;
  }

  // bool showSubscriptionBtn(String productId) {
  //   // bool show = true;
  //   // for (var element in commonStore!.subscriptionList) {
  //   //   if (element.productId == productId) {
  //   //     show = false;
  //   //   }
  //   // }
  //   return show;
  // }

  @action
  onTapCategory(int catId) {
    // CommonFunctions.printLog("CAT:= $catId");
    // for (int i = 0; i < categories.length; i++) {
    //   if (categories[i].id == catId) {
    //     categories[i].isSelected = true;
    //     WidgetsBinding.instance.addPostFrameCallback((_) {
    //       // CommonFunctions.printLog('$totalLength');
    //       categoryScrollController!.animateTo(i*50,
    //           duration: Duration(milliseconds: 500), curve: Curves.ease);
    //     });
    //     // widget.store.categoryId
    //   } else {
    //     categories[i].isSelected = false;
    //   }
    // }
    //
    // products = updatedProductList();
  }

  int cartBasePrice() {
    int price = 0;
    // for (int i = 0; i < cartList.length; i++) {
    //   price = price +
    //       ((cartList[i].mrp! - cartList[i].discount!) * cartList[i].quantity!);
    // }
    return price;
  }

  // List<ProductData> updatedProductList() {
  //   List<ProductData> product = [];
  //   if (catId == 99999) {
  //     product = commonStore!.productsList;
  //   } else {
  //     product = commonStore!.productsList
  //         .where((product) => product.categoryId == catId)
  //         .toList();
  //   }
  //
  //   return product;
  // }

  @action
  addToCart(ProductData product) {
    bool isNotInserted = true;
    // for (int i = 0; i < cartList.length; i++) {
    //   if (cartList[i].productId == product.id) {
    //     cartList[i].quantity = cartList[i].quantity! + 1;
    //     isNotInserted = false;
    //   }
    // }
    // if (isNotInserted) {
    //   var data = CartModel(product.id, product.name!, 1, product.mrpPrice,
    //       product.discount, product);
    //   cartList.add(data);
    // }
    // CommonFunctions.printLog("CART=${cartList.toSet()}");
  }

  @action
  removeToCart(ProductData product) {
    // for (int i = 0; i < cartList.length; i++) {
    //   if (cartList[i].productId == product.id) {
    //     if (cartList[i].quantity! > 1) {
    //       cartList[i].quantity = cartList[i].quantity! - 1;
    //     } else {
    //       cartList.removeAt(i);
    //     }
    //   }
    // }
  }

  @action
  int productCount(String productId) {
    int count = 0;
    // for (int i = 0; i < cartList.length; i++) {
    //   if (cartList[i].productId == productId) {
    //     return cartList[i].quantity!;
    //   }
    // }
    return count;
  }
}
