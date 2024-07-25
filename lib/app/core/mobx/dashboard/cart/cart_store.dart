import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:mock_api_demo/app/core/local_db/database/database.dart';
import 'package:mock_api_demo/app/core/local_db/entity/cart_item.dart';
import 'package:mock_api_demo/app/core/mobx/common/common_store.dart';
import 'package:mock_api_demo/app/core/repository/repository.dart';
import 'package:mock_api_demo/utils/app_toast.dart';
import 'package:provider/provider.dart';

part 'cart_store.g.dart';

class CartStore = _CartStore with _$CartStore;

abstract class _CartStore with Store {
  final Repository authRepository;
  final AppDatabase database;

  _CartStore({required this.authRepository, required this.database});

  @observable
  bool showLoader = false;
  @observable
  List<CartItem> cartList = [];

  late CommonStore commonStore;

  double totalPrice = 0;

  @action
  loadInitData(BuildContext context) async {
    commonStore = Provider.of<CommonStore>(context, listen: false);
    fetchCartData();
  }

  @action
  addToCart(CartItem item) async {
    showLoader = true;
    var data = await database.cartDao.findProductById(item.productId!);
    if(data!=null){
      await database.cartDao.updateCartItem(item);
    }else{
      await database.cartDao.insertCartItem(item);
    }
   fetchCartData();
    showLoader = false;
  }

  Future<int> getItemCount(String productId)async{
    int count = 0;
    var data = await database.cartDao.findProductById(productId);
    if(data!=null){
      count = data.quantity;
    }
    return count;
  }

  @action
  removeToCart(CartItem item) async {
    await database.cartDao.deleteCartItem(item);
    fetchCartData();
  }

  fetchCartData() async {
    cartList = await database.cartDao.findAllCartItems();
    totalPrice = 0;
    for (var element in cartList) {
      totalPrice = totalPrice + (element.price*element.quantity);
    }
  }

  confirmOrder(BuildContext context) async {
    await database.cartDao.clearCart();
    // fetchCartData();
    AppToast.showSuccess("Order Summited");
    // Navigator.pop(context);
  }
}
