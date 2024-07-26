import 'package:mobx/mobx.dart';
import 'package:mock_api_demo/app/core/local_db/entity/cart_item.dart';
import 'package:mock_api_demo/app/core/mobx/dashboard/cart/cart_store.dart';
import 'package:mock_api_demo/app/core/models/model.dart';
import 'package:mock_api_demo/app/core/repository/repository.dart';
import 'package:provider/provider.dart';

import '../../../../../utils/app_constant.dart';

part '../productDetail/product_detail_store.g.dart';

class ProductDetailStore = _ProductDetailStore with _$ProductDetailStore;

abstract class _ProductDetailStore with Store {
  final Repository authRepository;

  _ProductDetailStore({
    required this.authRepository,
  });

  late ProductData product;

  @observable
  bool subLoaderShow = false;

  @observable
  int productCount = 0;

  late CartStore cartStore;

  clearData() {
    productCount = 0;
  }

  @action
  loadInitData(ProductData productData) async {
    cartStore = Provider.of<CartStore>(globalContext!, listen: false);
    clearData();
    product = productData;

    for (var element in cartStore.cartList) {
      if(product.id==element.productId){
        productCount = element.quantity;
      }
    }
  }



  @action
  addToCart(){
    productCount++;
    var item = CartItem(
      name: product.name!,
      imageUrl: product.image!,
      productId: product.id,
      price: double.parse(product.price!),
      quantity: productCount
    );
    cartStore.addToCart(item);
  }

  @action
  removeToCart(){
    if(productCount>0){
      productCount--;
      var item = CartItem(
          name: product.name!,
          imageUrl: product.image!,
          productId: product.id,
          price: double.parse(product.price!),
          quantity: productCount
      );
      cartStore.addToCart(item);
    }
  }
}
