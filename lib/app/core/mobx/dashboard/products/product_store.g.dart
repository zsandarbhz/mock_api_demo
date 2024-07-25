// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProductStore on _ProductStore, Store {
  late final _$productsAtom =
      Atom(name: '_ProductStore.products', context: context);

  @override
  List<ProductData> get products {
    _$productsAtom.reportRead();
    return super.products;
  }

  @override
  set products(List<ProductData> value) {
    _$productsAtom.reportWrite(value, super.products, () {
      super.products = value;
    });
  }

  late final _$cartListAtom =
      Atom(name: '_ProductStore.cartList', context: context);

  @override
  List<CartModel> get cartList {
    _$cartListAtom.reportRead();
    return super.cartList;
  }

  @override
  set cartList(List<CartModel> value) {
    _$cartListAtom.reportWrite(value, super.cartList, () {
      super.cartList = value;
    });
  }

  late final _$categoryIdAtom =
      Atom(name: '_ProductStore.categoryId', context: context);

  @override
  int get categoryId {
    _$categoryIdAtom.reportRead();
    return super.categoryId;
  }

  @override
  set categoryId(int value) {
    _$categoryIdAtom.reportWrite(value, super.categoryId, () {
      super.categoryId = value;
    });
  }

  late final _$_ProductStoreActionController =
      ActionController(name: '_ProductStore', context: context);

  @override
  dynamic loadInitProduct(DashboardStore store, CommonStore store2) {
    final _$actionInfo = _$_ProductStoreActionController.startAction(
        name: '_ProductStore.loadInitProduct');
    try {
      return super.loadInitProduct(store, store2);
    } finally {
      _$_ProductStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onTapCategory(int catId) {
    final _$actionInfo = _$_ProductStoreActionController.startAction(
        name: '_ProductStore.onTapCategory');
    try {
      return super.onTapCategory(catId);
    } finally {
      _$_ProductStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addToCart(ProductData product) {
    final _$actionInfo = _$_ProductStoreActionController.startAction(
        name: '_ProductStore.addToCart');
    try {
      return super.addToCart(product);
    } finally {
      _$_ProductStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic removeToCart(ProductData product) {
    final _$actionInfo = _$_ProductStoreActionController.startAction(
        name: '_ProductStore.removeToCart');
    try {
      return super.removeToCart(product);
    } finally {
      _$_ProductStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  int productCount(String productId) {
    final _$actionInfo = _$_ProductStoreActionController.startAction(
        name: '_ProductStore.productCount');
    try {
      return super.productCount(productId);
    } finally {
      _$_ProductStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
products: ${products},
cartList: ${cartList},
categoryId: ${categoryId}
    ''';
  }
}
