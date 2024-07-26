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

  CommonStore? commonStore;

  ScrollController? categoryScrollController;

  @action
  loadInitProduct(CommonStore store2) {
    commonStore = store2;
    products = commonStore!.productsList;
  }

}
