// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CartStore on _CartStore, Store {
  late final _$showLoaderAtom =
      Atom(name: '_CartStore.showLoader', context: context);

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

  late final _$cartListAtom =
      Atom(name: '_CartStore.cartList', context: context);

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

  late final _$loadInitDataAsyncAction =
      AsyncAction('_CartStore.loadInitData', context: context);

  @override
  Future loadInitData(BuildContext context) {
    return _$loadInitDataAsyncAction.run(() => super.loadInitData(context));
  }

  late final _$addToCartAsyncAction =
      AsyncAction('_CartStore.addToCart', context: context);

  @override
  Future addToCart(CartItem item) {
    return _$addToCartAsyncAction.run(() => super.addToCart(item));
  }

  late final _$removeToCartAsyncAction =
      AsyncAction('_CartStore.removeToCart', context: context);

  @override
  Future removeToCart(CartItem item) {
    return _$removeToCartAsyncAction.run(() => super.removeToCart(item));
  }

  @override
  String toString() {
    return '''
showLoader: ${showLoader},
cartList: ${cartList}
    ''';
  }
}
