// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'common_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CommonStore on _CommonStore, Store {
  late final _$showLoaderAtom =
      Atom(name: '_CommonStore.showLoader', context: context);

  @override
  bool get showLoader {
    _$showLoaderAtom.reportRead();
    return super.showLoader;
  }

  @override
  set showLoader(bool value) {
    _$showLoaderAtom.reportWrite(value, super.showLoader, () {
      super.showLoader = value;
    });
  }

  late final _$productsListAtom =
      Atom(name: '_CommonStore.productsList', context: context);

  @override
  List<ProductData> get productsList {
    _$productsListAtom.reportRead();
    return super.productsList;
  }

  @override
  set productsList(List<ProductData> value) {
    _$productsListAtom.reportWrite(value, super.productsList, () {
      super.productsList = value;
    });
  }

  late final _$cartListAtom =
      Atom(name: '_CommonStore.cartList', context: context);

  @override
  List<CartItem> get cartList {
    _$cartListAtom.reportRead();
    return super.cartList;
  }

  @override
  set cartList(List<CartItem> value) {
    _$cartListAtom.reportWrite(value, super.cartList, () {
      super.cartList = value;
    });
  }

  late final _$initializeServicesAsyncAction =
      AsyncAction('_CommonStore.initializeServices', context: context);

  @override
  Future initializeServices(BuildContext context) {
    return _$initializeServicesAsyncAction
        .run(() => super.initializeServices(context));
  }

  late final _$addProductInCartAsyncAction =
      AsyncAction('_CommonStore.addProductInCart', context: context);

  @override
  Future addProductInCart(ProductData product, int qty) {
    return _$addProductInCartAsyncAction
        .run(() => super.addProductInCart(product, qty));
  }

  @override
  String toString() {
    return '''
showLoader: ${showLoader},
productsList: ${productsList},
cartList: ${cartList}
    ''';
  }
}
