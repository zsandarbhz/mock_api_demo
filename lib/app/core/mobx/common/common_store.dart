import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mobx/mobx.dart';
import 'package:mock_api_demo/app/core/local_db/database/database.dart';
import 'package:mock_api_demo/app/core/local_db/entity/cart_item.dart';
import 'package:mock_api_demo/app/core/repository/repository.dart';
import 'package:mock_api_demo/app/routes/paths.dart';
import 'package:mock_api_demo/utils/app_toast.dart';
import 'package:mock_api_demo/utils/common_functions.dart';

import '../../models/model.dart';

part 'common_store.g.dart';

class CommonStore = _CommonStore with _$CommonStore;

abstract class _CommonStore with Store {
  final Repository authRepository;
  final AppDatabase database;
  BuildContext? con;

  @observable
  bool showLoader = false;

  _CommonStore({required this.authRepository, required this.database});

  @observable
  List<ProductData> productsList = [];

  @observable
  List<CartItem> cartList = [];

  @action
  initializeServices(BuildContext context) async {
    con = context;
    bool result = await InternetConnectionChecker().hasConnection;
    if (result == true) {
      fetchData(context);
    } else {
      AppToast.showError("No internet connection");
    }
  }

  fetchData(BuildContext context) async {
    CommonFunctions.printLog("fetchData");
    showLoader = true;
    final List<Future<dynamic>> fetcher = [
      // categoryListApi(),
      productListApi(),
    ];
    var results = await Future.wait(fetcher);
    showLoader = false;
    // categoriesList = results[0];
    productsList = results[0];

    Navigator.pushReplacementNamed(context, Paths.dashboardScreen);
  }

  clearData() {
    productsList.clear();
  }

  fetchCartData() async {
    cartList = await database.cartDao.findAllCartItems();
  }

  @action
  addProductInCart(ProductData product, int qty) async {
    var item = CartItem(
      productId: product.id!,
      name: product.name!,
      imageUrl: product.image!,
      price: double.parse(product.price!),
      quantity: qty
    );
    database.cartDao.insertCartItem(item);
  }

  // -------------------------------API CALLING---------------------------------------


  Future<List<ProductData>> productListApi() async {
    List<ProductData> list = [];
    try {
      var response = await authRepository.getProducts();
      if (response.status!) {
        list.addAll(response.data!);
      }
    } catch (e) {
      CommonFunctions.printLog("Product Error:-${e.toString()}");
    }
    return list;
  }
}
